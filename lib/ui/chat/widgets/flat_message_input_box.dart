// ignore_for_file: deprecated_member_use_from_same_package, unnecessary_statements, deprecated_member_use

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:togodo/core/component/button/custom_circle_button.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/network/api/app_dio.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/chat/services/post_service.dart';
import 'package:togodo/ui/chat/view_model/message_details_view_model.dart';
import 'package:togodo/ui/chat/widgets/sound_recoder_button.dart';

import '../../group/view_model/event_group_detail_view_model.dart';

class FlatMessageInputBox extends StatefulHookConsumerWidget {
  const FlatMessageInputBox({
    required this.controller,
    required this.isSearchRoute,
    required this.roomId,
    super.key,
    this.prefix,
    this.suffix,
    this.focusNode,
    this.roundedCorners,
    this.onChanged,
    this.onSubmitted,
    this.rightIcon = true,
    this.inputMessage,
    this.isNew,
  });
  final Widget? prefix;
  final Widget? suffix;
  final bool? roundedCorners;
  final bool rightIcon;
  final bool? isNew;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final TextEditingController controller;
  final String? inputMessage;
  final FocusNode? focusNode;
  final bool isSearchRoute;
  final String roomId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FlatMessageInputBoxState();
}

class _FlatMessageInputBoxState extends ConsumerState<FlatMessageInputBox>
    with WidgetsBindingObserver {
  bool isKeyboardOpen = false;
  String path = '';
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    final isKeyboardOpenNow =
        WidgetsBinding.instance.window.viewInsets.bottom > 0;
    if (isKeyboardOpen != isKeyboardOpenNow) {
      setState(() {
        isKeyboardOpen = isKeyboardOpenNow;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final model = ref.watch(messageDetailsProvider(widget.roomId));
    final viewModel = (true == widget.isNew
        ? ref.read(eventGroupDetailsProvider(widget.roomId))
        : ref.read(
            messageDetailsProvider(widget.roomId),
          ));
    final notifier = (true == widget.isNew
        ? ref.read(eventGroupDetailsProvider(widget.roomId).notifier)
        : ref.read(
            messageDetailsProvider(widget.roomId).notifier,
          ));

    double cornerRadius() {
      if (widget.roundedCorners != null && widget.roundedCorners! == true) {
        return 60;
      } else {
        return 0;
      }
    }

    double padding() {
      if (widget.roundedCorners != null && widget.roundedCorners! == true) {
        return 12;
      } else {
        return 8;
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: theme.appColors.background.withOpacity(0.1),
        borderRadius: BorderRadius.circular(cornerRadius()),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: padding(),
      ),
      child: model.isVoiceRecord
          ? Container(
              decoration: BoxDecoration(
                color: theme.appColors.themeColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(cornerRadius()),
              ),
              child: AudioRecorder(
                onDelete: () {
                  if (true == widget.isNew) {
                    (notifier as EventGroupDetailNotifier).updateVoidRecod();
                  } else {
                    (notifier as MessageDetailsNotifier).updateVoidRecod();
                  }
                },
                onStop: (String path) async {
                  if (true == widget.isNew) {
                    (notifier as EventGroupDetailNotifier).updateVoidRecod();
                  } else {
                    (notifier as MessageDetailsNotifier).updateVoidRecod();
                  }
                  final postService = PostService();
                  this.path = path;
                  if (true == widget.isNew) {
                    (notifier as EventGroupDetailNotifier).setLoading();
                  } else {
                    (notifier as MessageDetailsNotifier).setLoading();
                  }
                  await postService.sendMessage(
                    '',
                    chatRoomId: widget.roomId,
                    ref.read(dioProvider),
                    file: [File(Uri.parse(path).path)],
                    isGroup: model.isGrupChat,
                  );
                  if (true == widget.isNew) {
                    (notifier as EventGroupDetailNotifier).stopLoading();
                  } else {
                    (notifier as MessageDetailsNotifier).stopLoading();
                  }
                },
              ),
            )
          : Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    onChanged: widget.onChanged,
                    controller: widget.controller,
                    focusNode: widget.focusNode,
                    onFieldSubmitted: widget.onSubmitted,
                    label: l10n.chatInput,
                    maxLines: 5,
                    minLines: 1,
                    textInputAction: TextInputAction.newline,
                    prefixIconWidget: widget.prefix ?? const SizedBox.shrink(),
                    suffixIconWidget: widget.suffix ?? const SizedBox.shrink(),
                  ),
                ),
                InkWell(
                  onTap: ((true == widget.isNew)
                          ? (viewModel as EventGroupDetailState).isSubmit
                          : (viewModel as MessageDetailsState).isSubmit)
                      ? () {}
                      : () {
                          if (widget.onSubmitted != null) {
                            // ignore: prefer_null_aware_method_calls
                            widget.onSubmitted!(widget.controller.text);
                          }
                        },
                  child: Container(
                    decoration: const BoxDecoration().addCustomShadow(
                      color: MainColors.transparentBlue.withOpacity(0.1),
                      offsetX: 4,
                      offsetY: 8,
                      blurRadius: 24,
                    ),
                    padding: const EdgeInsets.only(
                      left: 12,
                    ),
                    child: CustomCircleButton(
                      backgroundColor: ((true == widget.isNew)
                          ? (viewModel as EventGroupDetailState).isSubmit
                          : (viewModel as MessageDetailsState).isSubmit)
                          ? MainColors.grey500
                          : MainColors.primary,
                      iconPath: Assets.icons.bold.send.path,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class FlatMessageInputBoxItem extends StatefulHookConsumerWidget {
  const FlatMessageInputBoxItem({
    required this.roomId,
    required this.focusNode,
    required this.isSearchRoute,
    this.isNew,
    super.key,
  });
  final String roomId;
  final FocusNode focusNode;
  final bool isSearchRoute;
  final bool? isNew;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _FlatMessageInputBoxItemState();
}

class _FlatMessageInputBoxItemState
    extends ConsumerState<FlatMessageInputBoxItem> {
  Timer? _typingTimer;
  int _postCount = 0;
  @override
  void dispose() {
    _typingTimer?.cancel(); // Zamanlayıcıyı iptal et
    super.dispose();
  }

  void _handleWriting(String text) {
    if (widget.isNew == true) {
    } else {
      if (_postCount > 0) {
        return;
      }
      final viewModelNotifier =
          ref.read(messageDetailsProvider(widget.roomId).notifier);
      _postCount++;
      viewModelNotifier.writingNow(widget.roomId, isWriting: true);
      // Mevcut zamanlayıcıyı iptal et
      _typingTimer?.cancel();

      // Yeni bir zamanlayıcı başlat
      _typingTimer = Timer(const Duration(seconds: 10), () {
        // Kullanıcı yazmayı durdurduğunda API'ye false gönder
        viewModelNotifier.writingNow(widget.roomId);
        _postCount = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final viewModel = (true == widget.isNew
        ? ref.watch(eventGroupDetailsProvider(widget.roomId))
        : ref.watch(messageDetailsProvider(widget.roomId)));
    final viewModelNotifier = (true == widget.isNew
        ? ref.read(eventGroupDetailsProvider(widget.roomId).notifier)
        : ref.read(
            messageDetailsProvider(widget.roomId).notifier,
          ));
    return FlatMessageInputBox(
      isNew: widget.isNew,
      controller: true == widget.isNew
          ? (viewModelNotifier as EventGroupDetailNotifier)
              .textEditingController
          : (viewModelNotifier as MessageDetailsNotifier).textEditingController,
      roundedCorners: true,
      roomId: widget.roomId,
      focusNode: widget.focusNode,
      isSearchRoute: widget.isSearchRoute,
      onSubmitted: (true == widget.isNew
              ? (viewModel as EventGroupDetailState).isSubmit
              : (viewModel as MessageDetailsState).isSubmit)
          ? null
          : (p0) {
              if (true == widget.isNew) {
                (viewModelNotifier as EventGroupDetailNotifier).sendMessage();
              } else {
                (viewModelNotifier as MessageDetailsNotifier).sendMessage(
                  isSearchRoute: widget.isSearchRoute,
                );
              }
            },
      onChanged: _handleWriting,
      suffix: SizedBox(
        width: 100,
        child: Row(
          children: [
            InkWell(
              onTap: true == widget.isNew
                  ? (viewModelNotifier as EventGroupDetailNotifier)
                      .updateVoidRecod
                  : (viewModelNotifier as MessageDetailsNotifier)
                      .updateVoidRecod,
              child: Assets.icons.bold.voice.svg(
                color: theme.appColors.secondText,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            InkWell(
              onTap: () => (true == widget.isNew
                      ? (viewModelNotifier as EventGroupDetailNotifier)
                          .pickImage(
                          source: ImageSource.gallery,
                          context: context,
                          isSearchRoute: widget.isSearchRoute,
                          roomId: widget.roomId,
                        )
                      : (viewModelNotifier as MessageDetailsNotifier).pickImage(
                          source: ImageSource.gallery,
                          context: context,
                          isSearchRoute: widget.isSearchRoute,
                          roomId: widget.roomId,
                        ))
                  .then((value) => widget.focusNode.requestFocus()),
              child: Assets.icons.bold.attachment.svg(
                color: theme.appColors.secondText,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            InkWell(
              onTap: () => (true == widget.isNew
                      ? (viewModelNotifier as EventGroupDetailNotifier)
                          .pickImage(
                          source: ImageSource.camera,
                          context: context,
                        )
                      : (viewModelNotifier as MessageDetailsNotifier).pickImage(
                          source: ImageSource.camera,
                          context: context,
                        ))
                  .then((value) => widget.focusNode.requestFocus()),
              child: Assets.icons.bold.camera.svg(
                color: theme.appColors.secondText,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

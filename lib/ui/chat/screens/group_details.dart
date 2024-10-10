// ignore_for_file: deprecated_member_use_from_same_package
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/component/custom_divider.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/chat/model/message_timeline_model.dart';
import 'package:togodo/ui/chat/screens/group_tab.dart';
import 'package:togodo/ui/chat/services/post_service.dart';
import 'package:togodo/ui/chat/utils/chat_constants.dart';
import 'package:togodo/ui/chat/view_model/web_socket_notifier.dart';

import '../../../core/enums/cache_items.dart';

@RoutePage()
class GroupDetailsPage extends StatefulHookConsumerWidget {
  const GroupDetailsPage({
    required this.roomId,
    super.key,
  });
  final String roomId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GroupDetailsPageState();
}

class _GroupDetailsPageState extends ConsumerState<GroupDetailsPage> {
  PostService postService = PostService();
  final FocusNode _focusName = FocusNode();
  TextEditingController nameTextController = TextEditingController();
  bool _isUpdate = false;

  @override
  void dispose() {
    _focusName.dispose();
    nameTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final router = useRouter();
    final notifier = ref.read(webSocketProvider.notifier);
    final view = ref.watch(webSocketProvider).groupChatData;
    final userModel = ref.watch(userViewModelProvider).tokenModel?.userId;
    final model = view.firstWhere(
      (element) => element.chatRoomId == widget.roomId,
      orElse: MessageTimelineModel.new, // Eğer uygun eleman yoksa null döndür
    );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: l10n.groupDetail,
        ),
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Column(
              children: [
                if (model.joinedUsers != null)
                  GroupContainer(joinedUsers: model.joinedUsers),
                const SizedBox(height: 8),
                if (!_isUpdate)
                  containerText(
                    model.chatRoomName ?? '',
                    theme,
                  )
                else
                  SizedBox(
                    width: 180,
                    height: 40,
                    child: TextField(
                      textAlign: TextAlign.center,
                      controller: nameTextController,
                      focusNode: _focusName,
                      style: theme.textTheme.h4.copyWith(
                        color: theme.appColors.text,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: InputDecoration(
                        hintText: 'Gruba İsim Ver',
                        hintStyle: theme.textTheme.bodyXLarge.copyWith(
                          color: theme.appColors.secondText,
                        ),
                        labelStyle: theme.textTheme.h4.copyWith(
                          color: theme.appColors.text,
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none,
                        suffixIcon: nameTextController.text.isNotEmpty
                            ? GestureDetector(
                                onTap: nameTextController.clear,
                                child: Padding(
                                  padding: const EdgeInsets.all(18),
                                  child: Assets.icons.bold.close.svg(
                                    color: theme.appColors.text,
                                  ),
                                ),
                              )
                            : null,
                      ),
                    ),
                  ),
                const SizedBox(height: 8),
                InkWell(
                  onTap: () async {
                    final token = await CacheItems.token.readSecureData();

                    setState(() {
                      _isUpdate = !_isUpdate;
                      if (_isUpdate) {
                        nameTextController.text = model.chatRoomName ?? '';
                        _focusName.requestFocus();
                      } else {
                        notifier
                          ..updateGroupChatRoom(
                            widget.roomId,
                            nameTextController.text,
                          )
                          ..closeAndOpenWebSocket(token);

                        FocusScope.of(context).unfocus();
                      }
                    });
                  },
                  child: Container(
                    width: 90,
                    height: 28,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: _isUpdate
                          ? MainColors.transparentBlue
                          : const Color(0x1f757575),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: _isUpdate
                        ? PrimaryText(
                            l10n.save_button,
                            style: theme.textTheme.bodySmall.copyWith(
                              color: MainColors.primary,
                            ),
                          )
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Assets.icons.light.editSquare.svg(
                                width: 16,
                                height: 16,
                                color: MainColors.grey400,
                              ),
                              const SizedBox(width: 8),
                              PrimaryText(
                                l10n.edit,
                                style: theme.textTheme.bodySmall.copyWith(),
                              ),
                            ],
                          ),
                  ),
                ),
                const SizedBox(height: 32),
                settingsIcon(theme, notifier, model, router, l10n, userModel),
                const SizedBox(height: 28),
                usersContent(router, theme, model, notifier, l10n),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Row settingsIcon(
    AppTheme theme,
    WebSocketNotifier notifier,
    MessageTimelineModel model,
    StackRouter router,
    L10n l10n,
    String? userId,
  ) {
    final isManager = model.joinedUsers!
        .where((element) => element.userId == userId)
        .first
        .isManager;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (isManager ?? false)
          Column(
            children: [
              InkWell(
                onTap: () {
                  router.push(
                    AddGroupChatUserRoute(
                      roomId: widget.roomId,
                    ),
                  );
                },
                child: Assets.icons.light.addUser.svg(
                  color: theme.appColors.text,
                  width: 32,
                  height: 32,
                ),
              ),
              const SizedBox(height: 6),
              PrimaryText(
                l10n.add,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge.copyWith(
                  color: theme.appColors.text,
                ),
              ),
            ],
          ),
        Column(
          children: [
            InkWell(
              splashColor: Colors.transparent,
              onTap: () async {
                final response =
                    await notifier.muteOrUnmuteChatRoom(widget.roomId);
                if (response) {
                  notifier.updateMuted(widget.roomId);
                }
              },
              child: model.isMuted ?? false
                  ? Assets.icons.light.volumeOff.svg(
                      color: theme.appColors.text,
                      width: 32,
                      height: 32,
                    )
                  : Assets.icons.light.volumeDown.svg(
                      color: theme.appColors.text,
                      width: 32,
                      height: 32,
                    ),
            ),
            const SizedBox(height: 6),
            PrimaryText(
              l10n.mute,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge.copyWith(
                color: theme.appColors.text,
              ),
            ),
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () async {
                warningShowDialog(
                  l10n.leaveGroup,
                  l10n.confirmLeaveGroup,
                  l10n.leaveGroup,
                  () async {
                    final response =
                        await notifier.leaveChatRoom(widget.roomId);
                    if (response) {
                      router
                        ..back()
                        ..back()
                        ..back();
                    }
                  },
                  theme,
                  context,
                );
              },
              splashColor: Colors.transparent,
              child: Assets.icons.light.logout.svg(
                color: theme.appColors.text,
                width: 32,
                height: 32,
              ),
            ),
            const SizedBox(height: 6),
            PrimaryText(
              'Çık',
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyLarge.copyWith(
                color: theme.appColors.text,
              ),
            ),
          ],
        ),
      ],
    );
  }

  PrimaryText containerText(
    String text,
    AppTheme theme,
  ) {
    return PrimaryText(
      text,
      textAlign: TextAlign.center,
      style: theme.textTheme.h4.copyWith(
        color: theme.appColors.text,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget usersContent(
    StackRouter router,
    AppTheme theme,
    MessageTimelineModel model,
    WebSocketNotifier notifier,
    L10n l10n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryText(
          l10n.participant(model.joinedUsers!.length),
          style: theme.textTheme.bodyLarge.copyWith(
            color: theme.appColors.text,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: theme.mode == ThemeMode.light
                ? const Color(0xffF5F5F5)
                : MainColors.dark2,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView.separated(
            itemCount: model.joinedUsers!.length,
            shrinkWrap: true,
            padding: const EdgeInsets.all(20),
            itemBuilder: (context, index) {
              final user = model.joinedUsers![index];

              return Slidable(
                key: const ValueKey(0),
                endActionPane: ActionPane(
                  extentRatio: 0.2,
                  motion: const ScrollMotion(),
                  children: user.isManager ?? false
                      ? []
                      : [
                          CustomSlidableAction(
                            onPressed: (BuildContext context) {
                              warningShowDialog(
                                l10n.removeFromGroup,
                                l10n.confirmRemoveFromGroup(
                                  user.userFullName ?? '',
                                ),
                                l10n.removeFromGroup,
                                () async {
                                  final response =
                                      await notifier.removeGroupChatRoomUser(
                                    widget.roomId,
                                    user.userId!,
                                  );
                                  if (response) {
                                    Navigator.of(context).pop();
                                  }
                                },
                                theme,
                                context,
                              );
                            },
                            backgroundColor:
                                MainColors.transparentRed.withOpacity(0.08),
                            foregroundColor: MainColors.red,
                            child: Assets.icons.bold.delete.svg(
                              width: 24,
                              height: 24,
                              color: MainColors.red,
                            ),
                          ),
                        ],
                ),
                child: joinedUser(router, user, theme, l10n),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const CustomDivider(
                height: 40,
              );
            },
          ),
        ),
      ],
    );
  }

  GestureDetector joinedUser(
    StackRouter router,
    GroupJoinedUsers user,
    AppTheme theme,
    L10n l10n,
  ) {
    return GestureDetector(
      onTap: () {
        router.push(
          UserProfileRoute(
            userId: user.userId!,
          ),
        );
      },
      child: Row(
        children: [
          CustomAvatarImage(
            imageUrl: user.userImageUrl,
          ),
          const SizedBox(width: 16),
          PrimaryText(
            user.userFullName ?? '', // Replace with actual user's username
            style: theme.textTheme.bodyLarge.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const Spacer(),
          if (user.isManager ?? false)
            PrimaryText(
              l10n.manager, // Replace with actual user's username
              style: theme.textTheme.bodySmall.copyWith(
                fontWeight: FontWeight.w500,
                color: MainColors.grey400,
              ),
            ),
        ],
      ),
    );
  }
}

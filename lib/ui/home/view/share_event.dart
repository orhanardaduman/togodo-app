// ignore_for_file: avoid_print, cascade_invocations

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/home/view/share_event_user_view.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';
import 'package:togodo/ui/profile/view_model/user_search_view_model.dart';

import '../../../core/component/alert/alert_messages.dart';
import '../../../core/component/button/custom_button.dart';
import '../../../core/component/button/custom_circle_button.dart';
import '../../../core/component/custom_event_card.dart';
import '../../../core/helpers/utility.dart';
import '../../../core/network/api/app_dio.dart';
import '../../auth/viewmodel/user_view_model.dart';
import '../../chat/services/post_service.dart';
import 'insta_template.dart';

class ShareEvent extends StatefulHookConsumerWidget {
  const ShareEvent({
    required this.controller,
    super.key,
    this.event,
  });
  final ScrollController controller;
  final EventCommonProperties? event;
  @override
  ConsumerState<StatefulHookConsumerWidget> createState() => _ShareEventState();
}

class _ShareEventState extends ConsumerState<ShareEvent> {
  final TextEditingController _keywordController = TextEditingController();
  final ScreenshotController screenshotController = ScreenshotController();
  late Screenshot widgetToCapture = Screenshot(
    controller: screenshotController,
    child: EnventCards(
      data: widget.event,
      size: EventCardSize.custom,
      width: 250,
      height: 250,
    ),
  );
  @override
  void initState() {
    super.initState();
    _keywordController.addListener(_onKeywordChanged);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(
            profilViewModelProvider(null).notifier,
          )
          .fetchFriendsRequest();
    });
  }

  void _onKeywordChanged() {
    if (_keywordController.text.isNotEmpty) {
      setState(() {});
    }
  }

  String getEventDetailsPageUrl(String eventId) {
    // AutoRoute paketi ile URL oluşturma
    return 'togodo.co/$eventId';
  }

  void clearTextField() {
    _keywordController.clear();
  }

  @override
  void dispose() {
    _keywordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final user = ref.watch(userViewModelProvider).tokenModel?.userId;
    final router = useRouter();
    final l10n = useL10n();
    return SafeArea(
      bottom: false,
      child: Stack(
        children: [
          Center(child: widgetToCapture),
          DragCustomModal(
            title: widget.event!.name ?? '',
            controller: widget.controller,
            isCloseDivider: true,
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 23,
            ),
            child: Column(
              children: [
                PrimaryText(
                  l10n.shareInfo,
                  style: theme.textTheme.h4.copyWith(
                    color: theme.appColors.text,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextField(
                  label: l10n.search,
                  controller: _keywordController,
                  prefixIcon: Assets.icons.light.search.path,
                ),
                Divider(
                  color: theme.appColors.divider,
                  height: 48,
                ),
                usersContent(
                  router,
                  theme,
                  l10n,
                  user,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .15,
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              decoration: BoxDecoration(
                color: theme.appColors.background,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ).addCustomShadow(
                color: MainColors.transparentBlue,
                offsetY: 8,
                offsetX: 4,
                blurRadius: 24,
              ),
              height: 118,
              width: context.sized.width,
              child: Row(
                children: <Widget>[
                  Container(
                    width: context.dyWidth(212),
                    decoration: const BoxDecoration().buttonShadow,
                    child: CustomButton(
                      text: l10n.storyShare,
                      leftIcon: Assets.icons.social.instagramWhite.path,
                      onPressed: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute<CustomInstagramStoryWidget>(
                            builder: (context) {
                              return CustomInstagramStoryWidget(
                                data: widget.event!,
                              );
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: context.isMediumScrn ? 16 : 12,
                  ),
                  Expanded(
                    child: CustomCircleButton(
                      backgroundColor: theme.mode == ThemeMode.dark
                          ? MainColors.dark3
                          : MainColors.primary100,
                      iconColor: theme.mode == ThemeMode.dark
                          ? MainColors.white
                          : MainColors.primary,
                      iconPath: Assets.icons.bold.link.path,
                      borderRadius: BorderRadius.circular(16),
                      onPressed: () {
                        copyLink(
                          context,
                          theme,
                          getEventDetailsPageUrl(
                            'EventDetails/${widget.event!.id!}',
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    width: context.isMediumScrn ? 16 : 12,
                  ),
                  Expanded(
                    child: CustomCircleButton(
                      backgroundColor: theme.mode == ThemeMode.dark
                          ? MainColors.dark3
                          : MainColors.primary100,
                      iconColor: theme.mode == ThemeMode.dark
                          ? MainColors.white
                          : MainColors.primary,
                      iconPath: Assets.icons.light.upload.path,
                      borderRadius: BorderRadius.circular(16),
                      onPressed: () async {
                        try {
                          final imageFile =
                              await screenshotController.capture(pixelRatio: 2);
                          if (imageFile != null) {
                            final directory =
                                await getApplicationDocumentsDirectory();
                            final imagePath =
                                await File('${directory.path}/story.png')
                                    .create();
                            await imagePath.writeAsBytes(imageFile);
                            await shareEventPlusWithImage(
                              imagePath.path,
                              context,
                              widget.event!.name ?? '',
                              widget.event!.description ?? '',
                              getEventDetailsPageUrl(
                                'EventDetails/${widget.event!.id!}',
                              ),
                              l10n,
                            );
                          } else {
                            await shareEventPlusWithImage(
                              null,
                              context,
                              widget.event!.name ?? '',
                              widget.event!.description ?? '',
                              getEventDetailsPageUrl(
                                'EventDetails/${widget.event!.id!}',
                              ),
                              l10n,
                            );
                          }
                        } catch (e) {
                          print("error $e");
                          await shareEventPlusWithImage(
                            null,
                            context,
                            widget.event!.name ?? '',
                            widget.event!.description ?? '',
                            getEventDetailsPageUrl(
                              'EventDetails/${widget.event!.id!}',
                            ),
                            l10n,
                          );
                        }

                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  String getFriendsRequestText(
    List<UserSearchModel> requests,
    int maxNamesToShow,
  ) {
    // İstek sayısı maxNamesToShow'dan fazla ise,
    // ilk birkaç ismi al ve geri kalan sayıyı ekle
    if (requests.length > maxNamesToShow) {
      final names = requests.take(maxNamesToShow).map((e) => e.name).join(', ');
      final remainingCount = requests.length - maxNamesToShow;
      return '$names +$remainingCount';
    } else {
      // İstek sayısı maxNamesToShow'dan az veya eşit ise,
      // tüm isimleri birleştir ve döndür
      return requests.map((e) => e.name).join(', ');
    }
  }

  Widget usersContent(
    StackRouter router,
    AppTheme theme,
    L10n l10n,
    String? id,
  ) {
    return Consumer(
      builder: (context, ref, child) {
        final userSearchFuture = ref.watch(
          userSearchProvider(
            UserSearchParam(
              keyword: _keywordController.text,
              userId: id,
            ),
          ),
        );
        final notifier = ref.read(
          profilViewModelProvider(null).notifier,
        );
        final model = ref.watch(
          profilViewModelProvider(null),
        );
        return userSearchFuture.when(
          data: (users) {
            return users != null && users.isNotEmpty
                ? ListView.separated(
                    itemCount: users.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.only(bottom: 24),
                    itemBuilder: (context, index) {
                      final user = users[index];
                      /*  final modelUser = model.friendsRequest!
                      .where((element) => element.id == user.id)
                      .first;*/
                      return ShareEventUserView(
                        theme: theme,
                        l10n: l10n,
                        user: user,
                        onShare: () {
                          final postService = PostService();
                          notifier.incrementChangeRequest(
                            user.id!,
                          );
                          showToast(
                            context,
                            l10n.sharedEvent,
                            type: AlertType.custom,
                            isPosition: true,
                            style: theme.textTheme.bodyMedium.copyWith(
                              color: MainColors.black,
                            ),
                          );
                          postService.sendMessage(
                            '',
                            ref.read(dioProvider),
                            receiverUserId: user.id,
                            eventId: widget.event!.id,
                            contentType: '4',
                          );
                        },
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(
                        height: 24,
                      );
                    },
                  )
                : const SizedBox(
                    height: 200,
                  );
          },
          loading: Loading.new,
          error: (error, stack) => Text('Error: $error'),
        );
      },
    );
  }
}

// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/image/custom_image_slideshow.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/index.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/features/component/custom_divider.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';

class SlideProfilImage extends HookConsumerWidget {
  const SlideProfilImage({
    super.key,
    this.images,
    this.userId,
    this.type = 0,
    this.isBlock = false,
    this.isFriends = false,
    this.isFollow = false,
    this.isHiddenEvent = false,
    this.isHideSettings = false,
  });

  final List<Images>? images;
  final String? userId;
  final bool isBlock;
  final bool isFriends;
  final bool isFollow;
  final bool isHiddenEvent;
  final int type;
  final bool isHideSettings;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final model = ref.read(profilViewModelProvider(userId).notifier);
    final userType =
        ref.watch(userViewModelProvider).tokenModel!.token!.userType;
    return Stack(
      alignment: Alignment.topRight,
      children: [
        if (images == null || images!.isEmpty)
          SizedBox(
            height: context.sized.dynamicHeight(0.428),
            width: context.sized.width,
          )
        else
          CustomImageSlideshow(
            height: context.sized.dynamicHeight(0.428),
            indicatorColor: MainColors.primary,
            indicatorPadding: 8,
            indicatorRadius: 4,
            indicatorBottomPadding: 77.7,
            items: images!.map((e) => e.downloadUrl!).toList(),
            onPageChanged: (value) {
              if (kDebugMode) {
                print('Page changed: $value');
              }
            },
            children: [
              for (var i = 0; i < images!.length; i++)
                CachedNetworkImage(
                  imageUrl: images![i].downloadUrl!,
                  fit: BoxFit.cover,
                ),
            ],
          ),
        if (userId == null)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 54, horizontal: 24),
            child: IconButton(
              onPressed: () {
                router.push(
                  SettingsRoute(
                    userType: type,
                  ),
                );
              },
              icon: Assets.icons.bold.setting.svg(
                width: 24,
                height: 24,
                color: MainColors.white,
              ),
            ),
          )
        else
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 54,
            ),
            child: Row(
              children: [
                IconButton(
                  onPressed: router.pop,
                  icon: Padding(
                    padding: const EdgeInsets.only(left: 20), // Sol boşluk
                    child: Assets.icons.lightOutline.arrowLeft.svg(
                      width: 28,
                      height: 28,
                      color: MainColors.white,
                    ),
                  ),
                ),
                const Spacer(),
                if (!isHideSettings)
                  IconButton(
                    onPressed: () {
                      profilSettings(
                        context,
                        l10n,
                        model,
                        router,
                        theme,
                        ref,
                        userType,
                      );
                    },
                    icon: Assets.icons.bold.additionalIcons.svg(
                      width: 24,
                      height: 24,
                    ),
                  ),
                const SizedBox(width: 20),
              ],
            ),
          ),
      ],
    );
  }

  void profilHideSettings(
    BuildContext context,
    L10n l10n,
    ProfilViewModel model,
    StackRouter router,
    AppTheme theme,
    WidgetRef ref,
  ) {
    return showCustomModalBottomSheets(
      context,
      initialChildSize: isBlock
          ? 0.3
          : !isFriends
              ? 0.3
              : null,
      [
        listTile(
          l10n.joinedEventHide,
          () {
            //oluşturulan etkinliklerin gizlenmesi false
            model
                .createHiddenEvent(status: false)
                .then((value) => router.pop());
          },
          theme,
        ),
        listTile(
          l10n.createdEventHide,
          isLast: true,
          () {
            //katıldığın etkinliklerin gizlenmesi true - default var
            model.createHiddenEvent().then((value) => router.pop());
          },
          theme,
        ),
      ],
      theme,
    );
  }

  void profilSettings(
    BuildContext context,
    L10n l10n,
    ProfilViewModel model,
    StackRouter router,
    AppTheme theme,
    WidgetRef ref,
    int? userType,
  ) {
    return showCustomModalBottomSheets(
      context,
      initialChildSize: isBlock ? 0.4 : 0.5,
      [
        listTile(
          isBlock ? l10n.unblock : l10n.block,
          () {
            isBlock
                ? model.unblockRelation().then((value) => router.pop())
                : model.blockRelation().then((value) => router.pop());
          },
          theme,
        ),
        if ((isFriends || isFollow) && userType == 0)
          type == 0
              ? listTile(
                  l10n.removeFriend,
                  () {
                    model.removeFriend().then((value) => router.pop());
                  },
                  theme,
                )
              : listTile(
                  l10n.unfollow,
                  () {
                    model.removeFollow().then((value) => router.pop());
                  },
                  theme,
                ),
        listTile(
          l10n.report,
          () async {
            await router.pop().then(
                  (value) => showReportSheet(
                    context,
                    onPressed: (type, reportDescription) {
                      ref
                          .read(
                            profilViewModelProvider(null).notifier,
                          )
                          .createReporUser(
                            userId!,
                            reportDescription,
                          );
                      router.pop();
                    },
                  ),
                );
          },
          theme,
          isLast: isBlock,
        ),
        if (!isBlock)
          listTile(
            l10n.hideActivities,
            () async {
              await router.pop().then(
                    (value) => profilHideSettings(
                      context,
                      l10n,
                      model,
                      router,
                      theme,
                      ref,
                    ),
                  );
            },
            theme,
          ),
        if (!isBlock)
          listTile(
            l10n.copyProfileUrl,
            isLast: true,
            () {
              copyLink(
                context,
                theme,
                'togodo.co/userProfile/$userId',
              ).then((value) => router.pop());
            },
            theme,
          ),
        /* if (!isBlock)
                        listTile(
                          l10n.shareProfile,
                          () {},
                          theme,
                          isLast: true,
                        ), */
      ],
      theme,
    );
  }

  void showConfirm(
    AppTheme theme,
    L10n l10n,
    BuildContext context,
  ) {
    showDialog<Dialog>(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: CustomModal(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 32, left: 32, right: 32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                PrimaryText(
                  l10n.whatIsApplause,
                  style: theme.textTheme.h4.copyWith(
                    color: theme.appColors.text,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 32),
                const PrimaryText(
                  '👏🏻',
                  style: TextStyle(
                    fontSize: 48,
                  ),
                ),
                const SizedBox(height: 32),
                // Diğer kullanıcıların ilgi alanlarını ve sosyal medya hesaplarını görmek için kendi bilgilerini eklem
                PrimaryText(
                  l10n.applauseInfo,
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 32),

                CustomButton(
                  text: l10n.close,
                  mode: ButtonMode.dark,
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                  radius: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Column listTile(
    String text,
    void Function()? onTap,
    AppTheme theme, {
    bool isLast = false,
  }) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Center(
            child: PrimaryText(
              text,
              style: theme.textTheme.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.appColors.text,
              ),
            ),
          ),
          onTap: onTap,
        ),
        if (!isLast)
          const CustomDivider(
            height: 12,
          ),
      ],
    );
  }
}

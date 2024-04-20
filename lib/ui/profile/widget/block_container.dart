import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/features/component/featured_image.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';
import 'package:togodo/ui/profile/widget/slide_profil_image.dart';

class BlockedUserToCurrentUserWidget extends HookConsumerWidget {
  const BlockedUserToCurrentUserWidget({
    required this.theme,
    required this.l10n,
    required this.userId,
    super.key,
  });

  final AppTheme theme;
  final String userId;
  final L10n l10n;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        SlideProfilImage(
          images: const [
            Images(downloadUrl: errorImage, number: 0),
          ],
          userId: userId,
          isHiddenEvent: true,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 12,
          ),
          margin: EdgeInsets.only(
            top: context.sized.dynamicHeight(0.428) - 75.7,
          ),
          child: Container(
            padding: const EdgeInsets.only(
              top: 24,
              left: 24,
              right: 24,
              bottom: 24,
            ),
            decoration: BoxDecoration(
              color: theme.appColors.background,
              borderRadius: BorderRadius.circular(34),
              border: Border.all(
                color: theme.appColors.divider,
              ),
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        PrimaryText(
                          '0 ${l10n.friend} ',
                          style: theme.textTheme.bodyLarge.copyWith(),
                        ),
                        const SizedBox(width: 20),
                        PrimaryText(
                          '0 ${l10n.event}',
                          style: theme.textTheme.bodyLarge.copyWith(),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Container(
                        width: 38,
                        height: 3,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100),
                          ),
                          color: Color(0xffe0e0e0),
                        ),
                      ),
                    ),
                    PrimaryText(
                      l10n.togodoUser,
                      style: theme.textTheme.h4.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    context.sized.emptySizedHeightBoxLow,
                    CustomButton(
                      text: l10n.notFoundUser,
                      radius: 100,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BlockContainerWidget extends HookConsumerWidget {
  const BlockContainerWidget({
    required this.theme,
    required this.l10n,
    required this.userId,
    this.isUserBlock = true,
    super.key,
  });

  final AppTheme theme;
  final String userId;
  final L10n l10n;
  final bool isUserBlock;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          EmptyContainer(theme: theme),
          if (isUserBlock)
            Padding(
              padding: EdgeInsets.only(top: context.isSmallScrn ? 90 : 135),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PrimaryText(
                    l10n.unblock,
                    style: theme.textTheme.h5.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 20),
                  PrimaryText(
                    l10n.unBlockInfo,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyMedium.copyWith(
                      color: theme.mode == ThemeMode.dark
                          ? MainColors.grey500
                          : MainColors.grey700,
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: 146,
                    height: 45,
                    child: CustomButton(
                      radius: 100,
                      text: l10n.unblock,
                      style: theme.textTheme.bodyXLarge.copyWith(
                        fontWeight: FontWeight.bold,
                        color: MainColors.white,
                      ),
                      onPressed: () {
                        ref
                            .read(profilViewModelProvider(userId).notifier)
                            .unblockRelation();
                      },
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class EmptyContainer extends StatelessWidget {
  const EmptyContainer({
    required this.theme,
    super.key,
  });

  final AppTheme theme;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 18,
      runSpacing: 18,
      children: List.generate(
        6,
        (index) => Container(
          width: context.sized.dynamicWidth(0.4),
          height: context.isMediumScrn ? 248 : 207,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            color: theme.mode == ThemeMode.dark
                ? MainColors.dark2
                : MainColors.grey50,
          ),
        ),
      ),
    );
  }
}

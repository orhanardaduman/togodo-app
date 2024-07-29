// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/theme/app_theme.dart';

class RatePopUpWidget extends HookConsumerWidget {
  const RatePopUpWidget({
    required this.imgUrl,
    required this.name,
    required this.eventName,
    required this.rate,
    super.key,
  });
  final String imgUrl;
  final String name;
  final String eventName;
  final String rate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeModeProvider.notifier).isDark;
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();

    return GestureDetector(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Material(
        color: Colors.transparent,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        child: Align(
          alignment: Alignment.topCenter,
          child: Dismissible(
            key: const Key('popup'),
            direction: DismissDirection.up, // Yukarı kaydırma yönü
            onDismissed: (direction) {
              // Pop-up'ı kaydırdıktan sonra ne yapılacağını belirtiyoruz.
              Navigator.of(context).pop();
            },
            child: GestureDetector(
              onTap: () async {
                Navigator.of(context).pop();
              },
              child: Container(
                height: 84,
                width: 400,
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
                decoration: BoxDecoration(
                  color: themeMode ? MainColors.dark2 : MainColors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    CustomAvatarImage(
                      imageUrl: imgUrl,
                      size: 48,
                    ),
                    const SizedBox(width: 16),
                    PrimaryText(
                      l10n.eventRatedText(
                        eventName,
                        rate,
                        name,
                      ),
                      style: theme.textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

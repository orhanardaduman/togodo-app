import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';

import '../../../gen/assets.gen.dart';
import '../../auth/viewmodel/user_view_model.dart';

class EventPointScuessPopup extends StatefulHookConsumerWidget {
  const EventPointScuessPopup({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EventPointScuessPopupState();
}

class _EventPointScuessPopupState extends ConsumerState<EventPointScuessPopup> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(profilViewModelProvider(null).notifier).fetchProfil();
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(appThemeModeProvider.notifier).isDark;
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final model = ref.read(profilViewModelProvider(null));
    final userModel = ref.watch(userViewModelProvider);
    print("model döndü ${userModel.tokenModel}");

    return Align(
      alignment: Alignment.topCenter,
      child: Dismissible(
        key: const Key('popup'),

        direction: DismissDirection.up, // Yukarı kaydırma yönü
        onDismissed: (direction) {
          // Pop-up'ı kaydırdıktan sonra ne yapılacağını belirtiyoruz.
          Navigator.of(context).pop();
        },
        child: GestureDetector(
          onTap: () {
            ref.read(profilViewModelProvider(null).notifier).fetchProfil();
          },
          child: Container(
            height: 84,
            width: 400,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            decoration: BoxDecoration(
              color: themeMode ? MainColors.dark2 : MainColors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Assets.icons.bold.star.svg(
                  width: 40,
                  height: 40,
                  color: MainColors.primary,
                ),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      l10n.thankYouUser(userModel.tokenModel?.name ?? ''),
                      style: theme.textTheme.h6.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    PrimaryText(
                      l10n.ratingSaved,
                      style: theme.textTheme.bodyLarge.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

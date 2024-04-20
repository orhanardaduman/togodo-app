// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/input/toggle.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';

@RoutePage()
class SecurityPage extends HookConsumerWidget {
  const SecurityPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.settings,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 16),
        children: [
          PrimaryText(
            l10n.settings_page_security,
            style: theme.textTheme.h5.copyWith(
              color: theme.appColors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 23),
          PrimaryText(
            l10n.manageVisibility,
            style: theme.textTheme.bodyMedium.copyWith(
              color: theme.appColors.secondText,
            ),
          ),
          const SizedBox(height: 23),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => router.push(const BlockUserRoute()),
            leading: PrimaryText(
              l10n.blockedUser,
              style: theme.textTheme.h6.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: Assets.icons.light.arrowRight2.svg(
              color: theme.appColors.text,
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () => router.push(const EventBlockRoute()),
            leading: PrimaryText(
              l10n.eventHide,
              style: theme.textTheme.h6.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: Assets.icons.light.arrowRight2.svg(
              color: theme.appColors.text,
            ),
          ),
          Divider(
            height: 46,
            color: theme.appColors.divider,
          ),
          const ProfilShowSwitch(),
          Divider(
            height: 46,
            color: theme.appColors.divider,
          ),
          ListTile(
            contentPadding: EdgeInsets.zero,
            onTap: () {
              router.push(const RemoveUserRoute());
            },
            leading: PrimaryText(
              l10n.deleteAccount,
              style: theme.textTheme.bodyLarge.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(
            height: 150,
          ),
        ],
      ),
    );
  }
}

class ProfilShowSwitch extends StatefulHookConsumerWidget {
  const ProfilShowSwitch({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfilShowSwitchState();
}

class _ProfilShowSwitchState extends ConsumerState<ProfilShowSwitch> {
  bool loading = false;
  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final viewModel = ref
        .watch(
          profilViewModelProvider(null),
        )
        .profil;
    final privacyType = viewModel?.privacyType ?? 0;
    // Switch durumunu güncelleyen fonksiyon
    void updatePrivacyType(int type) {
      setState(() {
        loading = true;
        ref
            .read(profilViewModelProvider(null).notifier)
            .updatePrivacyType(type)
            .then((value) => loading = false);
      });
    }

    return Column(
      children: [
        PrimaryText(
          l10n.profileVisibility,
          style: theme.textTheme.h5.copyWith(
            color: theme.appColors.text,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 23),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: PrimaryText(
            l10n.everyone,
            style: theme.textTheme.h6.copyWith(
              color: theme.appColors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
          trailing: loading
              ? const SizedBox.shrink()
              : CustomSwitchButton(
                  initVal: privacyType == 0,
                  onChanged: (value) {
                    if (value) {
                      updatePrivacyType(0); // Sadece switch aktifse güncelle
                    }
                  },
                ),
        ),
        const SizedBox(height: 23),
        PrimaryText(
          l10n.publicVisibility,
          style: theme.textTheme.bodyMedium.copyWith(
            color: theme.appColors.secondText,
          ),
        ),
        const SizedBox(height: 23),
        ListTile(
          contentPadding: EdgeInsets.zero,
          leading: PrimaryText(
            l10n.friends,
            style: theme.textTheme.h6.copyWith(
              color: theme.appColors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
          trailing: loading
              ? const SizedBox.shrink()
              : CustomSwitchButton(
                  initVal: privacyType == 1,
                  onChanged: (value) {
                    if (value) {
                      updatePrivacyType(1); // Sadece switch aktifse güncelle
                    }
                  },
                ),
        ),
        const SizedBox(height: 23),
        PrimaryText(
          l10n.friendsOnlyVisibility,
          style: theme.textTheme.bodyMedium.copyWith(
            color: theme.appColors.secondText,
          ),
        ),
        const SizedBox(height: 23),
        ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () => router.push(const BlockUserRoute()),
          leading: PrimaryText(
            l10n.friendsOfFriends,
            style: theme.textTheme.h6.copyWith(
              color: theme.appColors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
          trailing: loading
              ? const SizedBox.shrink()
              : CustomSwitchButton(
                  initVal: privacyType == 2,
                  onChanged: (value) {
                    if (value) {
                      updatePrivacyType(2); // Sadece switch aktifse güncelle
                    }
                  },
                ),
        ),
        const SizedBox(height: 23),
        PrimaryText(
          l10n.friendsOfFriendsVisibility,
          style: theme.textTheme.bodyMedium.copyWith(
            color: theme.appColors.secondText,
          ),
        ),
      ],
    );
  }
}

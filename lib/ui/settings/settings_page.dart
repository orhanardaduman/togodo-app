// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/network/api/api_endpoint.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/chat/view_model/web_socket_notifier.dart';
import 'package:url_launcher/url_launcher.dart';

@RoutePage()
class SettingsPage extends HookConsumerWidget {
  const SettingsPage({required this.userType, super.key});
  final int userType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final userModel = ref.watch(userViewModelProvider);
    final router = useRouter();
    final icon = Assets.icons.light.arrowRight2.svg(
      color: theme.appColors.text,
    );
    final l10n = useL10n();
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.settings_page_title,
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: PrimaryText(
              l10n.settings_page_account_info,
              style: theme.textTheme.h5.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (userType == 101)
            ListTile(
              onTap: () => router.push(const AdminDashboardRoute()),
              leading: PrimaryText(
                'Admin Dashboard',
                style: theme.textTheme.h6.copyWith(
                  color: theme.appColors.text,
                  fontWeight: FontWeight.w700,
                ),
              ),
              trailing: icon,
            ),
          /*   ListTile(
            onTap: () => router.push(const ThemeModeSelectorRoute()),
            leading: PrimaryText(
              l10n.settings_page_personal_details,
              style: theme.textTheme.h6.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: icon,
          ), */
          ListTile(
            onTap: () => router.push(const SecurityRoute()),
            leading: PrimaryText(
              l10n.settings_page_security,
              style: theme.textTheme.h6.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: icon,
          ),
          /*    ListTile(
            onTap: () => router.push(const ThemeModeSelectorRoute()),
            leading: PrimaryText(
              l10n.settings_page_data_and_permissions,
              style: theme.textTheme.h6.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: icon,
          ), */
          ListTile(
            onTap: () => router.push(const ThemeModeSelectorRoute()),
            leading: PrimaryText(
              l10n.settings_page_theme,
              style: theme.textTheme.h6.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: icon,
          ),
          ListTile(
            onTap: () => router.push(const LanguageSelectorRoute()),
            leading: PrimaryText(
              l10n.settings_page_language,
              style: theme.textTheme.h6.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: icon,
          ),
          Divider(
            thickness: 1,
            endIndent: 18,
            indent: 18,
            color: theme.appColors.divider,
          ),
          ListTile(
            leading: PrimaryText(
              l10n.settings_page_about,
              style: theme.textTheme.h5.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              _launchURL(
                PrivacyURl.privacyUrl,
              );
            },
            leading: PrimaryText(
              l10n.settings_page_privacy_policy,
              style: theme.textTheme.h6.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: icon,
          ),
          ListTile(
            onTap: () {
              _launchURL(
                PrivacyURl.kvkkUrl,
              );
            },
            leading: PrimaryText(
              'KVKK',
              style: theme.textTheme.h6.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: icon,
          ),
          ListTile(
            onTap: () {
              _launchURL(
                PrivacyURl.termsUrl,
              );
            },
            leading: PrimaryText(
              l10n.settings_page_terms_and_conditions,
              style: theme.textTheme.h6.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: icon,
          ),
          ListTile(
            onTap: () {
              _launchURL(
                PrivacyURl.kullanimVeIcerikUrl,
              );
            },
            leading: PrimaryText(
              l10n.settings_page_terms_and_content,
              style: theme.textTheme.h6.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
            trailing: icon,
          ),
          ListTile(
            onTap: () {
              ref.read(webSocketProvider.notifier).closeWebSocket();
              userModel
                  .signOut()
                  .then((value) => router.push(const WelcomeRoute()));
            },
            leading: PrimaryText(
              l10n.logout,
              style: theme.textTheme.bodyMedium.copyWith(
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
            trailing: icon,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PrimaryText(
                  '${l10n.settings_page_version} ${''.ext.version}',
                  style: theme.textTheme.bodyMedium.copyWith(
                    color: MainColors.grey500,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    style: theme.textTheme.bodyMedium
                        .copyWith(color: theme.appColors.secondText),
                    children: <TextSpan>[
                      TextSpan(
                        text: l10n.settings_page_invite_friends,
                      ),
                      TextSpan(
                        text: l10n.settings_page_share_friends,
                        style: theme.textTheme.bodyMedium.copyWith(
                          color: MainColors.primary,
                          fontWeight: FontWeight.w700,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () async {
                            await shareEventPlus(
                              context,
                              'togodo',
                              l10n.settings_page_invite_friends,
                              Platform.isIOS
                                  ? 'https://apps.apple.com/us/app/togodo/id6478051609'
                                  : 'https://play.google.com/store/apps/details?id=com.togodo.co',
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          context.sized.emptySizedHeightBoxHigh,
        ],
      ),
    );
  }
}

Future<void> _launchURL(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    // ignore: only_throw_errors
    throw 'Could not launch $url';
  }
}

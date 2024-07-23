// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/index.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_text_theme.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';
import 'package:togodo/ui/profile/widget/point_dialog.dart';

class UserCardCount extends HookConsumerWidget {
  const UserCardCount({required this.data, super.key});
  final ProfilModel data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();
    final model = ref.read(profilViewModelProvider(data.id).notifier);
    final type = data.type ?? 0;
    return Row(
      children: [
        if (type == 0)
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  router.push(
                    FriendsSearchRoute(
                      userId: data.id,
                    ),
                  );
                },
                child: PrimaryText(
                  '${data.friendCount ?? '0'} ${l10n.friend}',
                  style: theme.textTheme.bodyLarge.copyWith(),
                ),
              ),
              const SizedBox(width: 20),
              PrimaryText(
                '${data.eventsCreatedCount ?? '0'} ${l10n.event}',
                style: theme.textTheme.bodyLarge.copyWith(),
              ),
            ],
          )
        else
          GestureDetector(
            onTap: () {
              router.push(
                FollowersUserSearchRoute(
                  userId: data.id!,
                ),
              );
            },
            child: PrimaryText(
              l10n.followers(
                data.followersCount ?? '0',
              ),
              style: theme.textTheme.bodyLarge.copyWith(),
            ),
          ),
        const Spacer(),
        if (type != 1)
          InkWell(
            onTap: () {
              showApplauseInfo(theme, l10n, context);
            },
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${data.applauseCount ?? '0'} ',
                    style: theme.textTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.appColors.text,
                    ),
                  ),
                  const TextSpan(
                    text: '👏🏻 ',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (type != 0) const SizedBox(width: 15),
        if (type != 0 && !(data.isCurrentUser ?? false))
          InkWell(
            splashColor: Colors.transparent,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: PointDialog(
                    data: data,
                  ),
                ),
              );
              /*if (!(data.isNotification ?? false)) {
                showToast(
                  context,
                  l10n.profilNotification,
                  type: AlertType.custom,
                  isPosition: true,
                  style: theme.textTheme.bodyMedium.copyWith(
                    color: MainColors.black,
                  ),
                );
              }
              model.updateNotification();
               */
            },
            child: Row(
              children: [
                Assets.icons.bold.star.svg(
                  width: 24,
                  height: 24,
                  color: MainColors.warning,
                ),
                const SizedBox(
                  width: 5,
                ),
                PrimaryText(
                  (data.calculatedPoint ?? 0.0).toStringAsFixed(1),
                  style: AppTextTheme().bodyLarge,
                ),
                const SizedBox(
                  width: 5,
                ),
                PrimaryText(
                  '(${data.pointCount ?? 0.0})',
                  style: AppTextTheme().bodyLarge.copyWith(
                        color: MainColors.grey700,
                      ),
                ),
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.keyboard_arrow_down,
                  size: 24,
                  color: Colors.white,
                )
              ],
            ),
          ),
      ],
    );
  }
}

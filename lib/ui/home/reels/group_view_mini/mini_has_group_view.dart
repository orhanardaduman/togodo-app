import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/hook/use_router.dart';

import '../../../../core/component/button/custom_button.dart';
import '../../../../core/component/primary_text.dart';
import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/hook/use_l10n.dart';
import '../../../../core/route/app_route.gr.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/model/event/event_details_model.dart';
import 'mini_grid_view.dart';

class MiniHasGroupView extends HookConsumerWidget {
  const MiniHasGroupView({required this.item, super.key});
  final EventDetailsModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryText(
          l10n.yourGroupFriends,
          style: theme.textTheme.bodyLarge.copyWith(
            color: MainColors.primary,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 10),
        MiniGroupGridView(
          item: item,
        ),
        const SizedBox(height: 30),
        CustomButton(
          text: l10n.groupDetails,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          style: theme.textTheme.bodyXLarge.copyWith(
            fontWeight: FontWeight.bold,
            color: MainColors.white,
          ),
          onPressed: () {
            router.push(
              GroupRoute(
                id: item.eventGroups?.id ?? "",
              ),
            );
          },
        )
      ],
    );
  }
}

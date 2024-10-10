import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/ui/group/pages/group_page.dart';

import '../../../../core/component/button/custom_button.dart';
import '../../../../core/component/primary_text.dart';
import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/hook/use_l10n.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/model/event/event_model.dart';
import 'grid_view.dart';

class HasGroupView extends HookConsumerWidget {
  const HasGroupView({required this.item, super.key});
  final EventModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);

    return Padding(
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: MediaQuery.of(context).size.height * .1,
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryText(
              item.name ?? '',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodyLarge.copyWith(
                color: MainColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 32,
              ),
            ),
            PrimaryText(
              l10n.yourGroupFriends,
              style: theme.textTheme.bodyLarge.copyWith(
                color: MainColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            PrimaryText(
              l10n.meetFriends,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium.copyWith(
                color: MainColors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            GroupGridView(
              item: item,
            ),
            const SizedBox(height: 30),
            CustomButton(
              text: l10n.groupDetails,
              style: theme.textTheme.bodyXLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: MainColors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (
                      c,
                    ) {
                      return GroupPage(
                        id: item.eventGroups?.id ?? '',
                      );
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

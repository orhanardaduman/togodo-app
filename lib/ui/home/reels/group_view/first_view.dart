import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../core/component/button/custom_button.dart';
import '../../../../core/component/primary_text.dart';
import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/hook/use_l10n.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/model/event/event_model.dart';
import '../../../auth/viewmodel/user_view_model.dart';
import '../../../profile/user_groups/bloc/user_groups_bloc.dart';
import '../../../profile/user_groups/bloc/user_groups_events.dart';
import '../../view_model/home_view_model.dart';
import 'grid_view.dart';

class ReelsGroupFirstView extends HookConsumerWidget {
  const ReelsGroupFirstView({required this.item, super.key});
  final EventModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final viewModel = ref.read(homeViewModelProvider.notifier);
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
              l10n.donTBeAlone,
              style: theme.textTheme.bodyLarge.copyWith(
                color: MainColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            PrimaryText(
              l10n.letsFindGroup,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium.copyWith(
                color: MainColors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            const GroupGridView(),
            const SizedBox(height: 30),
            CustomButton(
              text: l10n.matchWithGroup,
              style: theme.textTheme.bodyXLarge.copyWith(
                fontWeight: FontWeight.bold,
                color: MainColors.white,
              ),
              onPressed: () {
                if (item.id != null) {
                  if (item.groupRequest != null) {
                    viewModel.deleteGroupRequest(item.id!, homePage: true);
                  } else {
                    viewModel.createGroupRequest(item.id!, homePage: true);
                  }
                  context.read<UserGroupsBloc>().add(GetUserGroups(''));
                }
              },
            )
          ],
        ),
      ),
    );
  }
}

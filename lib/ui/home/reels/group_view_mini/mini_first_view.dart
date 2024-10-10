import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/ui/home/reels/group_view_mini/mini_grid_view.dart';

import '../../../../core/component/button/custom_button.dart';
import '../../../../core/component/primary_text.dart';
import '../../../../core/helpers/colors/colors.dart';
import '../../../../core/hook/use_l10n.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/model/event/event_details_model.dart';
import '../../../auth/viewmodel/user_view_model.dart';
import '../../../profile/user_groups/bloc/user_groups_bloc.dart';
import '../../../profile/user_groups/bloc/user_groups_events.dart';
import '../../view_model/home_view_model.dart';

class MiniReelsGroupFirstView extends HookConsumerWidget {
  const MiniReelsGroupFirstView({required this.item, super.key});
  final EventDetailsModel item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userModel = ref.watch(userViewModelProvider).tokenModel;
    final l10n = useL10n();
    final viewModel = ref.read(homeViewModelProvider.notifier);
    final theme = ref.watch(appThemeProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryText(
          l10n.donTBeAlone,
          style: theme.textTheme.bodyLarge.copyWith(
            color: MainColors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        PrimaryText(
          l10n.letsFindGroup,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium.copyWith(
            color: MainColors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        const MiniGroupGridView(),
        const SizedBox(height: 30),
        CustomButton(
          text: l10n.matchWithGroup,
          style: theme.textTheme.bodyXLarge.copyWith(
            fontWeight: FontWeight.bold,
            color: MainColors.white,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
          onPressed: () {
            if (item.id != null) {
              if (item.groupRequest != null) {
                viewModel.deleteGroupRequest(item.id!);
              } else {
                viewModel.createGroupRequest(item.id!);
              }
              context.read<UserGroupsBloc>().add(GetUserGroups(''));
            }
          },
        )
      ],
    );
  }
}

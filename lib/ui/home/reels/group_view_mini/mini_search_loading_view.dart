import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
import 'mini_grid_view.dart';

class MiniGroupSearchLoadingView extends StatefulHookConsumerWidget {
  const MiniGroupSearchLoadingView({
    required this.item,
    super.key,
  });
  final EventDetailsModel item;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MiniGroupSearchLoadingViewState();
}

class _MiniGroupSearchLoadingViewState extends ConsumerState<MiniGroupSearchLoadingView> {
  @override
  Widget build(BuildContext context) {
    final userModel = ref.watch(userViewModelProvider).tokenModel;
    final l10n = useL10n();
    final viewModel = ref.read(homeViewModelProvider.notifier);
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider.notifier).isDark;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryText(
          l10n.searchGroupForYou,
          style: theme.textTheme.bodyLarge.copyWith(
            color: MainColors.white,
            fontWeight: FontWeight.w700,
            fontSize: 20,
          ),
        ),
        PrimaryText(
          l10n.weWillNotifyYou,
          textAlign: TextAlign.center,
          style: theme.textTheme.bodyMedium.copyWith(
            color: MainColors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 10),
        const Center(
          child: MiniGroupGridView(),
        ),
        const SizedBox(height: 30),
        SizedBox(
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: CustomButton(
                  maxWidthTextContainer:300,
                  text: l10n.creatingGroupRequest,
                  maxLines: 1,
                  style: theme.textTheme.bodyMedium.copyWith(
                    color: themeMode ? MainColors.white : MainColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                  bgColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                    side: const BorderSide(
                      color: MainColors.primary,
                      width: 2,
                    ),
                  ),
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}

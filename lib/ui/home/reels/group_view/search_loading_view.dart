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

class GroupSearchLoadingView extends StatefulHookConsumerWidget {
  const GroupSearchLoadingView({
    required this.item,
    this.onCancel,
    this.hideEventName,
    super.key,
  });
  final EventModel item;
  final VoidCallback? onCancel;
  final bool? hideEventName;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GroupSearchLoadingViewState();
}

class _GroupSearchLoadingViewState extends ConsumerState<GroupSearchLoadingView> {
  @override
  Widget build(BuildContext context) {
    final userModel = ref.watch(userViewModelProvider).tokenModel;
    final l10n = useL10n();
    final viewModel = ref.read(homeViewModelProvider.notifier);
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider.notifier).isDark;

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
            if (widget.hideEventName != true)
              PrimaryText(
                widget.item.name ?? '',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.bodyLarge.copyWith(
                  color: MainColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 32,
                ),
              ),
            PrimaryText(
              l10n.searchGroupForYou,
              style: theme.textTheme.bodyLarge.copyWith(
                color: MainColors.white,
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            PrimaryText(
              l10n.weWillNotifyYou,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium.copyWith(
                color: MainColors.white,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: GroupGridView(),
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
                      style: theme.textTheme.bodyLarge.copyWith(
                        color:
                        themeMode ? MainColors.white : MainColors.primary,
                        fontWeight: FontWeight.w700,
                      ),
                      bgColor: themeMode
                          ? MainColors.dark3
                          : MainColors.primary.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: themeMode
                            ? BorderSide.none
                            : const BorderSide(
                          color: MainColors.primary400,
                          width: 3,
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
        ),
      ),
    );
  }
}

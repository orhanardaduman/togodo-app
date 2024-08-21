import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/profile/view/profil_content.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';
import 'package:togodo/ui/profile/widget/complete_popup_widget.dart';

@RoutePage()
class ProfilePage extends StatefulHookConsumerWidget {
  const ProfilePage({super.key, this.userId, this.controller});
  final String? userId;
  final ScrollController? controller;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: widget.userId != null ? 2 : 3, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(profilViewModelProvider(widget.userId).notifier)
          .fetchProfil()
          .then((value) {
        final model = ref.read(profilViewModelProvider(widget.userId)).profil;
        if (model != null && !model.isBlockedCurrentUserToUser!) {
          if (widget.userId == null) {
            Future.delayed(
              const Duration(milliseconds: 1200),
              shotCompletePopup,
            );
          }
        }
      });
    });
  }

  void shotCompletePopup() {
    final model = ref.read(profilViewModelProvider(widget.userId));

    if (!model.loading && model.complateRate != 100) {
      showDialog<PopUpWidget>(
        context: context,
        builder: (BuildContext context) {
          return PopUpWidget(
            progress: model.complateRate,
            name: model.name,
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(
      profilViewModelProvider(widget.userId).notifier,
    );
    final viewModelState = ref.watch(
      profilViewModelProvider(widget.userId),
    );
    final theme = ref.watch(appThemeProvider);

    return RefreshIndicator(
      notificationPredicate: (notification) {
        if (notification is OverscrollNotification || Platform.isIOS) {
          return notification.depth == 2;
        }
        return notification.depth == 0;
      },
      onRefresh: viewModel.fetchProfil,
      backgroundColor: theme.appColors.background,
      color: theme.appColors.themeColor,
      child: viewModelState.loading || viewModelState.profil == null
          ? const SizedBox()
          : ProfilContent(
              data: viewModelState.profil,
              userId: widget.userId,
              tabController: _tabController,
              controller: widget.controller,
            ),
    );
  }
}

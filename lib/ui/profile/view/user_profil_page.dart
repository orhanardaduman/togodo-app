import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/enums/cache_items.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/profile/view/profil_content.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';

@RoutePage()
class UserProfilePage extends StatefulHookConsumerWidget {
  const UserProfilePage({required this.userId, super.key});
  final String userId;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserProfilePageState();
}

class _UserProfilePageState extends ConsumerState<UserProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(profilViewModelProvider(widget.userId).notifier)
          .fetchProfil()
          .then((value) async {
        final model = ref.read(profilViewModelProvider(widget.userId)).profil;
        if (model != null &&
            !model.isBlockedCurrentUserToUser! &&
            ((model.titleCompletion ?? false) ||
                (model.bioCompletion ?? false) ||
                (model.socialMediaCompletion ?? false))) {
          final theme = ref.read(appThemeProvider);
          final blurCount = await CacheItems.blurCount.readSecureData();
          final tokenModel = ref.read(userViewModelProvider).tokenModel;
          // Cache de blurSayısını tutuyorum. Her kullanıcı profiline girdiğinde 1 artırıyorum ve isEven ile tam bölünüyorsa infoyu gösteriyorum.
          if (!tokenModel!.token!.bioCompletion! ||
              !tokenModel.token!.socialMediaCompletion! ||
              !tokenModel.token!.tagCompletion!) {
            if (int.parse(blurCount ?? '0').isEven &&
                tokenModel.token!.userType == 0 &&
                model.type == 0) {
              Future.delayed(
                const Duration(milliseconds: 2500),
                () => showBlurInfo(theme, context),
              );
            }
            await CacheItems.blurCount
                .writeSecureData('${int.parse(blurCount ?? '0') + 1}');
          }
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(
      profilViewModelProvider(widget.userId).notifier,
    );
    final viewModelState = ref.watch(
      profilViewModelProvider(widget.userId),
    );

    return Scaffold(
      body: RefreshIndicator(
        notificationPredicate: (notification) {
          if (notification is OverscrollNotification || Platform.isIOS) {
            return notification.depth == 2;
          }
          return notification.depth == 0;
        },
        onRefresh: viewModel.fetchProfil,
        child: viewModelState.loading || viewModelState.profil == null
            ? const SizedBox()
            : ProfilContent(
                data: viewModelState.profil,
                tabController: _tabController,
                userId: widget.userId,
              ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:togodo/core/helpers/index.dart';

class CustomRefresher extends StatelessWidget {
  const CustomRefresher({
    required this.controller,
    required this.child,
    super.key,
    this.scrollController,
    this.enablePullDown = true,
    this.enablePullUp = false,
    this.onRefresh,
    this.onLoading,
  });
  final RefreshController controller;
  final ScrollController? scrollController;
  final void Function()? onRefresh;
  final void Function()? onLoading;
  final bool enablePullDown;
  final bool enablePullUp;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: controller,
      footer: const ClassicFooter(
        completeDuration: Duration.zero,
        idleText: '',
        loadingText: '',
        noDataText: '',
        failedText: '',
        canLoadingText: '',
        height: 0,
      ),
      header: const RefreshNullHeader(),
      physics: const BouncingScrollPhysics(),
      enablePullUp: enablePullUp,
      enablePullDown: enablePullDown,
      onLoading: () async {
        onLoading?.call();
        controller.loadComplete();
      },
      scrollController: scrollController,
      onRefresh: () async {
        onRefresh?.call();
        await Future<dynamic>.delayed(const Duration(milliseconds: 1000));
        controller.refreshCompleted();
      },
      child: child,
    );
  }
}

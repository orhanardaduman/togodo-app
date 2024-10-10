// ignore_for_file: deprecated_member_use_from_same_package, avoid_positional_boolean_parameters

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/ui/home/reels/components/event_action_button.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';

class ReelsBottomButton extends HookConsumerWidget {
  const ReelsBottomButton(
      {required this.showMore,
      required this.model,
      required this.onShowMore,
      super.key});
  final EventModel model;
  final bool showMore;
  final Function(bool newValue) onShowMore;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(homeViewModelProvider.notifier);
    final homeViewModel = ref.watch(homeViewModelProvider);
    return ShowCaseWidget(
      onStart: (index, key) {
        log('onStart: $index, $key');
      },
      enableShowcase: homeViewModel.enableShowcase,
      onComplete: (index, key) {
        notifier.setEnableShowcase();
      },
      blurValue: 1,
      builder: (context) {
        return SafeArea(
          child: Container(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: context.device.isAndroidDevice ? 10 : 1,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                EventButton(
                    model: model,
                    enableShowCase: homeViewModel.enableShowcase,
                    isHomePage: true,
                    showMore: showMore,
                    onShowMore: onShowMore),
              ],
            ),
          ),
        );
      },
      autoPlayDelay: const Duration(seconds: 3),
    );
  }
}

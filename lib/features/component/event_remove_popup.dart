import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/theme/app_theme.dart';

class EventRemoveWidget extends StatelessWidget {
  const EventRemoveWidget({
    required this.l10n,
    required this.theme,
    required this.eventName,
    super.key,
  });
  final L10n l10n;
  final AppTheme theme;
  final String eventName;

  @override
  Widget build(BuildContext context) {
    return CustomModal(
      borderRadius: const BorderRadius.all(
        Radius.circular(52),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          PrimaryText(
            '🎫',
            style: theme.textTheme.h1,
          ),
          context.sized.emptySizedHeightBoxLow,
          PrimaryText(
            l10n.eventRemoved,
            style: theme.textTheme.h4.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: context.dyHeight(32),
          ),
          PrimaryText(
            l10n.eventRemovedInfo(eventName),
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: context.dyHeight(32),
          ),
          CustomButton(
            text: l10n.exploreEvents,
            onPressed: () {
              AutoRouter.of(context).pop();
            },
            radius: 100,
          ),
        ],
      ),
    );
  }
}

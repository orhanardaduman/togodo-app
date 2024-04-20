// ignore_for_file: cascade_invocations, deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';

class AlertWidget extends HookConsumerWidget {
  const AlertWidget({
    required this.message,
    super.key,
    this.type = AlertType.success,
    this.style,
  });
  final String message;
  final AlertType? type;
  final TextStyle? style;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final color = AlertType.success == type
        ? MainColors.green
        : AlertType.error == type
            ? MainColors.red
            : AlertType.warning == type
                ? MainColors.orange
                : AlertType.info == type
                    ? MainColors.blue
                    : MainColors.primary;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      decoration: BoxDecoration(
        color: type != AlertType.custom ? color.withOpacity(0.2) : color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          if (type != AlertType.custom)
            Assets.icons.bold.infoCircle.svg(
              color: color,
              width: 18,
              height: 18,
            ),
          const SizedBox(width: 2.5),
          Expanded(
            child: PrimaryText(
              message,
              style: style ??
                  theme.textTheme.bodyMedium.copyWith(
                    color: color,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

// Kullanımı:
// AlertWidget(message: "Alert message", color: Colors.green.withOpacity(0.2)),
enum AlertType { success, error, warning, info, custom }

void showToast(
  BuildContext context,
  String message, {
  AlertType? type = AlertType.success,
  ToastGravity? gravity = ToastGravity.BOTTOM,
  TextStyle? style,
  bool isPosition = false,
}) {
  final fToast = FToast();
  fToast
    ..init(context)
    ..showToast(
      child: AlertWidget(message: message, type: type, style: style),
      gravity: gravity,
      positionedToastBuilder: isPosition
          ? (context, child) {
              return Positioned(
                bottom: 120,
                left: 20,
                right: 20,
                child: child,
              );
            }
          : null,
    );
}

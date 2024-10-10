import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:lottie/lottie.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';

class WonWidget extends StatelessWidget {
  const WonWidget({
    required this.l10n,
    required this.theme,
    required this.applause,
    super.key,
  });
  final L10n l10n;
  final AppTheme theme;
  final String applause;

  @override
  Widget build(BuildContext context) {
    return CustomModal(
      borderRadius: const BorderRadius.all(
        Radius.circular(52),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LottieBuilder.asset(
            Assets.lottie.clapFast,
            height: context.dyHeight(200),
          ),
          PrimaryText(
            l10n.applauseInfoPopupTitle(applause),
            style: theme.textTheme.h4.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: context.dyHeight(32),
          ),
          PrimaryText(
            l10n.applauseInfoPopup(applause),
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: context.dyHeight(32),
          ),
          CustomButton(
            text: l10n.close,
            mode: ButtonMode.dark,
            onPressed: () {
              Navigator.of(context).pop();
            },
            radius: 100,
          ),
        ],
      ),
    );
  }
}

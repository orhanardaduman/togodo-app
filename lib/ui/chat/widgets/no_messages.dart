import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';

class NoMessages extends StatelessWidget {
  const NoMessages({
    required this.theme,
    required this.l10n,
    super.key,
  });

  final AppTheme theme;
  final L10n l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Text
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 43),
          child: Column(
            children: [
              PrimaryText(
                l10n.noMessageInfo,
                style: theme.textTheme.h4.copyWith(
                  color: MainColors.primary,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 16,
              ),
              PrimaryText(
                l10n.noMessageInfoSub,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 35,
        ),
        Assets.images.dark.messagesDark.svg(),
        const SizedBox(
          height: 180,
        ),
      ],
    );
  }
}

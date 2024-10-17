// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/date_time.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/settings/language_settings.dart';

class EventInfo extends HookConsumerWidget {
  const EventInfo({
    required this.name,
    required this.date,
    required this.starTime,
    required this.location,
    required this.description,
    this.endTime,
    this.spacing = 24,
    super.key,
    this.isNew = false,
  });
  final String name;
  final String date;
  final String starTime;
  final String? endTime;
  final String location;
  final String description;
  final double spacing;
  final bool isNew;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final language = ref.watch(languageProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText(
          name,
          style: theme.textTheme.h5.copyWith(
            fontWeight: FontWeight.w700,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(
          height: spacing,
        ),
        Row(
          children: <Widget>[
            Assets.icons.bold.calendar.svg(
              width: 20,
              height: 20,
              color: MainColors.primary,
            ),
            const SizedBox(
              width: 8,
            ),
            PrimaryText(
              '${date.getFormattedDate(language)} ${date.getFormattedDay(language)} ${isNew ? "$starTime ${endTime != "" && endTime != null ? "- $endTime" : ""} " : ""}',
              style: theme.textTheme.bodyLarge.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        if (!isNew)
          SizedBox(
            height: spacing,
          ),
        if (!isNew)
          Row(
            children: <Widget>[
              Assets.icons.bold.timeSquare.svg(
                width: 20,
                height: 20,
                color: MainColors.primary,
              ),
              const SizedBox(
                width: 8,
              ),
              PrimaryText(
                starTime,
                style: theme.textTheme.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (endTime != null)
                PrimaryText(
                  ' - $endTime',
                  style: theme.textTheme.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
            ],
          ),
        SizedBox(
          height: spacing,
        ),
        Row(
          children: <Widget>[
            Assets.icons.bold.location.svg(
              width: 20,
              height: 20,
              color: MainColors.primary,
            ),
            const SizedBox(
              width: 8,
            ),
            SizedBox(
              width: context.sized.dynamicWidth(
                0.5,
              ),
              child: PrimaryText(
                location,
                style: theme.textTheme.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

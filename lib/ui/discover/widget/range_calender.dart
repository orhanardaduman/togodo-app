// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/discover/view_model/filter_view_model.dart';
import 'package:togodo/ui/settings/language_settings.dart';

class CustomRangeCalendar extends StatefulHookConsumerWidget {
  const CustomRangeCalendar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomRangeCalendarState();
}

class _CustomRangeCalendarState extends ConsumerState<CustomRangeCalendar> {
  DateTime _focusedDay = DateTime.now();
  @override
  void initState() {
    super.initState();
  }

  void rightButton() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
    });
  }

  void leftButton() {
    setState(() {
      _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final language = ref.watch(languageProvider);
    final notifier = ref.read(filterViewModelProvider.notifier);
    final model = ref.watch(filterViewModelProvider);

    return Container(
      decoration: BoxDecoration(
        color: theme.mode == ThemeMode.dark
            ? MainColors.dark2
            : MainColors.grey100,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.all(16),
      child: TableCalendar<dynamic>(
        locale: language,
        firstDay: DateTime(
          DateTime.now().year - 1,
          DateTime.now().month,
        ),
        lastDay: DateTime(
          DateTime.now().year + 1,
          DateTime.now().month,
        ),
        focusedDay: _focusedDay,
        rangeStartDay: model.filterStartDate,
        rangeEndDay: model.filterEndDate,
        rangeSelectionMode: RangeSelectionMode.toggledOn,
        calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
          rangeStartDecoration: const BoxDecoration(
            color: MainColors.primary,
            shape: BoxShape.circle,
          ),
          rangeEndDecoration: const BoxDecoration(
            color: MainColors.primary,
            shape: BoxShape.circle,
          ),
          rangeHighlightColor: MainColors.primary200,
          todayDecoration: const BoxDecoration(
            color: MainColors.primary,
            shape: BoxShape.circle,
          ),
          selectedDecoration: const BoxDecoration(
            color: MainColors.primary,
            shape: BoxShape.circle,
          ),
          defaultTextStyle: theme.textTheme.bodyMedium
              .copyWith(
                color: theme.mode == ThemeMode.dark
                    ? MainColors.white
                    : MainColors.dark2,
              )
              .copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
          todayTextStyle: theme.textTheme.bodyMedium
              .copyWith(
                color: Colors.black,
              )
              .copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
          selectedTextStyle: theme.textTheme.bodyMedium
              .copyWith(
                color: Colors.black,
              )
              .copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
        ),
        onRangeSelected: (start, end, focusedDay) {
          notifier.setRangeDate(start, end);
        },
        headerStyle: HeaderStyle(
          formatButtonVisible: false,
          leftChevronVisible: false,
          titleTextStyle: theme.textTheme.bodyXLarge.copyWith(
            color: theme.appColors.text,
            fontWeight: FontWeight.w700,
          ),
          headerPadding: const EdgeInsets.only(left: 12, bottom: 12),
          rightChevronPadding: EdgeInsets.zero,
          rightChevronIcon: Row(
            children: [
              InkWell(
                onTap: leftButton,
                child: Assets.icons.bold.arrowLeft2.svg(
                  color: theme.mode == ThemeMode.dark
                      ? MainColors.white
                      : MainColors.grey500,
                ),
              ),
              const SizedBox(width: 4), // Oklar arasındaki boşluk
              InkWell(
                onTap: rightButton,
                child: Assets.icons.bold.arrowRight2.svg(),
              ),
            ],
          ),
        ),
        daysOfWeekStyle: DaysOfWeekStyle(
          weekendStyle: theme.textTheme.bodySmall.copyWith(
            color: theme.appColors.text,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

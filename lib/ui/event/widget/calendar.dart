// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/event/view_model/create_event_view_model.dart';
import 'package:togodo/ui/settings/language_settings.dart';

void showCustomDate(
  BuildContext context,
  List<Widget> children,
  AppTheme theme,
  String title,
  L10n l10n,
  VoidCallback? onClear,
  void Function()? onPressed, {
  bool isFinish = false,
}) {
  showModalBottomSheet<dynamic>(
    context: context,
    isDismissible: false,
    backgroundColor: Colors.transparent,
    isScrollControlled: true, // Bu tam ekran yükseklik için sayfayı izin verir.
    builder: (BuildContext context) {
      return SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 24, left: 24, right: 24),
          decoration: BoxDecoration(
            color: theme.appColors.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            border: Border.all(
              color: MainColors.dark3,
            ),
          ),
          child: Column(
            children: <Widget>[
              Container(
                width: 38,
                height: 3,
                margin: const EdgeInsets.only(top: 16),
                decoration: BoxDecoration(
                  color: MainColors.grey300,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Center(
                      child: PrimaryText(
                        title,
                        style: theme.textTheme.h4.copyWith(
                          color: theme.appColors.text,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    if (onClear != null)
                      Positioned(
                        right: 10,
                        top: 0,
                        bottom: 0,
                        child: TextButton(
                          onPressed: onClear,
                          child: PrimaryText(
                            l10n.clear,
                            style: theme.textTheme.bodySmall.copyWith(
                              color: theme.appColors.text,
                              fontWeight: FontWeight.w700,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              Divider(
                color: theme.appColors.divider,
                height: 44,
              ),
              ...children, // Kullanıcı tarafından sağlanan widget listesi
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: context.isSmallScrn ? 144 : 184,
                    child: CustomButton(
                      text: l10n.cancel,
                      radius: 100,
                      mode: ButtonMode.dark,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  SizedBox(
                    width: context.isSmallScrn ? 144 : 184,
                    child: CustomButton(
                      text: isFinish ? l10n.complete : l10n.go,
                      radius: 100,
                      onPressed: onPressed,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

class CustomCalendar extends StatefulHookConsumerWidget {
  const CustomCalendar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CustomCalendarState();
}

class _CustomCalendarState extends ConsumerState<CustomCalendar> {
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
    final model = ref.watch(createEventModelProvider.notifier);

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
        firstDay: DateTime.now(),
        lastDay: DateTime(
          DateTime.now().year + 1,
          DateTime.now().month,
        ),
        focusedDay: _focusedDay,
        calendarStyle: CalendarStyle(
          isTodayHighlighted: false,
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
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _focusedDay = focusedDay;
            model.selectedDate = selectedDay;
          });
        },
        selectedDayPredicate: (day) => isSameDay(_focusedDay, day),
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

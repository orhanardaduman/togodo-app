import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/input/custom_place_picker.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/welcome_question/widget/hoby_multi_select.dart';
import 'package:togodo/ui/discover/view_model/filter_view_model.dart';
import 'package:togodo/ui/discover/widget/range_calender.dart';
import 'package:togodo/ui/discover/widget/time_check.dart';
import 'package:togodo/ui/event/widget/calendar.dart';

class DiscoverFilterView extends StatefulHookConsumerWidget {
  const DiscoverFilterView({
    super.key,
  });
  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _DiscoverFilterViewState();
}

class _DiscoverFilterViewState extends ConsumerState<DiscoverFilterView> {
  double _lowerValue = 0;
  double _upperValue = 40;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final notifier = ref.read(filterViewModelProvider.notifier);
    final model = ref.watch(filterViewModelProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        PrimaryText(
          l10n.categorys,
          style: theme.textTheme.bodyXLarge.copyWith(
            color: theme.appColors.text,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 24),
        HobyPositionMultiSelect(
          isZero: true,
          isScroll: true,
          onTap: notifier.setHoby,
          initVal: model.filterTags,
        ),
        const SizedBox(height: 24),
        PrimaryText(
          l10n.location_label,
          style: theme.textTheme.bodyXLarge.copyWith(
            color: theme.appColors.text,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 24),
        /* CustomLocationSearchField(
          label: l10n.location_label,
          controller: notifier.locationController,
          prefixIcon: Assets.icons.bold.location.path,
        ), */
        CustomPlaceField(
          label: l10n.location_label,
          initialValue: model.filterLocation,
          prefixIcon: Assets.icons.bold.location.path,
          controller: notifier.locationController,
          onChanged: notifier.setLocation,
        ),
        const SizedBox(height: 24),
        PrimaryText(
          l10n.distance,
          style: theme.textTheme.bodyXLarge.copyWith(
            color: theme.appColors.text,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 30),
        RangeSliderFlutter(
          values: [model.filterLowerKm, model.filterUpperKm],
          rangeSlider: true,
          tooltip: RangeSliderFlutterTooltip(
            alwaysShowTooltip: true,
            format: (val) {
              return '${double.parse(val).toInt()} km';
            },
            boxStyle: RangeSliderFlutterTooltipBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: MainColors.primary,
              ),
              transform: Matrix4.translationValues(0, 10, 0),
            ),
          ),
          max: 50,
          textPositionTop: -100,
          handlerHeight: 30,
          onDragCompleted: (handlerIndex, lowerValue, upperValue) {
            notifier.setKm(_lowerValue, _upperValue);
          },
          trackBar: RangeSliderFlutterTrackBar(
            activeTrackBarHeight: 10,
            inactiveTrackBarHeight: 10,
            activeTrackBar: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: MainColors.primary,
            ),
            inactiveTrackBar: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
          ),
          min: 0,
          fontSize: 15,
          textBackgroundColor: MainColors.primary,
          onDragging: (handlerIndex, lowerValue, upperValue) {
            _lowerValue = lowerValue;
            _upperValue = upperValue;
            setState(() {});
          },
        ),
        const SizedBox(height: 24),
        PrimaryText(
          l10n.timeInterval,
          style: theme.textTheme.bodyXLarge.copyWith(
            color: theme.appColors.text,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 24),
        FilterTimeSelect(
          isZero: true,
          isScroll: true,
          onTap: notifier.setTime,
          initVal: model.filterTime,
        ),
        const SizedBox(height: 24),
        Center(
          child: TextButton(
            onPressed: () {
              showCustomDate(
                context,
                [
                  const CustomRangeCalendar(),
                ],
                ref.watch(appThemeProvider),
                l10n.selectDate,
                l10n,
                () {
                  Navigator.pop(context);
                },
              );
            },
            child: PrimaryText(
              l10n.selectDate,
              style: theme.textTheme.bodyXLarge.copyWith(
                color: theme.appColors.themeColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Divider(
          color: theme.appColors.divider,
          height: 48,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: context.sized.dynamicWidth(0.4),
              child: CustomButton(
                text: l10n.clear,
                radius: 100,
                mode: ButtonMode.dark,
                onPressed: () {
                  notifier.clearFilterLoading();
                  Navigator.pop(context);
                },
              ),
            ),
            SizedBox(
              width: context.sized.dynamicWidth(0.4),
              child: CustomButton(
                text: l10n.confirm,
                radius: 100,
                onPressed: () {
                  notifier.isFilter();
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}

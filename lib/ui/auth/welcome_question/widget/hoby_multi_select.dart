import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/features/provider/tag_provider.dart';
import 'package:togodo/ui/auth/welcome_question/widget/custom_check.dart';

class HobyPositionMultiSelect extends StatefulHookConsumerWidget {
  const HobyPositionMultiSelect({
    super.key,
    this.isScroll = false,
    this.isZero = false,
    this.initVal,
    this.onTap,
  });

  final void Function(List<TagsModel?>)? onTap;
  final bool isScroll;
  final bool isZero;
  final List<TagsModel?>? initVal;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HobyPositionMultiSelectState();
}

class _HobyPositionMultiSelectState
    extends ConsumerState<HobyPositionMultiSelect> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);

    final hobyData = ref
        .watch(hobyStateNotifierProvider(context))
        .where(
          (element) => widget.isZero
              ? (element.id! >= 0)
              : (element.id! > 0) && element.id! < 20,
        )
        .toList();
    final items = hobyData
        .map((item) => MultiSelectItem<TagsModel>(item, item.name!))
        .toList();
    final selectedTextStyle = theme.textTheme.bodyXLarge.copyWith(
      color: MainColors.white,
      fontWeight: FontWeight.w700,
    );
    return CustomMultiSelectChipField<TagsModel?>(
      showHeader: false,
      textStyle: selectedTextStyle.copyWith(color: MainColors.primary),
      decoration: const BoxDecoration(
        border: Border(),
        color: Colors.transparent,
      ),
      initialValue: widget.initVal,
      chipShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: const BorderSide(
          color: MainColors.primary,
          width: 2,
        ),
      ),
      chipColor: MainColors.transparentBlue,
      selectedChipColor: MainColors.primary,
      selectedTextStyle: selectedTextStyle,
      scroll: widget.isScroll,
      items: items,
      onTap: widget.onTap,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/ui/auth/welcome_question/widget/custom_check.dart';

class FilterTimeSelect extends StatefulHookConsumerWidget {
  const FilterTimeSelect({
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
      _FilterTimeSelectState();
}

class _FilterTimeSelectState extends ConsumerState<FilterTimeSelect> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final items0 = [
      TagsModel(id: 0, name: l10n.ahours),
      TagsModel(id: 1, name: l10n.oneWeek),
      TagsModel(id: 2, name: l10n.oneMonth),
      TagsModel(id: 3, name: l10n.oneMonth),
    ];
    final items = items0
        .map((item) => MultiSelectItem<TagsModel>(item, item.name!))
        .toList();
    final selectedTextStyle = theme.textTheme.bodyXLarge.copyWith(
      color: MainColors.white,
      fontWeight: FontWeight.w700,
    );
    return CustomMultiSelectChipField<TagsModel?>(
      showHeader: false,
      initialValue: widget.initVal ?? [],
      textStyle: selectedTextStyle.copyWith(color: MainColors.primary),
      decoration: const BoxDecoration(
        border: Border(),
        color: Colors.transparent,
      ),
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
      isSingleSelect: true,
      items: items,
      onTap: widget.onTap,
    );
  }
}

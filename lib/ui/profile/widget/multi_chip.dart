// ignore_for_file: prefer_null_aware_method_calls

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/features/component/custom_divider.dart';
import 'package:togodo/features/custom_multi_chip/custom_multi_chip.dart';
import 'package:togodo/features/custom_multi_chip/custom_multi_select.dart';
import 'package:togodo/features/provider/tag_provider.dart';

class HobyPositionMultiChip extends StatefulHookConsumerWidget {
  const HobyPositionMultiChip({
    required this.onTap,
    super.key,
    this.initialValue = const [],
    this.isOpen = false,
  });

  final void Function(List<TagsModel>) onTap;
  final List<TagsModel?>? initialValue;
  final bool isOpen;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _HobyPositionMultiChipState();
}

class _HobyPositionMultiChipState extends ConsumerState<HobyPositionMultiChip> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final hobyData = ref
        .watch(hobyStateNotifierProvider(context))
        .where((element) => element.id! > 0 && element.id! < 20)
        .toList();

    final items = hobyData
        .map((item) => MultiSelectItem<TagsModel>(item, item.name!))
        .toList();

    final selectedTextStyle = theme.textTheme.bodyXLarge.copyWith(
      color: MainColors.white,
      fontWeight: FontWeight.w700,
    );
    return CustomMultiSelectBottomSheetField<TagsModel?>(
      items: items,
      maxChildSize: 0.8,
      minChildSize: 0.6,
      initialChildSize: 0.6,
      initialValue: widget.initialValue!,
      theme: theme,
      isOpen: widget.isOpen,
      title: bottomSheetTitle(l10n, theme),
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(52),
          topRight: Radius.circular(52),
        ),
        side: BorderSide(
          color: theme.mode == ThemeMode.dark
              ? MainColors.dark2
              : MainColors.grey100,
        ),
      ),
      unselectedColor: MainColors.transparentBlue,
      backgroundColor: theme.appColors.background,
      searchHint: l10n.add_tag_label,
      cancelText: l10n.back,
      confirmText: l10n.go,
      itemsTextStyle: theme.textTheme.bodyXLarge.copyWith(
        fontWeight: FontWeight.w700,
        color: MainColors.primary,
      ),
      listType: MultiSelectListType.CHIP,
      buttonText: Text(
        l10n.add_tag_label,
        style: theme.textTheme.bodyMedium.copyWith(
          fontWeight: FontWeight.w700,
          color: MainColors.primary,
        ),
      ),
      validator: (values) {
        if (values == null || values.isEmpty) {
          return l10n.add_tag_label;
        }
        return null;
      },
      selectedColor: MainColors.primary400,
      selectedItemsTextStyle: selectedTextStyle,
      chipDisplay: CustomMultiSelectChipDisplay(
        textStyle: selectedTextStyle,
        chipColor: MainColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: const BorderSide(
            color: MainColors.primary,
            width: 2,
          ),
        ),
      ),
      onConfirm: (values) {
        final nonNullableValues =
            values.where((tag) => tag != null).cast<TagsModel>().toList();
        widget.onTap(nonNullableValues);
      },
    );
  }

  Column bottomSheetTitle(L10n l10n, AppTheme theme) {
    return Column(
      children: [
        Container(
          width: 38,
          height: 3,
          margin: const EdgeInsets.only(bottom: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(100),
            ),
            color: Color(0xffe0e0e0),
          ),
        ),
        PrimaryText(
          l10n.add_tag_label,
          style: theme.textTheme.h4.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        const CustomDivider(),
      ],
    );
  }
}

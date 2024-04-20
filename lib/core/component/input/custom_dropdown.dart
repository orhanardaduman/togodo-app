// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';

@immutable
class DropDownModel {
  const DropDownModel({
    required this.id,
    required this.name,
  });
  final int id;
  final String? name;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DropDownModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

class CustomDropdownField extends StatefulHookConsumerWidget {
  const CustomDropdownField({
    required this.label,
    required this.items,
    this.onChanged,
    this.value,
    super.key,
    this.prefixIcon,
    this.isEnabled = true,
  });
  final String label;
  final String? prefixIcon;
  final bool isEnabled;
  final List<DropDownModel> items;
  final DropDownModel? value;
  final void Function(DropDownModel?)? onChanged;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomDropdownFieldState();
}

class _CustomDropdownFieldState extends ConsumerState<CustomDropdownField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _hasInput = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  void _onTextChanged() {
    setState(() {
      _hasInput = _controller.text.isNotEmpty;
    });
  }

  void _onFocusChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(appThemeModeProvider.notifier);
    final theme = ref.watch(appThemeProvider);
    final inputColor = widget.isEnabled
        ? (_hasInput || _focusNode.hasFocus
            ? MainColors.primary200
            : MainColors.grey500)
        : MainColors.grey500;
    return dropDown(
      inputColor,
      theme,
      themeMode,
    );
  }

  DropdownButtonHideUnderline dropDown(
    Color inputColor,
    AppTheme theme,
    ThemeModeNotifier themeMode,
  ) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<DropDownModel?>(
        focusNode: _focusNode,
        isExpanded: true,
        value: widget.value,
        hint: Row(
          children: [
            Text(
              widget.label,
              style: theme.textTheme.bodyMedium.copyWith(
                color: inputColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        items: widget.items
            .map(
              (DropDownModel item) => DropdownMenuItem<DropDownModel>(
                value: item,
                child: Text(
                  item.name!,
                  style: theme.textTheme.bodyMedium.copyWith(
                    color: inputColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
            .toList(),
        onChanged: widget.onChanged,
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 6,
          ),
          decoration: BoxDecoration(
            borderRadius: FormStyle.borderRadius,
            border: Border.all(
              width: 2,
              color: widget.isEnabled && (_hasInput || _focusNode.hasFocus)
                  ? MainColors.primary200
                  : Colors.transparent,
            ),
            color: (themeMode.isDark ? MainColors.dark2 : MainColors.grey50),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Assets.icons.bold.arrowDown2.svg(color: inputColor, width: 20),
          iconSize: 20,
          iconEnabledColor: inputColor,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 300,
          offset: const Offset(0, -5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: themeMode.isDark ? MainColors.dark2 : MainColors.grey50,
          ),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: FormStyle.inputHeight,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    _focusNode.removeListener(_onFocusChanged);
    _controller.removeListener(_onTextChanged);
    super.dispose();
  }
}

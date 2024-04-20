// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:togodo/core/component/input/custom_intl_phone_field.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';

abstract class FormStyle {
  static const double inputHeight = 56;
  static const double inputWidth = 20;
  static const double inputHeightVertical = 20;
  static const Color cursorColor = MainColors.primary;
  static const double cursorWidth = 3;
  static final borderRadius = BorderRadius.circular(16);
  static const borderSide = BorderSide(color: MainColors.primary, width: 2);
  static const bool isEnabledBorder = false;
  static InputDecoration decoration(
    String? hintText,
    Color fillColor, {
    String? helperText,
    String? suffixText,
    String? counterText,
    bool? isEnabledBorder,
    Widget? prefixIcon,
    Widget? suffixIcon,
    TextStyle? hintStyle,
    Widget? counter,
  }) {
    return InputDecoration(
      hintMaxLines: 5,
      filled: true,
      contentPadding: const EdgeInsets.symmetric(
        vertical: inputHeightVertical,
        horizontal: inputWidth,
      ),
      helperText: helperText,
      errorBorder: errorBorder(),
      fillColor: fillColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      counter: counter,
      enabledBorder: isEnabledBorder ?? false ? focusedBorder() : null,
      focusedErrorBorder: errorBorder(),
      focusedBorder: focusedBorder(),
      hintStyle: hintStyle,
      border: outlineBorder(),
      hintText: hintText,
    );
  }

  static OutlineInputBorder errorBorder() {
    return OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: const BorderSide(color: MainColors.red, width: 2),
    );
  }

  static OutlineInputBorder focusedBorder() {
    return OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: borderSide,
    );
  }

  static OutlineInputBorder outlineBorder() {
    return OutlineInputBorder(
      borderRadius: borderRadius,
      borderSide: BorderSide.none,
    );
  }
}

class CustomPhoneTextField extends StatefulHookConsumerWidget {
  const CustomPhoneTextField({
    required this.controller,
    this.label,
    super.key,
    this.prefixIcon,
    this.onChanged,
    this.isEnabled = true,
  });
  final String? label;
  final String? prefixIcon;
  final bool isEnabled;
  final TextEditingController controller;
  final void Function(PhoneNumber)? onChanged;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomPhoneTextFieldState();
}

class _CustomPhoneTextFieldState extends ConsumerState<CustomPhoneTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _hasInput = false;
  String initLabel = '000 000 00 00';
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  void _onTextChanged() {
    setState(() {
      _hasInput = widget.controller.text.isNotEmpty;
    });
  }

  void _onFocusChanged() {
    setState(() {});
  }

  String addZeros(int value) {
    initLabel = '0' * value;
    initLabel = initLabel.replaceAllMapped(
      RegExp(r'(\d{3})(?=\d)'),
      (match) => '${match[1]} ',
    );
    return initLabel;
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.removeListener(_onFocusChanged);
    widget.controller.removeListener(_onTextChanged);
    _focusNode.dispose();
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
    final l10n = useL10n();
    return CustomIntlPhoneField(
      controller: widget.controller,
      focusNode: _focusNode,
      enabled: widget.isEnabled,
      initialCountryCode: 'TR',
      invalidNumberMessage: l10n.phoneError,
      keyboardType: TextInputType.number,
      keyboardAppearance: themeMode.isDark ? Brightness.dark : Brightness.light,
      dropdownTextStyle: theme.textTheme.bodyMedium.copyWith(
        color: inputColor,
        fontWeight: FontWeight.w500,
      ),
      showDropdownIcon: false,
      dropdownIcon: Icon(
        Icons.expand_more,
        color: inputColor,
      ),
      dropdownIconPosition: IconPosition.trailing,
      style: widget.isEnabled
          ? theme.textTheme.bodyMedium.copyWith(
              color:
                  themeMode.isDark ? MainColors.primary200 : MainColors.grey900,
              fontWeight: FontWeight.w500,
            )
          : theme.textTheme.bodyMedium.copyWith(
              color: MainColors.grey500,
            ),
      flagsButtonMargin: const EdgeInsets.symmetric(
        vertical: 18,
        horizontal: 20,
      ),
      validator: (value) {
        if (value == null) {
          return 'Lütfen ${widget.label} giriniz';
        }
        return null;
      },

/*       pickerDialogStyle: CustomPickerDialogStyle(
        searchFieldPadding: const EdgeInsets.only(top: 20),
        backgroundColor: theme.appColors.background,
        searchFieldInputDecoration: FormStyle.decoration(
          'Search country',
          _hasInput || _focusNode.hasFocus
              ? MainColors.transparentBlue
              : (themeMode.isDark ? MainColors.dark2 : MainColors.grey50),
          hintStyle: theme.textTheme.bodyMedium.copyWith(
            color: inputColor,
            fontWeight: FontWeight.w500,
          ),
          suffixIcon: Padding(
            padding: const EdgeInsets.all(20),
            child: Assets.icons.light.search.svg(
              color: inputColor,
              width: 20,
              height: 20,
            ),
          ),
        ).copyWith(
          contentPadding: const EdgeInsets.all(12),
        ),
        searchFieldCursorColor: FormStyle.cursorColor,
      ), */
      onCountryChanged: (value) {
        setState(() {
          addZeros(value.maxLength);
        });
      },
      onChanged: widget.onChanged,
      decoration: FormStyle.decoration(
        widget.label ?? initLabel,
        _hasInput || _focusNode.hasFocus
            ? MainColors.transparentBlue
            : (themeMode.isDark ? MainColors.dark2 : MainColors.grey50),
        hintStyle: theme.textTheme.bodyMedium.copyWith(
          color: inputColor,
          fontWeight: FontWeight.w500,
        ),
        counterText: '',
        counter: const SizedBox(),
      ),
      cursorColor: FormStyle.cursorColor,
      cursorWidth: FormStyle.cursorWidth,
    );
  }
}

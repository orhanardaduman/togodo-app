// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/input/custom_phone_field.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';

class CustomTextField extends StatefulHookConsumerWidget {
  const CustomTextField({
    required this.label,
    required this.controller,
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines,
    this.minLines,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.isPassword = false,
    this.onFieldSubmitted,
    this.isPrefixColor = true,
    this.isFillColor = true,
    this.isRegExp = false,
    this.onSuffixTap,
    this.onTap,
    this.focusNode,
    this.onChanged,
    this.prefixIconWidget,
    this.suffixIconWidget,
    this.textInputAction,
    this.required = true,
    this.keyboardType,
    this.maxLength,
    this.onSaved,
  });
  final String label;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool isEnabled;
  final bool isReadOnly;
  final bool isPassword;
  final int? minLines;
  final int? maxLines;
  final TextEditingController controller;
  final bool isPrefixColor;
  final void Function()? onTap;
  final void Function()? onSuffixTap;
  final FocusNode? focusNode;
  final bool isFillColor; // Input Arkası dolu olsun olmasın mı
  final void Function(String)? onFieldSubmitted;
  final void Function(String)? onChanged;
  final Widget? prefixIconWidget;
  final Widget? suffixIconWidget;
  final TextInputAction? textInputAction;
  final bool required;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool isRegExp;
  final void Function(String?)? onSaved;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomTextFieldState();
}

class _CustomTextFieldState extends ConsumerState<CustomTextField> {
  FocusNode _focusNode = FocusNode();
  bool _hasInput = false;
  bool _isHide = true;
  bool _isError = false;

  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      _focusNode = widget.focusNode!;
    }
    _isHide = widget.isPassword;
    widget.controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  void _onTextChanged() {
    _hasInput = widget.controller.text.isNotEmpty;
  }

  void _onFocusChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(appThemeModeProvider.notifier);
    final theme = ref.watch(appThemeProvider);
    final inputColor = widget.isEnabled
        ? (_isError
            ? MainColors.red
            : (_hasInput || _focusNode.hasFocus
                ? MainColors.primary200
                : MainColors.grey500))
        : MainColors.grey500;
    final l10n = useL10n();
    return TextFormField(
      onTap: widget.onTap,
      controller: widget.controller,
      focusNode: _focusNode,
      maxLength: widget.maxLength,
      onChanged: widget.onChanged,
      textInputAction: widget.textInputAction,
      enabled: widget.isEnabled,
      onSaved: widget.onSaved,
      readOnly: widget.isReadOnly,
      keyboardType: widget.keyboardType,
      onFieldSubmitted: widget.onFieldSubmitted,
      obscureText: _isHide,
      keyboardAppearance: themeMode.isDark ? Brightness.dark : Brightness.light,
      minLines: widget.minLines,
      maxLines: widget.maxLines ?? (widget.minLines ?? 1),
      // inputFormatters: widget.isRegExp ? [CustomTextInputFormatter()] : null,
      validator: widget.isEnabled && widget.required
          ? (value) {
              if (value == null || value.isEmpty) {
                _isError = true;
                return l10n.requiredInput(widget.label);
              } else {
                _isError = false;
              }
              return null;
            }
          : null,
      style: widget.isEnabled
          ? theme.textTheme.bodyMedium.copyWith(
              color:
                  themeMode.isDark ? MainColors.primary200 : MainColors.grey900,
              fontWeight: FontWeight.w500,
            )
          : theme.textTheme.bodyMedium.copyWith(
              color: MainColors.grey500,
            ),
      decoration: FormStyle.decoration(
        widget.label,
        counter: const SizedBox(),
        counterText: '',
        widget.isFillColor
            ? (_hasInput || _focusNode.hasFocus
                ? MainColors.transparentBlue
                : (themeMode.isDark ? MainColors.dark2 : MainColors.grey50))
            : (themeMode.isDark ? MainColors.dark2 : MainColors.grey50),
        hintStyle: theme.textTheme.bodyMedium.copyWith(
          color: inputColor,
          fontWeight: FontWeight.w500,
        ),
        suffixIcon: widget.isPassword
            ? InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  setState(() {
                    _isHide = !_isHide;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  child: SvgPicture.asset(
                    _isHide
                        ? Assets.icons.bold.hide.path
                        : Assets.icons.bold.show.path,
                    color: inputColor,
                    width: 20,
                  ),
                ),
              )
            : (widget.suffixIcon == null
                ? widget.suffixIconWidget
                : InkWell(
                    highlightColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: widget.onSuffixTap,
                    child: Container(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 10,
                      ),
                      margin: widget.minLines != null
                          ? const EdgeInsets.only(
                              bottom: 40,
                            )
                          : null,
                      child: SvgPicture.asset(
                        widget.suffixIcon!,
                        color: inputColor,
                        width: 20,
                      ),
                    ),
                  )),
        prefixIcon: widget.prefixIcon != null
            ? Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 10,
                ),
                margin: widget.minLines != null
                    ? const EdgeInsets.only(
                        bottom: 40,
                      )
                    : null,
                child: SvgPicture.asset(
                  widget.prefixIcon!,
                  color: widget.isPrefixColor ? inputColor : null,
                  width: 20,
                ),
              )
            : null,
      ),
      cursorColor: MainColors.primary,
      cursorWidth: 3,
    );
  }

  @override
  void dispose() {
    // Sadece kendi yarattığımız FocusNode'ları dispose ediyoruz.
    if (widget.focusNode == null) {
      _focusNode.dispose();
    }

    widget.controller.removeListener(_onTextChanged);
    _focusNode.removeListener(_onFocusChanged);
    super.dispose();
  }
}

class CustomTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    // Türkçe karakterler ve temel noktalama işaretleri dışındaki özel karakterleri engelleyen bir regex
    final regex = RegExp(r'^[a-zA-ZğüşıöçĞÜŞİÖ&Ç0-9 .,!?;:()\-]+$');
    var filtered = '';
    for (final char in newValue.text.split('')) {
      if (regex.hasMatch(char)) {
        filtered += char;
      }
    }
    return TextEditingValue(
      text: filtered,
      selection: TextSelection.collapsed(offset: filtered.length),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:map_location_picker/map_location_picker.dart';
import 'package:togodo/core/component/input/custom_phone_field.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/index.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/map/custom_auto_complate.dart';
import 'package:togodo/gen/assets.gen.dart';

class CustomPlaceField extends StatefulHookConsumerWidget {
  const CustomPlaceField({
    required this.label,
    required this.controller,
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.minLines,
    this.isEnabled = true,
    this.isPassword = false,
    this.onFieldSubmitted,
    this.isPrefixColor = true,
    this.isFillColor = true,
    this.onSuffixTap,
    this.onChanged,
    this.initialValue,
    this.focusNode,
  });
  final String label;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool isEnabled;
  final bool isPassword;
  final int? minLines;
  final TextEditingController controller;
  final bool isPrefixColor;
  final void Function(Prediction?)? onChanged;
  final void Function()? onSuffixTap;
  final FocusNode? focusNode;
  final Prediction? initialValue;
  final bool isFillColor; // Input Arkası dolu olsun olmasın mı
  final void Function(String)? onFieldSubmitted;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomPlaceFieldState();
}

class _CustomPlaceFieldState extends ConsumerState<CustomPlaceField> {
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

    return CustomPlacesAutocomplete(
      controller: widget.controller,
      focusNode: _focusNode,
      enabled: widget.isEnabled,
      searchHintText: l10n.searchText,
      initialValue: widget.initialValue,
      topCardColor: Colors.transparent,
      hideBackButton: true,
      components: [Component('country', 'tr')],
      validator: widget.isEnabled
          ? (value) {
              if (value == null) {
                _isError = true;
                return l10n.requiredInput(widget.label);
              } else {
                _isError = false;
              }
              return null;
            }
          : null,
      onChanged: widget.onChanged,
      decoration: FormStyle.decoration(
        widget.label,
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
                ? null
                : InkWell(
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
      apiKey: getGoogleMapsApiKey(),
      mounted: true,
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
}

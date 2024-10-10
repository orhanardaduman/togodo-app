// ignore_for_file: deprecated_member_use

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:searchfield/searchfield.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';

class CustomLocationSearchField extends StatefulHookConsumerWidget {
  const CustomLocationSearchField({
    required this.label,
    required this.controller,
    super.key,
    this.prefixIcon,
    this.suffixIcon,
    this.minLines,
    this.isEnabled = true,
    this.isReadOnly = false,
    this.isPassword = false,
    this.onFieldSubmitted,
    this.isPrefixColor = true,
    this.isFillColor = true,
    this.required = true,
    this.onSuffixTap,
    this.onTap,
    this.focusNode,
  });
  final String label;
  final String? prefixIcon;
  final String? suffixIcon;
  final bool isEnabled;
  final bool isReadOnly;
  final bool isPassword;
  final int? minLines;
  final TextEditingController controller;
  final bool isPrefixColor;
  final bool required;
  final void Function()? onTap;
  final void Function()? onSuffixTap;
  final FocusNode? focusNode;
  final bool isFillColor; // Input Arkası dolu olsun olmasın mı
  final void Function(String)? onFieldSubmitted;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomLocationSearchFieldState();
}

class _CustomLocationSearchFieldState
    extends ConsumerState<CustomLocationSearchField> {
  List<String> suggestions = [];
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
    loadJsonData();
  }

  void _onTextChanged() {
    _hasInput = widget.controller.text.isNotEmpty;
  }

  void _onFocusChanged() {
    setState(() {});
  }

  Future<void> loadJsonData() async {
    final jsonString = await rootBundle.loadString('assets/json/country.json');
    processJsonAndAddToSuggestions(jsonString);
  }

  void processJsonAndAddToSuggestions(String jsonString) {
    final List<dynamic> jsonList = json.decode(jsonString);
    for (final stateJson in jsonList) {
      final state = StateModel.fromJson(stateJson as Map<String, dynamic>);
      for (final city in state.cities) {
        suggestions.add('${state.name}, ${city.name}');
      }
    }
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
                : (themeMode.isDark ? MainColors.grey500 : MainColors.grey900)))
        : MainColors.grey500;
    final l10n = useL10n();

    return SearchField(
      onTap: widget.onTap,
      suggestions: suggestions
          .map((e) => SearchFieldListItem<String>(e, child: Text(e)))
          .toList(),
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
      itemHeight: 50,
      offset: const Offset(0, 70),
      suggestionsDecoration: SuggestionDecoration(
        padding: const EdgeInsets.only(right: 20, left: 20),
        color: themeMode.isDark ? MainColors.dark2 : MainColors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      onSuggestionTap: (suggestion) {
        FocusScope.of(context).unfocus();
        return null;
      },
      searchInputDecoration: SearchInputDecoration(
        searchStyle: theme.textTheme.bodyMedium.copyWith(
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
        hintStyle: theme.textTheme.bodyMedium.copyWith(
          color: inputColor,
          fontWeight: FontWeight.w500,
        ),
        helperText: widget.label,
      )

      /*FormStyle.decoration(
        widget.isFillColor
            ? (_hasInput || _focusNode.hasFocus
                ? MainColors.transparentBlue
                : (themeMode.isDark ? MainColors.dark2 : MainColors.grey50))
            : (themeMode.isDark ? MainColors.dark2 : MainColors.grey50),


      )*/
      ,
      controller: widget.controller,
    );
  }
}

class StateModel {
  StateModel({
    required this.id,
    required this.name,
    required this.countryId,
    required this.cities,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    final cityList = json['city'] as List;
    final cities = cityList
        .map((i) => CityModel.fromJson(i as Map<String, dynamic>))
        .toList();
    return StateModel(
      id: json['id'] as int,
      name: json['name'] as String,
      countryId: json['country_id'] as int,
      cities: cities,
    );
  }
  final int id;
  final String name;
  final int countryId;
  final List<CityModel> cities;
}

class CityModel {
  CityModel({required this.id, required this.name, required this.stateId});

  factory CityModel.fromJson(Map<String, dynamic> json) {
    return CityModel(
      id: json['id'] as int,
      name: json['name'] as String,
      stateId: json['state_id'] as int,
    );
  }
  final int id;
  final String name;
  final int stateId;
}

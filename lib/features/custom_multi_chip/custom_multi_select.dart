// ignore_for_file: cascade_invocations, prefer_initializing_formals, overridden_fields, strict_raw_type, avoid_print, prefer_null_aware_method_calls, depend_on_referenced_packages, deprecated_member_use_from_same_package

import 'package:collection/collection.dart' show IterableExtension;
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/features/custom_multi_chip/custom_bottom_sheet.dart';
import 'package:togodo/features/custom_multi_chip/custom_multi_chip.dart';
import 'package:togodo/gen/assets.gen.dart';

/// A customizable InkWell widget that opens the MultiSelectBottomSheet
// ignore: must_be_immutable
class CustomMultiSelectBottomSheetField<V> extends FormField<List<V>> {
  CustomMultiSelectBottomSheetField({
    required this.items,
    required this.onConfirm,
    required this.theme,
    this.title,
    this.buttonText,
    this.buttonIcon,
    this.listType,
    this.decoration,
    this.onSelectionChanged,
    this.chipDisplay,
    this.initialValue = const [],
    this.searchable = false,
    this.confirmText,
    this.cancelText,
    this.selectedColor,
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
    this.shape,
    this.barrierColor,
    this.searchHint,
    this.colorator,
    this.backgroundColor,
    this.unselectedColor,
    this.searchIcon,
    this.closeSearchIcon,
    this.itemsTextStyle,
    this.searchTextStyle,
    this.searchHintStyle,
    this.selectedItemsTextStyle,
    this.separateSelectedItems = false,
    this.checkColor,
    this.isDismissible = true,
    this.key,
    this.onSaved,
    this.validator,
    this.isOpen = false,
    this.autovalidateMode = AutovalidateMode.disabled,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidateMode,
          initialValue: initialValue,
          builder: (FormFieldState<List<V>> state) {
            final _CustomMultiSelectBottomSheetFieldView view =
                _CustomMultiSelectBottomSheetFieldView<V>(
              items: items,
              decoration: decoration,
              unselectedColor: unselectedColor,
              theme: theme,
              colorator: colorator,
              itemsTextStyle: itemsTextStyle,
              selectedItemsTextStyle: selectedItemsTextStyle,
              backgroundColor: backgroundColor,
              title: title,
              initialValue: initialValue,
              barrierColor: barrierColor,
              buttonIcon: buttonIcon,
              buttonText: buttonText,
              cancelText: cancelText,
              chipDisplay: chipDisplay,
              closeSearchIcon: closeSearchIcon,
              confirmText: confirmText,
              initialChildSize: initialChildSize,
              listType: listType,
              maxChildSize: maxChildSize,
              minChildSize: minChildSize,
              onConfirm: onConfirm,
              onSelectionChanged: onSelectionChanged,
              searchHintStyle: searchHintStyle,
              searchIcon: searchIcon,
              searchHint: searchHint,
              searchTextStyle: searchTextStyle,
              searchable: searchable,
              selectedColor: selectedColor,
              separateSelectedItems: separateSelectedItems,
              shape: shape,
              checkColor: checkColor,
              isDismissible: isDismissible,
              isOpen: isOpen,
            );
            return _CustomMultiSelectBottomSheetFieldView<V?>._withState(
              view as _CustomMultiSelectBottomSheetFieldView<V?>,
              state,
            );
          },
        );

  /// Style the Container that makes up the field.
  final BoxDecoration? decoration;

  /// Set text that is displayed on the button.
  final Text? buttonText;

  /// Specify the button icon.
  final Icon? buttonIcon;

  /// List of items to select from.
  final List<MultiSelectItem<V>> items;

  /// The list of selected values before interaction.
  @override
  final List<V> initialValue;

  /// The text at the top of the dialog.
  final Widget? title;

  /// Fires when the an item is selected / unselected.
  final void Function(List<V>)? onSelectionChanged;

  /// Fires when confirm is tapped.
  final void Function(List<V>) onConfirm;

  /// Toggles search functionality.
  final bool searchable;

  /// Text on the confirm button.
  final String? confirmText;

  /// Text on the cancel button.
  final String? cancelText;

  /// An enum that determines which type of list to render.
  final MultiSelectListType? listType;

  /// Sets the color of the checkbox or chip body when selected.
  final Color? selectedColor;

  /// Set the hint text of the search field.
  final String? searchHint;

  /// Set the initial height of the BottomSheet.
  final double? initialChildSize;

  /// Set the minimum height threshold of the BottomSheet before it closes.
  final double? minChildSize;

  /// Set the maximum height of the BottomSheet.
  final double? maxChildSize;

  /// Apply a ShapeBorder to alter the edges of the BottomSheet.
  final ShapeBorder? shape;

  /// Set the color of the space outside the BottomSheet.
  final Color? barrierColor;

  /// Overrides the default CustomMultiSelectChipDisplay attached to this field.
  /// If you want to remove it, use CustomMultiSelectChipDisplay.none().
  final CustomMultiSelectChipDisplay<V>? chipDisplay;

  /// A function that sets the color of selected items based on their value.
  /// It will either set the chip color, or the checkbox color depending on the list type.
  final Color Function(V)? colorator;

  /// Set the background color of the bottom sheet.
  final Color? backgroundColor;

  /// Color of the chip body or checkbox border while not selected.
  final Color? unselectedColor;

  /// Replaces the deafult search icon when searchable is true.
  final Icon? searchIcon;

  /// Replaces the default close search icon when searchable is true.
  final Icon? closeSearchIcon;

  /// The TextStyle of the items within the BottomSheet.
  final TextStyle? itemsTextStyle;

  /// Style the text on the selected chips or list tiles.
  final TextStyle? selectedItemsTextStyle;

  /// Moves the selected items to the top of the list.
  final bool separateSelectedItems;

  /// Style the text that is typed into the search field.
  final TextStyle? searchTextStyle;

  /// Style the search hint.
  final TextStyle? searchHintStyle;

  /// Set the color of the check in the checkbox
  final Color? checkColor;

  /// Whether the user can dismiss the widget by tapping outside
  final bool isDismissible;

  final AppTheme theme;

  @override
  final AutovalidateMode autovalidateMode;
  @override
  final FormFieldValidator<List<V>>? validator;
  @override
  final FormFieldSetter<List<V>>? onSaved;
  @override
  final GlobalKey<FormFieldState>? key;
  FormFieldState<List<V>>? state;
  final bool isOpen;
}

// ignore: must_be_immutable
class _CustomMultiSelectBottomSheetFieldView<V> extends StatefulWidget {
  _CustomMultiSelectBottomSheetFieldView({
    required this.items,
    required this.initialValue,
    required this.searchable,
    required this.separateSelectedItems,
    required this.isDismissible,
    required this.theme,
    this.title,
    this.buttonText,
    this.buttonIcon,
    this.listType,
    this.decoration,
    this.onSelectionChanged,
    this.onConfirm,
    this.chipDisplay,
    this.confirmText,
    this.cancelText,
    this.selectedColor,
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
    this.shape,
    this.barrierColor,
    this.searchHint,
    this.colorator,
    this.backgroundColor,
    this.unselectedColor,
    this.searchIcon,
    this.closeSearchIcon,
    this.itemsTextStyle,
    this.searchTextStyle,
    this.searchHintStyle,
    this.selectedItemsTextStyle,
    this.checkColor,
    this.isOpen = false,
  });

  /// This constructor allows a FormFieldState to be passed in. Called by CustomMultiSelectBottomSheetField.
  _CustomMultiSelectBottomSheetFieldView._withState(
    _CustomMultiSelectBottomSheetFieldView<V> field,
    FormFieldState<List<V>> state,
  )   : items = field.items,
        title = field.title,
        buttonText = field.buttonText,
        buttonIcon = field.buttonIcon,
        listType = field.listType,
        decoration = field.decoration,
        onSelectionChanged = field.onSelectionChanged,
        onConfirm = field.onConfirm,
        chipDisplay = field.chipDisplay,
        initialValue = field.initialValue,
        searchable = field.searchable,
        theme = field.theme,
        confirmText = field.confirmText,
        cancelText = field.cancelText,
        selectedColor = field.selectedColor,
        initialChildSize = field.initialChildSize,
        minChildSize = field.minChildSize,
        maxChildSize = field.maxChildSize,
        shape = field.shape,
        barrierColor = field.barrierColor,
        searchHint = field.searchHint,
        colorator = field.colorator,
        backgroundColor = field.backgroundColor,
        unselectedColor = field.unselectedColor,
        searchIcon = field.searchIcon,
        closeSearchIcon = field.closeSearchIcon,
        itemsTextStyle = field.itemsTextStyle,
        searchHintStyle = field.searchHintStyle,
        searchTextStyle = field.searchTextStyle,
        selectedItemsTextStyle = field.selectedItemsTextStyle,
        separateSelectedItems = field.separateSelectedItems,
        checkColor = field.checkColor,
        isDismissible = field.isDismissible,
        isOpen = field.isOpen,
        state = state;
  final BoxDecoration? decoration;
  final Text? buttonText;
  final Icon? buttonIcon;
  final List<MultiSelectItem<V>> items;
  final List<V> initialValue;
  final Widget? title;
  final void Function(List<V>)? onSelectionChanged;
  final void Function(List<V>)? onConfirm;
  final bool searchable;
  final String? confirmText;
  final String? cancelText;
  final MultiSelectListType? listType;
  final Color? selectedColor;
  final String? searchHint;
  final double? initialChildSize;
  final double? minChildSize;
  final double? maxChildSize;
  final ShapeBorder? shape;
  final Color? barrierColor;
  final CustomMultiSelectChipDisplay<V>? chipDisplay;
  final Color Function(V)? colorator;
  final Color? backgroundColor;
  final Color? unselectedColor;
  final Icon? searchIcon;
  final Icon? closeSearchIcon;
  final TextStyle? itemsTextStyle;
  final TextStyle? selectedItemsTextStyle;
  final TextStyle? searchTextStyle;
  final TextStyle? searchHintStyle;
  final bool separateSelectedItems;
  final Color? checkColor;
  final bool isDismissible;
  FormFieldState<List<V>>? state;
  final bool isOpen;
  final AppTheme theme;
  @override
  __CustomMultiSelectBottomSheetFieldViewState createState() =>
      __CustomMultiSelectBottomSheetFieldViewState<V>();
}

class __CustomMultiSelectBottomSheetFieldViewState<V>
    extends State<_CustomMultiSelectBottomSheetFieldView<V>> {
  List<V> _selectedItems = [];

  @override
  void initState() {
    super.initState();
    _selectedItems.addAll(widget.initialValue);
  }

  @override
  void didUpdateWidget(_CustomMultiSelectBottomSheetFieldView<V> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.initialValue != widget.initialValue) {
      _selectedItems = [];
      _selectedItems.addAll(widget.initialValue);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.state!.didChange(_selectedItems);
      });
    }
  }

  Widget _buildInheritedChipDisplay() {
// chipDisplayItems'ın tipini MultiSelectItem<TagsModel> olarak değiştirin
    var chipDisplayItems = <MultiSelectItem<TagsModel>?>[];
    chipDisplayItems = _selectedItems
        .map(
          (e) => widget.items.firstWhereOrNull(
            (element) {
              if (e is TagsModel && element.value is TagsModel) {
                final items = element.value as TagsModel;
                return e.id == items.id;
              }
              return false;
            },
          ),
        )
        .cast<MultiSelectItem<TagsModel>?>()
        .toList();

// null değerleri kaldırın
    chipDisplayItems.removeWhere((element) => element == null);
    if (widget.chipDisplay != null) {
      // if user has specified a chipDisplay, use its params
      if (widget.chipDisplay!.disabled!) {
        return Container();
      } else {
        return CustomMultiSelectChipDisplay<V>(
          items: chipDisplayItems as List<MultiSelectItem<V>?>?,
          colorator: widget.chipDisplay!.colorator ?? widget.colorator,
          onTap: (item) {
            List<V>? newValues;
            if (widget.chipDisplay!.onTap != null) {
              final dynamic result = widget.chipDisplay!.onTap!(item);
              if (result is List<V>) newValues = result;
            }
            if (newValues != null) {
              _selectedItems = newValues;
              if (widget.state != null) {
                widget.state!.didChange(_selectedItems);
              }
            }
          },
          decoration: widget.chipDisplay!.decoration,
          chipColor: widget.chipDisplay!.chipColor ??
              ((widget.selectedColor != null &&
                      widget.selectedColor != Colors.transparent)
                  ? widget.selectedColor!.withOpacity(0.35)
                  : null),
          alignment: widget.chipDisplay!.alignment,
          textStyle: widget.chipDisplay!.textStyle,
          icon: widget.chipDisplay!.icon,
          shape: widget.chipDisplay!.shape,
          scroll: widget.chipDisplay!.scroll,
          scrollBar: widget.chipDisplay!.scrollBar,
          height: widget.chipDisplay!.height,
          chipWidth: widget.chipDisplay!.chipWidth,
        );
      }
    } else {
      // user didn't specify a chipDisplay, build the default
      return CustomMultiSelectChipDisplay<V>(
        items: chipDisplayItems as List<MultiSelectItem<V>>?,
        colorator: widget.colorator,
        chipColor: (widget.selectedColor != null &&
                widget.selectedColor != Colors.transparent)
            ? widget.selectedColor!.withOpacity(0.35)
            : null,
      );
    }
  }

  Future<void> _showBottomSheet(BuildContext ctx) async {
    final myVar = await showModalBottomSheet<List<V>>(
      isDismissible: widget.isDismissible,
      backgroundColor: widget.backgroundColor,
      elevation: 0,
      shape: widget.shape ??
          const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
          ),
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return CustomMultiSelectBottomSheet<V>(
          checkColor: widget.checkColor,
          selectedItemsTextStyle: widget.selectedItemsTextStyle,
          searchTextStyle: widget.searchTextStyle,
          searchHintStyle: widget.searchHintStyle,
          itemsTextStyle: widget.itemsTextStyle,
          searchIcon: widget.searchIcon,
          closeSearchIcon: widget.closeSearchIcon,
          unselectedColor: widget.unselectedColor,
          colorator: widget.colorator,
          searchHint: widget.searchHint,
          selectedColor: widget.selectedColor,
          listType: widget.listType,
          items: widget.items,
          cancelText: widget.cancelText,
          confirmText: widget.confirmText,
          separateSelectedItems: widget.separateSelectedItems,
          initialValue: _selectedItems,
          onConfirm: (selected) {
            if (widget.state != null) {
              widget.state!.didChange(selected);
            }
            _selectedItems = selected;
            if (widget.onConfirm != null) widget.onConfirm!(selected);
          },
          onSelectionChanged: widget.onSelectionChanged,
          searchable: widget.searchable,
          title: widget.title,
          initialChildSize: widget.initialChildSize,
          minChildSize: widget.minChildSize,
          maxChildSize: widget.maxChildSize,
        );
      },
    );
    if (myVar != null) {
      _selectedItems = myVar;
      print(myVar);
    }
  }

  @override
  Widget build(BuildContext context) {
    /*  if (widget.isOpen) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showBottomSheet(context);
      });
    } */
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              InkWell(
                borderRadius: BorderRadius.circular(50),
                onTap: () {
                  _showBottomSheet(context);
                },
                child: Container(
                  width: 140,
                  height: 48,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                  decoration: widget.state != null
                      ? widget.decoration ??
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(
                              color:
                                  widget.state != null && widget.state!.hasError
                                      ? Colors.red.shade800.withOpacity(0.6)
                                      : _selectedItems.isNotEmpty
                                          ? (widget.selectedColor != null &&
                                                  widget.selectedColor !=
                                                      Colors.transparent)
                                              ? widget.selectedColor!
                                              : Theme.of(context).primaryColor
                                          : MainColors.primary,
                              width: _selectedItems.isNotEmpty
                                  ? (widget.state != null &&
                                          widget.state!.hasError)
                                      ? 1.4
                                      : 1.8
                                  : 2,
                            ),
                          )
                      : widget.decoration,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Assets.icons.bold.plusJust.svg(color: MainColors.primary),
                      widget.buttonText ?? const Text('Select'),
                    ],
                  ),
                ),
              ),
              _buildInheritedChipDisplay(),
            ],
          ),
        ),
        if (widget.state != null && widget.state!.hasError)
          const SizedBox(height: 5)
        else
          Container(),
        if (widget.state != null && widget.state!.hasError)
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 4),
                child: Text(
                  widget.state!.errorText!,
                  style: TextStyle(
                    color: Colors.red[800],
                    fontSize: 12.5,
                  ),
                ),
              ),
            ],
          )
        else
          Container(),
      ],
    );
  }
}

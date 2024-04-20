// ignore_for_file: library_private_types_in_public_api, no_logic_in_create_state, prefer_null_aware_method_calls, prefer_null_aware_operators

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:multi_select_flutter/util/multi_select_actions.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/data/model/profil/profil_model.dart';

/// A bottom sheet widget containing either a classic checkbox style list, or a chip style list.
class CustomMultiSelectBottomSheet<T> extends StatefulWidget
    with MultiSelectActions<T> {
  CustomMultiSelectBottomSheet({
    required this.items,
    required this.initialValue,
    super.key,
    this.title,
    this.onSelectionChanged,
    this.onConfirm,
    this.listType,
    this.cancelText,
    this.confirmText,
    this.searchable = false,
    this.selectedColor,
    this.initialChildSize,
    this.minChildSize,
    this.maxChildSize,
    this.colorator,
    this.unselectedColor,
    this.searchIcon,
    this.closeSearchIcon,
    this.itemsTextStyle,
    this.searchTextStyle,
    this.searchHint,
    this.searchHintStyle,
    this.selectedItemsTextStyle,
    this.separateSelectedItems = false,
    this.checkColor,
  });

  /// List of items to select from.
  final List<MultiSelectItem<T>> items;

  /// The list of selected values before interaction.
  final List<T> initialValue;

  /// The text at the top of the BottomSheet.
  final Widget? title;

  /// Fires when the an item is selected / unselected.
  final void Function(List<T>)? onSelectionChanged;

  /// Fires when confirm is tapped.
  final void Function(List<T>)? onConfirm;

  /// Toggles search functionality.
  final bool searchable;

  /// Text on the confirm button.
  final String? confirmText;

  /// Text on the cancel button.
  final String? cancelText;

  /// An enum that determines which type of list to render.
  final MultiSelectListType? listType;

  /// Sets the color of the checkbox or chip when it's selected.
  final Color? selectedColor;

  /// Set the initial height of the BottomSheet.
  final double? initialChildSize;

  /// Set the minimum height threshold of the BottomSheet before it closes.
  final double? minChildSize;

  /// Set the maximum height of the BottomSheet.
  final double? maxChildSize;

  /// Set the placeholder text of the search field.
  final String? searchHint;

  /// A function that sets the color of selected items based on their value.
  /// It will either set the chip color, or the checkbox color depending on the list type.
  final Color? Function(T)? colorator;

  /// Color of the chip body or checkbox border while not selected.
  final Color? unselectedColor;

  /// Icon button that shows the search field.
  final Icon? searchIcon;

  /// Icon button that hides the search field
  final Icon? closeSearchIcon;

  /// Style the text on the chips or list tiles.
  final TextStyle? itemsTextStyle;

  /// Style the text on the selected chips or list tiles.
  final TextStyle? selectedItemsTextStyle;

  /// Style the search text.
  final TextStyle? searchTextStyle;

  /// Style the search hint.
  final TextStyle? searchHintStyle;

  /// Moves the selected items to the top of the list.
  final bool separateSelectedItems;

  /// Set the color of the check in the checkbox
  final Color? checkColor;

  @override
  _CustomMultiSelectBottomSheetState<T> createState() =>
      _CustomMultiSelectBottomSheetState<T>(
        items,
      );
}

class _CustomMultiSelectBottomSheetState<T>
    extends State<CustomMultiSelectBottomSheet<T>> {
  _CustomMultiSelectBottomSheetState(
    this._items,
  );
  List<T> _selectedValues = [];
  final List<T> _selectedValuesSub = [];
  bool _showSearch = false;
  List<MultiSelectItem<T>> _items;

  @override
  void initState() {
    super.initState();
    _selectedValues.addAll(widget.initialValue);

    _selectedValuesSub.addAll(widget.initialValue);
    for (var i = 0; i < _items.length; i++) {
      _items[i].selected = false;
      final selected = _selectedValues as List<TagsModel?>;
      final item = _items[i].value as TagsModel;
      if (selected.firstWhere(
            (element) => element!.id == item.id,
            orElse: () => null,
          ) !=
          null) {
        _items[i].selected = true;

        final initVal = widget.initialValue.cast<TagsModel?>();
        for (final element in initVal) {
          final itemsCast = _items[i].value as TagsModel;
          if (element!.id == itemsCast.id) {
            for (var i = 0; i < element.subTags!.length; i++) {
              _selectedValuesSub.add(element.subTags![i] as T);
              _selectedValues.add(element.subTags![i] as T);
            }
          }
        }
      }
    }
    if (widget.separateSelectedItems) {
      _items = widget.separateSelected(_items);
    }
  }

  bool isSub(T value) {
    final item = value as TagsModel;
    for (final element in _selectedValuesSub.cast<TagsModel?>()) {
      if (element!.id == item.id) {
        return true;
      }
    }
    return false;
  }

  void removeUnselectedSubTags(TagsModel unselectedTag) {
    if (unselectedTag.subTags != null) {
      for (final subTag in unselectedTag.subTags!) {
        final model = _selectedValues as List<TagsModel?>;
        final modelSub = _selectedValuesSub as List<TagsModel?>;
        model.removeWhere((model) => model!.id == unselectedTag.id);
        modelSub.removeWhere((modelSub) => modelSub!.id == subTag.id);
        model.removeWhere((model) => model!.id == subTag.id);
        if (widget.onSelectionChanged != null) {
          widget.onSelectionChanged!(model as List<T>);
        }
      }
    }
  }

  /// Returns a CheckboxListTile
  Widget buildListItem(MultiSelectItem<T> item) {
    return Theme(
      data: ThemeData(
        unselectedWidgetColor: widget.unselectedColor ?? Colors.black54,
      ),
      child: CheckboxListTile(
        checkColor: widget.checkColor,
        value: item.selected,
        activeColor: widget.colorator != null
            ? widget.colorator!(item.value) ?? widget.selectedColor
            : widget.selectedColor,
        title: Text(
          item.label,
          style: item.selected
              ? widget.selectedItemsTextStyle
              : widget.itemsTextStyle,
        ),
        controlAffinity: ListTileControlAffinity.leading,
        onChanged: (checked) {
          setState(() {
            _selectedValues = widget.onItemCheckedChange(
              _selectedValues,
              item.value,
              checked!,
            );

            if (checked) {
              item.selected = true;
            } else {
              item.selected = false;
            }
            if (widget.separateSelectedItems) {
              _items = widget.separateSelected(_items);
            }
          });
          if (widget.onSelectionChanged != null) {
            widget.onSelectionChanged!(_selectedValues);
          }
        },
      ),
    );
  }

  /// Returns a ChoiceChip
  Widget buildChipItem(MultiSelectItem<T> item, {bool isChild = false}) {
    return Container(
      alignment: isChild ? null : (item.selected ? Alignment.topLeft : null),
      padding: const EdgeInsets.all(2),
      child: ChoiceChip(
        backgroundColor: widget.unselectedColor,
        showCheckmark: false,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
          side: const BorderSide(
            color: MainColors.primary,
            width: 2,
          ),
        ),
        selectedColor:
            widget.colorator != null && widget.colorator!(item.value) != null
                ? widget.colorator!(item.value)
                : widget.selectedColor ??
                    Theme.of(context).primaryColor.withOpacity(0.35),
        label: Text(
          item.label,
          style: item.selected
              ? TextStyle(
                  color: widget.selectedItemsTextStyle?.color ??
                      widget.colorator?.call(item.value) ??
                      widget.selectedColor?.withOpacity(1) ??
                      Theme.of(context).primaryColor,
                  fontSize: widget.selectedItemsTextStyle != null
                      ? widget.selectedItemsTextStyle!.fontSize
                      : null,
                )
              : widget.itemsTextStyle,
        ),
        selected: item.selected,
        onSelected: (checked) {
          if (checked) {
            item.selected = true;
          } else {
            item.selected = false;
            removeUnselectedSubTags(item.value as TagsModel);
          }
          setState(() {
            _selectedValues = widget.onItemCheckedChange(
              _selectedValues,
              item.value,
              checked,
            );
          });
          if (widget.onSelectionChanged != null) {
            widget.onSelectionChanged!(_selectedValues);
          }
        },
      ),
    );
  }

  /// Returns a ChoiceChip
  Widget buildChipItemSub(
    MultiSelectItem<T> item, {
    bool isChild = false,
  }) {
    return ChoiceChip(
      backgroundColor:
          isSub(item.value) ? MainColors.primary : widget.unselectedColor,
      showCheckmark: false,
      selectedColor: MainColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(100),
        side: const BorderSide(
          color: MainColors.transparentGreen,
        ),
      ),
      label: Text(
        item.label,
        style: isSub(item.value)
            ? TextStyle(
                color: widget.selectedItemsTextStyle?.color ??
                    widget.colorator?.call(item.value) ??
                    widget.selectedColor?.withOpacity(1) ??
                    Theme.of(context).primaryColor,
                fontSize: widget.selectedItemsTextStyle != null
                    ? widget.selectedItemsTextStyle!.fontSize
                    : null,
              )
            : widget.itemsTextStyle,
      ),
      selected: isSub(item.value),
      onSelected: (checked) {
        log(checked.toString());
        if (checked) {
          item.selected = true;
          _selectedValuesSub.add(item.value);
          _selectedValues.add(item.value);
        } else {
          item.selected = false;
          _selectedValuesSub.remove(item.value as TagsModel);
          _selectedValues.remove(item.value);
        }
        setState(() {});
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: DraggableScrollableSheet(
        initialChildSize: widget.initialChildSize ?? 0.3,
        minChildSize: widget.minChildSize ?? 0.3,
        maxChildSize: widget.maxChildSize ?? 0.6,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (_showSearch)
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: 10),
                          child: TextField(
                            autofocus: true,
                            style: widget.searchTextStyle,
                            decoration: InputDecoration(
                              hintStyle: widget.searchHintStyle,
                              hintText: widget.searchHint ?? 'Search',
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: widget.selectedColor ??
                                      Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                            onChanged: (val) {
                              var filteredList = <MultiSelectItem<T>>[];
                              filteredList = widget.updateSearchQuery(
                                val,
                                widget.items,
                              );
                              setState(() {
                                if (widget.separateSelectedItems) {
                                  _items =
                                      widget.separateSelected(filteredList);
                                } else {
                                  _items = filteredList;
                                }
                              });
                            },
                          ),
                        ),
                      )
                    else
                      widget.title!,
                    if (widget.searchable)
                      IconButton(
                        icon: _showSearch
                            ? widget.closeSearchIcon ?? const Icon(Icons.close)
                            : widget.searchIcon ?? const Icon(Icons.search),
                        onPressed: () {
                          setState(() {
                            _showSearch = !_showSearch;
                            if (!_showSearch) {
                              if (widget.separateSelectedItems) {
                                _items = widget.separateSelected(widget.items);
                              } else {
                                _items = widget.items;
                              }
                            }
                          });
                        },
                      )
                    else
                      const Padding(
                        padding: EdgeInsets.all(15),
                      ),
                  ],
                ),
              ),
              Expanded(
                child: widget.listType == null ||
                        widget.listType == MultiSelectListType.LIST
                    ? ListView.builder(
                        controller: scrollController,
                        itemCount: _items.length,
                        itemBuilder: (context, index) {
                          return buildListItem(_items[index]);
                        },
                      )
                    : SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          padding: const EdgeInsets.all(24),
                          child: Wrap(
                            runSpacing: 10,
                            spacing: 10,
                            children: _items.mapIndexed(
                              (index, element) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    buildChipItem(element),
                                    if (element.selected)
                                      subList(
                                        scrollController,
                                        element,
                                      ),
                                  ],
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 36),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 184,
                        child: CustomButton(
                          mode: ButtonMode.dark,
                          radius: 100,
                          onPressed: () {
                            widget.onCancelTap(context, widget.initialValue);
                          },
                          text: widget.cancelText ?? '',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: CustomButton(
                        radius: 100,
                        onPressed: () {
                          widget.onConfirmTap(
                            context,
                            _selectedValues,
                            widget.onConfirm,
                          );
                        },
                        text: widget.confirmText ?? '',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  SingleChildScrollView subList(
    ScrollController scrollController,
    MultiSelectItem<T> element,
  ) {
    final elementSub = element.value as TagsModel;
    final subTags = elementSub.subTags ?? [];
    final items = subTags
        .map((item) => MultiSelectItem<TagsModel>(item, item.name!))
        .toList();
    return SingleChildScrollView(
      controller: scrollController,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: Wrap(
        runSpacing: 10,
        spacing: 10,
        children: items.mapIndexed(
          (index, tag) {
            return Column(
              children: [
                buildChipItemSub(
                  tag as MultiSelectItem<T>,
                  isChild: true,
                ),
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}

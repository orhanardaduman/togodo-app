// ignore_for_file: strict_raw_type, overridden_fields, inference_failure_on_function_return_type, always_declare_return_types, prefer_null_aware_operators, use_colored_box, no_logic_in_create_state, prefer_initializing_formals, prefer_null_aware_method_calls

import 'package:flutter/material.dart';
import 'package:multi_select_flutter/util/horizontal_scrollbar.dart';
import 'package:multi_select_flutter/util/multi_select_actions.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class CustomMultiSelectChipField<V> extends FormField<List<V>> {
  CustomMultiSelectChipField({
    required this.items,
    this.decoration,
    this.chipColor,
    this.selectedChipColor,
    this.colorator,
    this.textStyle,
    this.selectedTextStyle,
    this.icon,
    this.searchIcon,
    this.closeSearchIcon,
    this.chipShape,
    this.onTap,
    this.title,
    this.scroll = true,
    this.isSingleSelect = false,
    this.searchable,
    this.searchHint,
    this.searchHintStyle,
    this.searchTextStyle,
    this.headerColor,
    this.key,
    this.onSaved,
    this.validator,
    this.autovalidateMode = AutovalidateMode.disabled,
    this.initialValue = const [],
    this.itemBuilder,
    this.height,
    this.scrollControl,
    this.scrollBar,
    this.showHeader = true,
    this.chipWidth,
  }) : super(
          key: key,
          onSaved: onSaved,
          validator: validator,
          autovalidateMode: autovalidateMode,
          initialValue: initialValue,
          builder: (FormFieldState<List<V>> state) {
            final _CustomMultiSelectChipFieldView view =
                _CustomMultiSelectChipFieldView<V>(
              items: items,
              decoration: decoration,
              chipColor: chipColor,
              selectedChipColor: selectedChipColor,
              colorator: colorator,
              textStyle: textStyle,
              selectedTextStyle: selectedTextStyle,
              icon: icon,
              isSingleSelect: isSingleSelect,
              searchIcon: searchIcon,
              closeSearchIcon: closeSearchIcon,
              chipShape: chipShape,
              onTap: onTap,
              title: title,
              scroll: scroll,
              initialValue: initialValue,
              searchable: searchable,
              searchHint: searchHint,
              searchHintStyle: searchHintStyle,
              searchTextStyle: searchTextStyle,
              headerColor: headerColor,
              itemBuilder: itemBuilder,
              height: height,
              scrollControl: scrollControl,
              scrollBar: scrollBar,
              showHeader: showHeader,
              chipWidth: chipWidth,
            );
            return _CustomMultiSelectChipFieldView<V?>.withState(
              view as _CustomMultiSelectChipFieldView<V?>,
              state,
            );
          },
        );

  /// Style the Container that makes up the field.
  final BoxDecoration? decoration;

  /// List of items to select from.
  final List<MultiSelectItem<V>> items;

  /// Color of the chip while not selected.
  final Color? chipColor;

  /// Sets the color of the chip while selected.
  final Color? selectedChipColor;

  /// Style the text of the chips.
  final TextStyle? textStyle;

  /// Style the text of the selected chips.
  final TextStyle? selectedTextStyle;

  /// The icon displayed in front of text on selected chips.
  final Icon? icon;

  /// Replaces the deafult search icon when searchable is true.
  final Icon? searchIcon;

  /// Replaces the default close search icon when searchable is true.
  final Icon? closeSearchIcon;

  /// Set a ShapeBorder. Typically a RoundedRectangularBorder.
  final ShapeBorder? chipShape;

  /// Defines the header text.
  final Text? title;

  /// Enables horizontal scrolling. Default is true.
  final bool scroll;

  /// A function that sets the color of selected items based on their value.
  final Color Function(V)? colorator;

  /// Fires when a chip is tapped. A good time to store the selected values.
  final Function(List<V>)? onTap;

  /// Enables search functionality.
  final bool? searchable;

  /// Set the search hint.
  final String? searchHint;

  /// Set the TextStyle of the search hint.
  final TextStyle? searchHintStyle;

  /// Set the TextStyle of the text that gets typed into the search bar.
  final TextStyle? searchTextStyle;

  /// Set the header color.
  final Color? headerColor;

  /// Build a custom widget that gets created dynamically for each item.
  final Widget Function(MultiSelectItem<V>, FormFieldState<List<V>>)?
      itemBuilder;

  /// Set the height of the selectable area.
  final double? height;

  /// Make use of the ScrollController to automatically scroll through the list.
  final Function(ScrollController)? scrollControl;

  /// Define a HorizontalScrollBar.
  final HorizontalScrollBar? scrollBar;

  /// Determines whether to show the header.
  final bool showHeader;

  /// Set the width of the chip.
  final double? chipWidth;

  final bool isSingleSelect;

  @override
  final List<V>? initialValue;
  @override
  final AutovalidateMode autovalidateMode;
  @override
  final FormFieldValidator<List<V>>? validator;
  @override
  final FormFieldSetter<List<V>>? onSaved;
  @override
  final GlobalKey<FormFieldState>? key;
}

// ignore: must_be_immutable
class _CustomMultiSelectChipFieldView<V> extends StatefulWidget
    with MultiSelectActions {
  _CustomMultiSelectChipFieldView({
    required this.items,
    this.selectedItems,
    this.decoration,
    this.chipColor,
    this.selectedChipColor,
    this.colorator,
    this.textStyle,
    this.selectedTextStyle,
    this.icon,
    this.chipShape,
    this.onTap,
    this.title,
    this.scroll = true,
    this.initialValue = const [],
    this.searchable,
    this.searchHint,
    this.searchIcon,
    this.closeSearchIcon,
    this.searchHintStyle,
    this.searchTextStyle,
    this.headerColor,
    this.itemBuilder,
    this.height,
    this.scrollControl,
    this.scrollBar,
    this.showHeader = true,
    this.isSingleSelect = false,
    this.chipWidth,
  });

  /// This constructor allows a FormFieldState to be passed in. Called by CustomMultiSelectChipField.
  _CustomMultiSelectChipFieldView.withState(
    _CustomMultiSelectChipFieldView<V> field,
    FormFieldState<List<V>> state,
  )   : items = field.items,
        title = field.title,
        decoration = field.decoration,
        initialValue = field.initialValue,
        selectedChipColor = field.selectedChipColor,
        chipShape = field.chipShape,
        colorator = field.colorator,
        chipColor = field.chipColor,
        isSingleSelect = field.isSingleSelect,
        icon = field.icon,
        closeSearchIcon = field.closeSearchIcon,
        selectedItems = field.selectedItems,
        textStyle = field.textStyle,
        scroll = field.scroll,
        selectedTextStyle = field.selectedTextStyle,
        onTap = field.onTap,
        searchable = field.searchable,
        searchHint = field.searchHint,
        searchIcon = field.searchIcon,
        searchTextStyle = field.searchTextStyle,
        searchHintStyle = field.searchHintStyle,
        headerColor = field.headerColor,
        itemBuilder = field.itemBuilder,
        height = field.height,
        scrollControl = field.scrollControl,
        scrollBar = field.scrollBar,
        showHeader = field.showHeader,
        chipWidth = field.chipWidth,
        state = state;
  final BoxDecoration? decoration;
  final List<MultiSelectItem<V>> items;
  final List<MultiSelectItem<V>>? selectedItems;
  final Color? chipColor;
  final Color? selectedChipColor;
  final TextStyle? textStyle;
  final TextStyle? selectedTextStyle;
  final Icon? icon;
  final Icon? searchIcon;
  final Icon? closeSearchIcon;
  final ShapeBorder? chipShape;
  final Text? title;
  final bool scroll;
  final bool? searchable;
  final String? searchHint;
  final TextStyle? searchHintStyle;
  final TextStyle? searchTextStyle;
  final List<V>? initialValue;
  final Color? Function(V)? colorator;
  final Function(List<V>)? onTap;
  final Color? headerColor;
  final Widget Function(MultiSelectItem<V>, FormFieldState<List<V>>)?
      itemBuilder;
  final double? height;
  FormFieldState<List<V>>? state;
  final Function(ScrollController)? scrollControl;
  final HorizontalScrollBar? scrollBar;
  final bool showHeader;
  final double? chipWidth;
  final bool isSingleSelect;

  @override
  __CustomMultiSelectChipFieldViewState createState() =>
      __CustomMultiSelectChipFieldViewState<V>(items);
}

class __CustomMultiSelectChipFieldViewState<V>
    extends State<_CustomMultiSelectChipFieldView<V?>> {
  __CustomMultiSelectChipFieldViewState(this._items);
  List<V?> _selectedValues = [];
  bool _showSearch = false;
  List<MultiSelectItem> _items;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      _selectedValues.addAll(widget.initialValue!);
    }

    if (widget.scrollControl != null && widget.scroll) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToPosition());
    }
  }

  @override
  void didUpdateWidget(_CustomMultiSelectChipFieldView<V> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialValue != null &&
        oldWidget.initialValue != widget.initialValue) {
      _selectedValues = [];
      _selectedValues.addAll(widget.initialValue!);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.state!.didChange(_selectedValues);
      });
    }
    if (oldWidget.items != widget.items) {
      _items = [...widget.items];
    }
  }

  _scrollToPosition() {
    widget.scrollControl!(_scrollController);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: widget.decoration ??
              BoxDecoration(
                border: Border.all(color: Theme.of(context).primaryColor),
              ),
          child: Column(
            children: [
              if (widget.showHeader)
                Container(
                  color: widget.headerColor ?? Theme.of(context).primaryColor,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (_showSearch)
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.only(left: 10),
                            child: TextField(
                              style: widget.searchTextStyle,
                              decoration: InputDecoration(
                                hintStyle: widget.searchHintStyle,
                                hintText: widget.searchHint ?? 'Search',
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: widget.selectedChipColor ??
                                        Theme.of(context).primaryColor,
                                  ),
                                ),
                              ),
                              onChanged: (val) {
                                setState(() {
                                  _items = widget.updateSearchQuery(
                                    val,
                                    widget.items,
                                  );
                                });
                              },
                            ),
                          ),
                        )
                      else
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: widget.title != null
                              ? Text(
                                  widget.title!.data!,
                                  style: TextStyle(
                                    color: widget.title!.style != null
                                        ? widget.title!.style!.color
                                        : null,
                                    fontSize: widget.title!.style != null
                                        ? widget.title!.style!.fontSize ?? 18
                                        : 18,
                                  ),
                                )
                              : const Text(
                                  'Select',
                                  style: TextStyle(fontSize: 18),
                                ),
                        ),
                      if (widget.searchable != null && widget.searchable!)
                        IconButton(
                          icon: _showSearch
                              ? widget.closeSearchIcon ??
                                  const Icon(
                                    Icons.close,
                                    size: 22,
                                  )
                              : widget.searchIcon ??
                                  const Icon(
                                    Icons.search,
                                    size: 22,
                                  ),
                          onPressed: () {
                            setState(() {
                              _showSearch = !_showSearch;
                              if (!_showSearch) _items = widget.items;
                            });
                          },
                        )
                      else
                        const Padding(
                          padding: EdgeInsets.all(18),
                        ),
                    ],
                  ),
                )
              else
                Container(),
              if (widget.scroll)
                Container(
                  padding: widget.itemBuilder == null
                      ? const EdgeInsets.symmetric(horizontal: 1)
                      : null,
                  width: MediaQuery.of(context).size.width,
                  height: widget.height ??
                      MediaQuery.of(context).size.height * 0.08,
                  child: widget.scrollBar != null
                      ? Scrollbar(
                          thumbVisibility: widget.scrollBar!.isAlwaysShown,
                          controller: _scrollController,
                          child: ListView.builder(
                            controller: _scrollController,
                            scrollDirection: Axis.horizontal,
                            itemCount: _items.length,
                            itemBuilder: (ctx, index) {
                              return widget.itemBuilder != null
                                  ? widget.itemBuilder!(
                                      _items[index] as MultiSelectItem<V>,
                                      widget.state!,
                                    )
                                  : _buildItem(
                                      _items[index] as MultiSelectItem<V?>,
                                    );
                            },
                          ),
                        )
                      : ListView.separated(
                          controller: _scrollController,
                          scrollDirection: Axis.horizontal,
                          itemCount: _items.length,
                          itemBuilder: (ctx, index) {
                            return widget.itemBuilder != null
                                ? widget.itemBuilder!(
                                    _items[index] as MultiSelectItem<V>,
                                    widget.state!,
                                  )
                                : _buildItem(
                                    _items[index] as MultiSelectItem<V?>,
                                  );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return const SizedBox(width: 10);
                          },
                        ),
                )
              else
                Container(
                  height: widget.height,
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Wrap(
                    children: widget.itemBuilder != null
                        ? _items
                            .map(
                              (item) => widget.itemBuilder!(
                                item as MultiSelectItem<V>,
                                widget.state!,
                              ),
                            )
                            .toList()
                        : _items
                            .map(
                              (item) => _buildItem(item as MultiSelectItem<V?>),
                            )
                            .toList(),
                  ),
                ),
            ],
          ),
        ),
        if (widget.state != null && widget.state!.hasError)
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 4, 0, 0),
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

  Widget _buildItem(MultiSelectItem<V?> item) {
    return Container(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.all(2),
      child: ChoiceChip(
        showCheckmark: false,
        shape: widget.chipShape as OutlinedBorder? ??
            RoundedRectangleBorder(
              side: BorderSide(
                color: widget.colorator != null &&
                        widget.colorator!(item.value) != null &&
                        _selectedValues.contains(item.value)
                    ? widget.colorator!(item.value)!
                    : widget.selectedChipColor ??
                        Theme.of(context).primaryColor,
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(15),
                bottom: Radius.circular(15),
              ),
            ),
        label: SizedBox(
          width: widget.chipWidth,
          child: Text(
            item.label,
            overflow: TextOverflow.ellipsis,
            style: _selectedValues.contains(item.value)
                ? TextStyle(
                    color: widget.colorator != null &&
                            widget.colorator!(item.value) != null
                        ? widget.colorator!(item.value)!.withOpacity(1)
                        : widget.selectedTextStyle != null
                            ? widget.selectedTextStyle!.color
                            : null,
                  )
                : TextStyle(
                    color: widget.textStyle != null
                        ? widget.textStyle!.color ?? widget.chipColor
                        : widget.chipColor,
                    fontSize: widget.textStyle != null
                        ? widget.textStyle!.fontSize
                        : null,
                  ),
          ),
        ),
        selected: _selectedValues.contains(item.value),
        backgroundColor: widget.chipColor ?? Colors.white70,
        selectedColor:
            widget.colorator != null && widget.colorator!(item.value) != null
                ? widget.colorator!(item.value)
                : widget.selectedChipColor ??
                    Theme.of(context).primaryColor.withOpacity(0.33),
        onSelected: (_) {
          if (widget.isSingleSelect) {
            if (_) {
              _selectedValues
                ..clear()
                ..add(item.value);
              if (widget.state != null) {
                widget.state!.didChange(_selectedValues);
              }
            } else {
              _selectedValues.remove(item.value);
              if (widget.state != null) {
                widget.state!.didChange(_selectedValues);
              }
            }
          } else {
            if (_) {
              _selectedValues.add(item.value);
              if (widget.state != null) {
                widget.state!.didChange(_selectedValues);
              }
            } else {
              _selectedValues.remove(item.value);
              if (widget.state != null) {
                widget.state!.didChange(_selectedValues);
              }
            }
          }
          if (widget.onTap != null) widget.onTap!(_selectedValues);
        },
      ),
    );
  }
}

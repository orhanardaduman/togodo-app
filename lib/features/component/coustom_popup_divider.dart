import 'package:flutter/material.dart';

class CustomPopupMenuDivider extends PopupMenuEntry<Never> {
  /// Creates a horizontal divider for a popup menu.
  ///
  /// By default, the divider has a height of 16 logical pixels.
  const CustomPopupMenuDivider({
    required this.color,
    super.key,
    this.height = 1,
  });

  /// The height of the divider entry.
  ///
  /// Defaults to 16 pixels.
  @override
  final double height;
  final Color color;
  @override
  bool represents(void value) => false;

  @override
  State<CustomPopupMenuDivider> createState() => _CustomPopupMenuDividerState();
}

class _CustomPopupMenuDividerState extends State<CustomPopupMenuDivider> {
  @override
  Widget build(BuildContext context) => Padding(
        padding:
            const EdgeInsets.only(left: 20, right: 35), // Sağ ve sol padding
        child: Divider(
          height: widget.height,
          color: widget.color,
        ),
      );
}

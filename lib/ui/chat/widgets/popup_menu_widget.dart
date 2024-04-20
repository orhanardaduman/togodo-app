import 'package:flutter/material.dart';

class PopupMenuWidget<T> extends PopupMenuEntry<T> {
  const PopupMenuWidget({
    required this.height,
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  final double height;

  @override
  PopupMenuWidgetState createState() => PopupMenuWidgetState();

  @override
  bool represents(T? value) => true;
}

class PopupMenuWidgetState extends State<PopupMenuWidget<dynamic>> {
  @override
  Widget build(BuildContext context) => widget.child;
}

// message type
enum MessageType {
  text,
  audio,
  video,
  gif,
  image,
}

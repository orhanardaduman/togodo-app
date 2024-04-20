import 'package:flutter/material.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';

class CheckmarkWidget extends StatefulWidget {
  const CheckmarkWidget({
    super.key,
    this.size = 50.0,
    this.backgroundColor = MainColors.primary,
    this.iconColor = Colors.white,
    this.initVal = false,
    this.onChanged,
    this.label,
    this.width,
    this.readOnly = false,
    this.checkColor,
    this.textEmpty = 10.0,
  });
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final bool initVal;
  final String? label;
  final double? width;
  final bool readOnly;
  final Color? checkColor;
  final double textEmpty;
  final void Function()? onChanged;

  @override
  State<CheckmarkWidget> createState() => _CheckmarkWidgetState();
}

class _CheckmarkWidgetState extends State<CheckmarkWidget> {
  bool isChecked = false;
  @override
  void initState() {
    isChecked = widget.initVal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.label != null
        ? SizedBox(
            // width: widget.width,
            child: Row(
              children: [
                checkBox(),
                SizedBox(width: widget.textEmpty),
                PrimaryText(
                  widget.label!,
                  // ignore: deprecated_member_use
                ),
              ],
            ),
          )
        : checkBox();
  }

  Transform checkBox() {
    return Transform.scale(
      scale: 1.2,
      child: Checkbox(
        value: isChecked,
        checkColor: widget.checkColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        activeColor: widget.backgroundColor,
        side: const BorderSide(
          color: MainColors.primary,
        ),
        onChanged: widget.readOnly
            ? (val) {}
            : (val) {
                isChecked = val!;
                // ignore: prefer_null_aware_method_calls
                if (widget.onChanged != null) widget.onChanged!();
                setState(() {});
              },
      ),
    );
  }
}

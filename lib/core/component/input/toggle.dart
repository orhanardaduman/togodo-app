import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:togodo/core/helpers/colors/colors.dart';

class CustomSwitchButton extends StatefulWidget {
  const CustomSwitchButton({
    this.onChanged,
    super.key,
    this.enabled = true,
    this.initVal = false,
  });
  final bool initVal;
  final bool enabled;
  final ValueChanged<bool>? onChanged;
  @override
  State<CustomSwitchButton> createState() => _CustomSwitchButtonState();
}

class _CustomSwitchButtonState extends State<CustomSwitchButton> {
  bool isSwitched = false;
  final _controller = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    isSwitched = widget.initVal;
    _controller
      ..value = widget.initVal
      ..addListener(() {
        if (_controller.value != isSwitched) {
          setState(() {
            isSwitched = _controller.value;
          });
          if (widget.onChanged != null) {
            widget.onChanged?.call(isSwitched);
          }
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedSwitch(
      width: 44, controller: _controller,
      height: 24,

      activeColor: MainColors.primary, // Açık durum rengi
      inactiveColor: MainColors.dark3, // Kapalı durum rengi
      borderRadius: BorderRadius.circular(30),
      enabled: widget.enabled,
      disabledOpacity: 0.1,
    );
  }
}

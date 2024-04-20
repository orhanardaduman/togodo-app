import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:togodo/core/helpers/colors/colors.dart';

class RadioWidget extends StatefulWidget {
  const RadioWidget({
    super.key,
    this.size = 50.0,
    this.backgroundColor = MainColors.primary,
    this.iconColor = Colors.white,
    this.initVal = false,
    this.label,
  });
  final double size;
  final Color backgroundColor;
  final Color iconColor;
  final bool initVal;
  final String? label;

  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  bool isChecked = false;
  String? selectedOption = 'Option 1'; // Başlangıçta seçili olan seçenek

  void handleRadioValueChanged(String? value) {
    setState(() {
      selectedOption = value;
    });
  }

  @override
  void initState() {
    isChecked = widget.initVal;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        RadioListTile(
          title: const Text('Seçenek 1'),
          value: 'Option 1',
          groupValue: selectedOption,
          fillColor: MaterialStateProperty.all(widget.backgroundColor),
          onChanged: handleRadioValueChanged,
        ),
        RadioListTile(
          title: const Text('Seçenek 2'),
          value: 'Option 2',
          groupValue: selectedOption,
          fillColor: MaterialStateProperty.all(widget.backgroundColor),
          onChanged: handleRadioValueChanged,
        ),
        RadioListTile(
          title: const Text('Seçenek 3'),
          value: 'Option 3',
          fillColor: MaterialStateProperty.all(widget.backgroundColor),
          groupValue: selectedOption,
          onChanged: handleRadioValueChanged,
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text('Seçilen Seçenek: $selectedOption'),
        ),
        const SizedBox(width: 10),
      ],
    );
  }

  Transform checkBox() {
    return Transform.scale(
      scale: 1.5,
      child: Radio(
        value: isChecked,
        activeColor: widget.backgroundColor,
        fillColor: MaterialStateProperty.all(widget.backgroundColor),
        onChanged: (val) {
          log(val.toString());
          setState(() {});
        },
        groupValue: const [true, false],
      ),
    );
  }
}

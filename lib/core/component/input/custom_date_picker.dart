import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/theme/app_theme.dart';

class CustomCupertinoDateTextBox extends StatefulWidget {
  /// A text box widget which displays a cupertino picker to select a date if clicked
  const CustomCupertinoDateTextBox({
    required this.onDateChange,
    required this.hintText,
    required this.appTheme,
    this.initialValue,
    super.key,
    this.color = CupertinoColors.label,
    this.hintColor = CupertinoColors.inactiveGray,
    this.pickerBackgroundColor = CupertinoColors.systemBackground,
    this.fontSize = 17.0,
    this.textfieldPadding = 15.0,
    this.enabled = true,
  });

  /// The initial value which shall be displayed in the text box
  final DateTime? initialValue;

  /// The function to be called if the selected date changes
  final Function onDateChange;

  /// The text to be displayed if no initial value is given
  final String hintText;

  /// The color of the text within the text box
  final Color color;

  /// The color of the hint text within the text box
  final Color hintColor;

  /// The background color of the cupertino picker
  final Color pickerBackgroundColor;

  /// The size of the font within the text box
  final double fontSize;

  /// The inner padding within the text box
  final double textfieldPadding;

  /// Specifies if the text box can be modified
  final bool enabled;

  final AppTheme appTheme;

  @override
  State<CustomCupertinoDateTextBox> createState() =>
      _CustomCupertinoDateTextBoxState();
}

class _CustomCupertinoDateTextBoxState
    extends State<CustomCupertinoDateTextBox> {
  final double _kPickerSheetHeight = 250;

  DateTime? _currentDate;

  @override
  void initState() {
    super.initState();
    _currentDate = widget.initialValue;
  }

  void callCallback() {
    // ignore: avoid_dynamic_calls
    widget.onDateChange(_currentDate);
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      color: widget.appTheme.appColors.background,
      child: DefaultTextStyle(
        style: TextStyle(
          color: widget.color,
          fontSize: 22,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }

  void onSelectedDate(DateTime date) {
    setState(() {
      _currentDate = date;
    });
  }

  Widget _buildTextField(String hintText, Function onSelectedFunction) {
    String fieldText;
    if (_currentDate != null) {
      final formatter = DateFormat.yMd();
      fieldText = formatter.format(_currentDate!);
    } else {
      fieldText = hintText;
    }

    return Flexible(
      child: CustomTextField(
        isReadOnly: true,
        onTap: !widget.enabled
            ? null
            : () async {
                if (_currentDate == null) {
                  setState(() {
                    _currentDate = DateTime(1992, 1, 1, 1, 1);
                  });
                }
                await showCupertinoModalPopup<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return _buildBottomPicker(
                      CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        backgroundColor: widget.pickerBackgroundColor,
                        initialDateTime: _currentDate,
                        onDateTimeChanged: (DateTime newDateTime) {
                          // ignore: avoid_dynamic_calls
                          onSelectedFunction(newDateTime);
                          // call callback
                          callCallback();
                        },
                      ),
                    );
                  },
                );

                // call callback
                callCallback();
              },
        label: '',
        controller: TextEditingController(text: fieldText),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        _buildTextField(widget.hintText, onSelectedDate),
      ],
    );
  }
}

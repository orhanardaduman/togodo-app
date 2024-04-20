import 'package:flutter/material.dart';

class FlatInfoPageWrapper extends StatelessWidget {
  const FlatInfoPageWrapper({
    super.key,
    this.backgroundColor,
    this.heading,
    this.subHeading,
    this.headingColor,
    this.subHeadingColor,
    this.body,
    this.footer,
  });
  final Color? backgroundColor;
  final String? heading;
  final Color? headingColor;
  final String? subHeading;
  final Color? subHeadingColor;
  final Widget? body;
  final Widget? footer;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? Theme.of(context).primaryColorLight,
      ),
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                heading ?? 'Info Page',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  color: headingColor ?? Theme.of(context).primaryColorDark,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  subHeading ?? 'Goolabs Social UI info page, description.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: subHeadingColor ??
                        Theme.of(context).primaryColorDark.withOpacity(0.54),
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          Container(
            child: body ?? Container(),
          ),
          Container(
            child: footer ?? Container(),
          ),
        ],
      ),
    );
  }
}

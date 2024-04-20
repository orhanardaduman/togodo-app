import 'package:flutter/material.dart';
import 'package:togodo/gen/assets.gen.dart';

class TogodoLogo extends StatelessWidget {
  const TogodoLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Assets.icons.logo.whiteSymbol.svg(
          height: 28,
        ),
        const SizedBox(width: 7),
        Assets.icons.logo.whiteTogodo.svg(),
      ],
    );
  }
}

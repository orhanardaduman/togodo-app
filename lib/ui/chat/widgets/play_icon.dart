import 'package:flutter/material.dart';

class PlayIconWidget extends StatelessWidget {
  const PlayIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 5,
      right: 5,
      child: Container(
        width: 25,
        height: 25,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Colors.black.withOpacity(0.2),
        ),
        child: const Center(
          child: Icon(
            Icons.play_arrow,
            color: Colors.white,
            size: 20,
          ),
        ),
      ),
    );
  }
}

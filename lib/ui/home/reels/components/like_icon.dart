import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:togodo/gen/assets.gen.dart';

class LikeIcon extends StatelessWidget {
  const LikeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: Future<dynamic>.delayed(const Duration(seconds: 3)),
        builder: (context, snapshot) => snapshot.connectionState !=
                ConnectionState.done
            ? LottieBuilder.asset(Assets.lottie.like2, width: 100, height: 100)
            : const SizedBox(),
      ),
    );
  }
}

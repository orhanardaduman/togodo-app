import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:togodo/gen/assets.gen.dart';

class Loading extends ConsumerWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: LottieBuilder.asset(
        Assets.lottie.loader,
      ),
    );
  }
}

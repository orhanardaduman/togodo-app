import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/input/checkbox.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';

class PopUpWidget extends HookConsumerWidget {
  const PopUpWidget({required this.progress, required this.name, super.key});
  final int progress;
  final String name;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(appThemeModeProvider.notifier).isDark;
    final theme = ref.watch(appThemeProvider);
    final completionCount = progress == 25
        ? 3
        : progress == 50
            ? 2
            : 1;
    final router = useRouter();
    final l10n = useL10n();
    final model = ref.read(profilViewModelProvider(null));

    return Align(
      alignment: Alignment.topCenter,
      child: Dismissible(
        key: const Key('popup'),

        direction: DismissDirection.up, // Yukarı kaydırma yönü
        onDismissed: (direction) {
          // Pop-up'ı kaydırdıktan sonra ne yapılacağını belirtiyoruz.
          Navigator.of(context).pop();
        },
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
            showDialog<Dialog>(
              context: context,
              builder: (context) => Dialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                child: CustomModal(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(52),
                  ),
                  maxHeight: context.sized.dynamicHeight(0.8),
                  padding: const EdgeInsets.only(
                    top: 40,
                    left: 32,
                    right: 32,
                    bottom: 32,
                  ),
                  child: SizedBox(
                    height: context.sized.dynamicHeight(0.52),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Center(
                          child: PrimaryText(
                            l10n.completeProfile,
                            style: theme.textTheme.h4
                                .copyWith(fontWeight: FontWeight.w700),
                          ),
                        ),
                        SizedBox(
                          height: context.sized.dynamicHeight(0.032),
                        ),
                        PrimaryText(
                          l10n.profileAlmostPerfect,
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyMedium
                              .copyWith(color: MainColors.grey500),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              router
                                ..pop()
                                ..push(
                                  ProfilEditRoute(),
                                ); // Yeni route'a git
                            },
                            child: SingleChildScrollView(
                              child: Column(
                                children: <Widget>[
                                  CheckmarkWidget(
                                    initVal:
                                        model.profil?.titleCompletion ?? false,
                                    label: l10n.title,
                                    onChanged: () {
                                      router
                                        ..pop()
                                        ..push(
                                          ProfilEditRoute(),
                                        );
                                    },
                                  ),
                                  CheckmarkWidget(
                                    initVal:
                                        model.profil?.socialMediaCompletion ??
                                            false,
                                    onChanged: () {
                                      router
                                        ..pop()
                                        ..push(
                                          ProfilEditRoute(),
                                        );
                                    },
                                    label: l10n.socialMediaAccounts,
                                  ),
                                  CheckmarkWidget(
                                    initVal:
                                        model.profil?.tagCompletion ?? false,
                                    onChanged: () {
                                      router
                                        ..pop()
                                        ..push(
                                          ProfilEditRoute(),
                                        );
                                    },
                                    label: l10n.interests,
                                  ),
                                  CheckmarkWidget(
                                    initVal:
                                        model.profil?.bioCompletion ?? false,
                                    onChanged: () {
                                      router
                                        ..pop()
                                        ..push(
                                          ProfilEditRoute(),
                                        );
                                    },
                                    label: l10n.biography,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        CustomButton(
                          text: l10n.profile_edit_title,
                          radius: 100,
                          onPressed: () {
                            router
                              ..pop()
                              ..push(
                                ProfilEditRoute(),
                              ); // Yeni route'a git
                          },
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          child: Container(
            height: 84,
            width: 400,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
            decoration: BoxDecoration(
              color: themeMode ? MainColors.dark2 : MainColors.white,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      l10n.helloName(name),
                      style: theme.textTheme.h6.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    PrimaryText(
                      l10n.completionSteps(completionCount),
                      style: theme.textTheme.bodyLarge.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                CircularProgressWithPercentage(progress: progress.toDouble()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularProgressWithPercentage extends HookConsumerWidget {
  const CircularProgressWithPercentage({
    required this.progress,
    super.key,
    this.radius = 40.0,
  });
  final double progress;
  final double radius;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return CustomPaint(
      foregroundPainter: CircleProgressPainter(progress),
      child: Container(
        width: 48,
        height: 48,
        alignment: Alignment.center,
        child: PrimaryText(
          '${progress.toInt()}%',
          style: theme.textTheme.bodyMedium.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class CircleProgressPainter extends CustomPainter {
  CircleProgressPainter(this.currentProgress);
  double currentProgress;

  @override
  void paint(Canvas canvas, Size size) {
    final outerCircle = Paint()
      ..strokeWidth = 5
      ..color = MainColors.dark3
      ..style = PaintingStyle.stroke;

    final completeArc = Paint()
      ..strokeWidth = 5
      ..color = MainColors.grey50
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final center = Offset(size.width / 2, size.height / 2);
    final double radius = min(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, outerCircle); // draw outer circle

    final angle = 2 * pi * (currentProgress / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      angle,
      false,
      completeArc,
    ); // draw completed part
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

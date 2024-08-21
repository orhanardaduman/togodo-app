import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:togodo/core/component/custom_event_card.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';

@RoutePage()
class CreateEventSuccesPage extends StatefulHookConsumerWidget {
  const CreateEventSuccesPage({
    required this.theme,
    required this.data,
    required this.title,
    super.key,
  });
  final AppTheme theme;
  final String title;
  final EventModel data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateEventSuccesPageState();
}

class _CreateEventSuccesPageState extends ConsumerState<CreateEventSuccesPage> {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> opacityAnimation;
  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(milliseconds: 3),
      vsync: Navigator.of(context),
    );
    scaleAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.bounceOut),
    );
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeIn),
    );
    controller.forward();
    closePage();

    super.initState();
  }

  void closePage() {
    Future.delayed(const Duration(seconds: 3), () {
      ref.read(homeViewModelProvider.notifier).initEvent(widget.data);
      //  final useL10ns = L10n.of(context)!;
      context.router.pop();
    });
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => closePage,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(24),
          child: AnimatedBuilder(
            animation: controller,
            builder: (context, child) {
              return Opacity(
                opacity: opacityAnimation.value,
                child: Transform.scale(
                  scale: scaleAnimation.value,
                  child: Scaffold(
                    body: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              PrimaryText(
                                widget.title,
                                textAlign: TextAlign.center,
                                style: widget.theme.textTheme.h4.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Divider(
                                height: 48,
                                color: widget.theme.appColors.divider,
                              ),
                              EnventCards(
                                data: widget.data,
                              ),
                            ],
                          ),
                          LottieBuilder.asset(
                            Assets.lottie.confetti,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

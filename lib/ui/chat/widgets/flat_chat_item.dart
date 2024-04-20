import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/chat/widgets/index.dart';

class FlatChatItem extends HookConsumerWidget {
  const FlatChatItem({
    super.key,
    this.profileImage,
    this.name,
    this.message,
    this.counter,
    this.nameColor,
    this.messageColor,
    this.backgroundColor,
    this.multiLineMessage = false,
    this.isWriting = false,
    this.onPressed,
  });

  final Widget? profileImage;
  final String? name;
  final String? message;
  final Widget? counter;
  final Color? nameColor;
  final Color? messageColor;
  final Color? backgroundColor;
  final bool multiLineMessage;
  final bool isWriting;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return InkWell(
      onTap: onPressed,
      child: Ink(
        color: backgroundColor ?? theme.appColors.secondText,
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          child: Row(
            children: [
              profileImage ?? const FlatProfileImage(),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    left: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: context.sized.dynamicWidth(0.43),
                            margin: EdgeInsets.only(
                              bottom: 4,
                              top: multiLineMessage == true ? 8.0 : 0.0,
                            ),
                            child: PrimaryText(
                              '$name',
                              style: theme.textTheme.bodyXLarge.copyWith(
                                color: theme.appColors.text,
                                fontWeight: FontWeight.w700,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: context.sized.dynamicWidth(0.43),
                            child: isWriting
                                ? const AnimatedDotProgress()
                                : Text(
                                    message ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    maxLines:
                                        multiLineMessage == true ? 100 : 1,
                                    style: theme.textTheme.bodyMedium.copyWith(
                                      color: messageColor ?? MainColors.grey300,
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      counter ?? Container(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedDotProgress extends StatefulHookConsumerWidget {
  const AnimatedDotProgress({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AnimatedDotProgressState();
}

class _AnimatedDotProgressState extends ConsumerState<AnimatedDotProgress>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  String _progressText = '.';

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    );

    _animation = Tween<double>(begin: 0, end: 4).animate(_animationController)
      ..addListener(() {
        setState(() {
          final currentProgress = _animation.value.toInt();
          _progressText = '.' * (currentProgress % 4);
        });
      });

    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    return PrimaryText(
      'Yazıyor$_progressText',
      style: theme.textTheme.bodyMedium.copyWith(
        color: theme.appColors.secondText.withOpacity(0.7),
      ),
    );
  }
}

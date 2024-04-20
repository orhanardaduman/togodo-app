import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';

class CommentShimmer extends StatelessWidget {
  const CommentShimmer({
    required this.isDark,
    super.key,
  });
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: isDark ? MainColors.dark3 : MainColors.disabled,
      highlightColor: isDark
          ? MainColors.dark3.withOpacity(0)
          : MainColors.disabled.withOpacity(0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                width: 48,
                height: 48,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 8,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 4),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: 8,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class MessageCustomShimmer extends StatelessWidget {
  const MessageCustomShimmer({
    required this.isDark,
    super.key,
  });
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: isDark ? MainColors.dark3 : MainColors.disabled,
      highlightColor: isDark
          ? MainColors.dark3.withOpacity(0)
          : MainColors.disabled.withOpacity(0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: 150,
                      height: 10,
                      color: Colors.white,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 100,
                      height: 10,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              height: 8,
              color: Colors.white,
            ),
            const SizedBox(height: 10),
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              height: 8,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class EventCardShimmer extends HookConsumerWidget {
  const EventCardShimmer({super.key, this.padding});
  final EdgeInsetsGeometry? padding;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeModeProvider.notifier).isDark;
    return Shimmer.fromColors(
      baseColor: theme ? MainColors.dark3 : MainColors.disabled,
      highlightColor: theme
          ? MainColors.dark3.withOpacity(0)
          : MainColors.disabled.withOpacity(0),
      child: Container(
        width: double.infinity,
        padding:
            padding ?? const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: [
                Container(
                  width: context.sized.dynamicWidth(0.42),
                  height: 302,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
                const Spacer(),
                Container(
                  width: context.sized.dynamicWidth(0.42),
                  height: 302,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

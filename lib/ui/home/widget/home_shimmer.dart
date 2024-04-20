import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';

class MyShimmerWidget extends StatelessWidget {
  const MyShimmerWidget({required this.theme, super.key});
  final AppTheme theme;
  @override
  Widget build(BuildContext context) {
    final isDark = theme.mode == ThemeMode.dark;
    return Shimmer.fromColors(
      baseColor: isDark ? MainColors.dark3 : MainColors.disabled,
      highlightColor: isDark
          ? MainColors.dark3.withOpacity(0)
          : MainColors.disabled.withOpacity(0),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
          ),
          child: Column(
            children: [
              Flexible(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 30),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 135,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                        ),
                        const Spacer(),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 28,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                            ),
                            Container(
                              width: 28,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5),
                            ),
                            Container(
                              width: 28,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 19),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 98,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                        ),
                        Container(
                          width: 98,
                          height: 32,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: context.sized.dynamicWidth(0.36),
                    height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: context.sized.dynamicWidth(0.5),
                    height: 58,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

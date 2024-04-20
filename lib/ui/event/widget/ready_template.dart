// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_circle_button.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/event/view/ready_template.dart';

class ReadyTemplateWidget extends HookConsumerWidget {
  const ReadyTemplateWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    return GestureDetector(
      onTap: () {
        showModalBottomSheet<DraggableScrollableSheet>(
          context: context,
          enableDrag: false,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            // Burada yeni post ekleme formunuzu oluşturun
            return DraggableScrollableSheet(
              minChildSize: 0.4,
              maxChildSize: 0.9,
              initialChildSize: 0.9,
              builder: (_, controller) {
                return ReadyTemplatePage(
                  controller: controller,
                );
              },
            );
          },
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 24, top: 12),
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            Positioned(
              left: 10,
              top: 20,
              child: Transform.rotate(
                angle: -0.2, // Açıyı radyan cinsinden ayarlayın.
                child: Container(
                  width: 57.56,
                  height: 101.38,
                  decoration: BoxDecoration(
                    color: MainColors.primary.withOpacity(
                      0.2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            // Arkadaki eğik şekiller
            Positioned(
              left: 15,
              top: 20,
              child: Transform.rotate(
                angle: -0.1, // Açıyı radyan cinsinden ayarlayın.
                child: Container(
                  width:
                      60.6, // Bu değerler şekillerin boyutunu ayarlamak içindir.
                  height: 106.73,

                  decoration: BoxDecoration(
                    color: MainColors.primary.withOpacity(
                      0.7,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Positioned(
              right: 0,
              left: 75,
              top: 20,
              child: Container(
                padding: const EdgeInsets.only(
                  left: 28,
                  right: 21,
                  top: 15,
                  bottom: 15,
                ),
                decoration: BoxDecoration(
                  color: MainColors.primary,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Assets.icons.bold.category.svg(
                                width: 20,
                                height: 20,
                                color: MainColors.white,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              SizedBox(
                                width: context.sized.dynamicWidth(
                                  context.isSmallScrn ? 0.35 : 0.4,
                                ),
                                child: AutoSizeText(
                                  l10n.readyTemplate,
                                  maxLines: 1,
                                  style: theme.textTheme.h5.copyWith(
                                    color: MainColors.white,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          SizedBox(
                            width: context.sized.dynamicWidth(
                              0.5,
                            ),
                            child: PrimaryText(
                              l10n.readyTemplateInfo,
                              style: theme.textTheme.bodySmall.copyWith(
                                color: MainColors.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 45,
                      height: 45,
                      child: CustomCircleButton(
                        backgroundColor: MainColors.white,
                        borderRadius: BorderRadius.circular(16),
                        iconColor: MainColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Ön plandaki resim
            Assets.images.stock.sablon.image(),
            SizedBox(
              width: context.sized.dynamicWidth(0.90),
            ),
          ],
        ),
      ),
    );
  }
}

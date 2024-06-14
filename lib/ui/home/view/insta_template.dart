// ignore_for_file: deprecated_member_use_from_same_package, use_build_context_synchronously

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:social_share/social_share.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_event_card.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/gen/assets.gen.dart';

class CustomInstagramStoryWidget extends StatefulHookConsumerWidget {
  const CustomInstagramStoryWidget({
    required this.data,
    super.key,
  });
  final EventCommonProperties data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CustomInstagramStoryWidgetState();
}

class _CustomInstagramStoryWidgetState
    extends ConsumerState<CustomInstagramStoryWidget> {
  final screenshotController = ScreenshotController();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      shareToInstagramTemplate(
        ref.watch(appThemeProvider),
        L10n.of(context)!,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    return LoadingOverlay(
      isLoading: true,
      progressIndicator: const Loading(),
      child: Center(
        child: Screenshot(
          controller: screenshotController,
          child: AspectRatio(
            aspectRatio: 9 / 16,
            child: Scaffold(
              backgroundColor: MainColors.dark2,
              body: Stack(
                alignment: Alignment.topRight,
                children: [
                  SizedBox(
                    height: context.sized.height,
                    width: context.sized.width,
                  ),
                  SizedBox(
                    height: context.sized.dynamicHeight(0.55),
                    child: Assets.icons.logo.template.svg(),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      decoration: const BoxDecoration().addCustomShadow(
                        color: const Color(0xFF0D0D0D).withOpacity(0.69),
                        blurRadius: 73,
                        offsetX: 9.21,
                        offsetY: 36.86,
                      ),
                      child: Column(
                        children: [
                          EnventCards(
                            data: widget.data,
                            width: context.sized.dynamicWidth(0.7),
                            height: context.sized.dynamicHeight(0.55),
                            size: EventCardSize.custom,
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          SizedBox(
                            width: context.sized.dynamicWidth(0.5),
                            child: CustomButton(
                              text: l10n.join,
                              style: theme.textTheme.bodyLarge.copyWith(
                                color: MainColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                              bgColor: MainColors.primary.withOpacity(0.2),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                                side: const BorderSide(
                                  color: MainColors.primary400,
                                  width: 3,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              const PrimaryText(
                                'on',
                                style: TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 8,
                                  left: 8,
                                  right: 8,
                                ),
                                child: Assets.icons.logo.togodoLogotype.svg(
                                  height: context.sized.dynamicHeight(0.08),
                                ),
                              ),
                            ],
                          ),
                          const PrimaryText(
                            'İndir ve Etkinlikleri Keşfet!',
                            style: TextStyle(
                              fontSize: 16,
                              color: MainColors.primary,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> shareToInstagramTemplate(AppTheme theme, L10n l10n) async {
    try {
      final imageFile = await screenshotController.capture();
      if (imageFile != null) {
        // Görüntüyü kaydetmek için dosya yolunu alın
        final directory = await getApplicationDocumentsDirectory();
        final imagePath = await File('${directory.path}/story.png').create();
        await imagePath.writeAsBytes(imageFile);

        // Görüntüyü Instagram hikayesine ekleyin
        try {
          await SocialShare.shareInstagramStory(
            appId: dotenv.env['FACEBOOK_APP_ID']!,
            backgroundBottomColor: '#0xFF0043FB',
            backgroundTopColor: '#0xFF0042F7',
            attributionURL: 'https://www.togodo.app',
            imagePath: imagePath.path,
          ).then((value) async {
            await AutoRouter.of(context).pop();
          });
        } catch (e) {
          if (kDebugMode) {
            print('Error while sharing to Instagram: $e');
            await AutoRouter.of(context).pop();
          }
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print('Error while sharing to Instagram: $e');
        await AutoRouter.of(context).pop();
      }
    }
  }
}

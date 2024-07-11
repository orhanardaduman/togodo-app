import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/component/custom_divider.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/event/view_model/create_event_view_model.dart';

class DividerWithTextAndIcon extends HookConsumerWidget {
  const DividerWithTextAndIcon({
    required this.text,
    required this.iconData,
    super.key,
  });
  final String text;
  final IconData iconData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final model = ref.watch(createEventModelProvider);
    final l10n = useL10n();
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Expanded(
          child: CustomDivider(),
        ),
        const SizedBox(width: 8),
        RichText(
          text: TextSpan(
            style: theme.textTheme.bodyMedium
                .copyWith(color: theme.appColors.secondText),
            children: <TextSpan>[
              TextSpan(
                text: '${l10n.or} ',
              ),
              TextSpan(
                text: '${l10n.addFromGallery} ',
                style: theme.textTheme.bodyMedium.copyWith(
                  color: MainColors.primary,
                  fontWeight: FontWeight.w700,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = model.selectedAssetsAll != null &&
                          model.selectedAssetsAll!.length == 5
                      ? () {}
                      : () async {
                          final picker = ImagePicker();

                          final pickedFile = await picker.pickMultiImage();
                          List<File> deneme = [];

                          final file = pickedFile.fold(
                            deneme,
                            (p, e) => [...p, File(e.path)],
                          );
                          ref
                              .read(createEventModelProvider.notifier)
                              .selectAllAssets(
                                isNetwork: false,
                                file: file.toSet().toList(),
                              );
                          /* await ServicePicker().pickImage(
                            context,
                            theme,
                            maxAssets: 5 - model.selectedAssetsAll!.length,
                            (
                              Stream<InstaAssetsExportDetails> exportDetails,
                            ) async {
                              // Stream'den tüm elemanları alıp bir listeye döküyoruz
                              final detailsList = await exportDetails;
                              print("burdaaaaa");
                              List<File> deneme = [];
                              final file = await detailsList.fold(
                                deneme,
                                (p, e) => [...p, ...e.croppedFiles],
                              );
                              print(file.length.toString());

                              ref
                                  .read(createEventModelProvider.notifier)
                                  .selectAllAssets(
                                    isNetwork: false,
                                    file: file.toSet().toList(),
                                  );

                              await router.pop();
                            },
                          );*/
                        },
              ),
            ],
          ),
        ),
        Assets.icons.bold.image.svg(
          color: MainColors.primary,
          width: 16,
          height: 16,
        ),
        const SizedBox(width: 8),
        const Expanded(
          child: CustomDivider(),
        ),
      ],
    );
  }
}

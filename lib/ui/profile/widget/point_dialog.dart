import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/component/primary_text.dart';
import '../../../core/helpers/colors/colors.dart';
import '../../../core/hook/use_l10n.dart';
import '../../../core/theme/app_text_theme.dart';
import '../../../data/model/profil/profil_model.dart';
import '../../../gen/assets.gen.dart';
import '../view_model/profil_view_model.dart';

class PointDialog extends StatefulHookConsumerWidget {
  const PointDialog({super.key, required this.data});
  final ProfilModel data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PointDialogState();
}

class _PointDialogState extends ConsumerState<PointDialog> {
  int? selectedPoint;
  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();

    return Scaffold(
      backgroundColor: Color(0xfff09101D).withOpacity(.7),
      body: Center(
        child: GestureDetector(
          onTap: () {},
          child: Container(
            width: MediaQuery.of(context).size.width * .8,
            padding: const EdgeInsets.all(
              20,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                52,
              ),
              color: MainColors.bottomColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Assets.icons.bold.star.svg(
                  width: 75,
                  height: 75,
                  color: MainColors.primary,
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryText(
                  l10n.comunityPoint,
                  style: AppTextTheme().bodyXLarge.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [1, 2, 3, 4, 5]
                      .map(
                        (e) => GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedPoint = e;
                            });
                          },
                          child: Assets.icons.bold.star.svg(
                            width: 40,
                            height: 40,
                            color: (e >
                                    (selectedPoint ??
                                        widget.data.calculatedPoint ??
                                        0.0))
                                ? MainColors.dark2
                                : MainColors.success,
                          ),
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryText(
                  '${(selectedPoint ?? widget.data.calculatedPoint ?? 0.0).toStringAsFixed(1)}/5',
                  style: AppTextTheme().bodyXLarge.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryText(
                  l10n.pointFrom(widget.data.pointCount ?? 0),
                  style: AppTextTheme().bodyXLarge.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    if (selectedPoint != null) {
                      Navigator.pop(context);
                      ref
                          .read(
                            profilViewModelProvider(widget.data.id).notifier,
                          )
                          .addPoint(selectedPoint ?? 0, widget.data.id ?? '');
                    } else {
                      Navigator.pop(context);
                    }
                  },
                  child: PrimaryText(
                    selectedPoint != null ? l10n.save_button : l10n.close,
                    style: AppTextTheme().bodyMedium.copyWith(
                          color: MainColors.primary,
                          fontSize: 16,
                        ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/component/primary_text.dart';
import '../../../core/helpers/colors/colors.dart';
import '../../../core/hook/use_l10n.dart';
import '../../../core/theme/app_text_theme.dart';
import '../../../data/model/event/event_rating_needed_model.dart';
import '../../../gen/assets.gen.dart';
import '../../notification_view_model.dart';
import 'event_point_scuess_popup.dart';

class EventPointDialog extends StatefulHookConsumerWidget {
  const EventPointDialog({super.key, required this.data});
  final EventRatingNeededModel data;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EventPointDialogState();
}

class _EventPointDialogState extends ConsumerState<EventPointDialog> {
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
                  l10n.eventRateText(widget.data.eventName ?? ""),
                  textAlign: TextAlign.center,
                  style: AppTextTheme().bodyXLarge.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryText(
                  l10n.rateYourExperince,
                  textAlign: TextAlign.center,
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
                            Navigator.pop(context);
                            ref.read(notificationStateProvider.notifier).rate(
                                  widget.data,
                                  selectedPoint ?? e,
                                );
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const EventPointScuessPopup();
                              },
                            );
                          },
                          child: Assets.icons.bold.star.svg(
                            width: 40,
                            height: 40,
                            color: (e > (selectedPoint ?? 0.0))
                                ? MainColors.dark2
                                : MainColors.success,
                          ),
                        ),
                      )
                      .toList(),
                ),
                Row(
                  children: [
                    PrimaryText(
                      l10n.bad,
                      style: AppTextTheme().bodyXLarge.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    Spacer(),
                    PrimaryText(
                      l10n.veryGood,
                      style: AppTextTheme().bodyXLarge.copyWith(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                /*PrimaryText(
                  '${(selectedPoint ?? widget.data.calculatedPoint ?? 0.0).toStringAsFixed(1)}/5',
                  style: AppTextTheme().bodyXLarge.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                ),*/
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref
                        .read(notificationStateProvider.notifier)
                        .askLater(widget.data);
                  },
                  child: PrimaryText(
                    l10n.askLater,
                    style: AppTextTheme().bodyMedium.copyWith(
                          color: MainColors.primary,
                          fontSize: 16,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    ref
                        .read(notificationStateProvider.notifier)
                        .neverAsk(widget.data);
                  },
                  child: PrimaryText(
                    l10n.didintAttend,
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

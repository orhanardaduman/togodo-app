// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/input/custom_text_field.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';

class RatingPopupView extends StatefulHookConsumerWidget {
  const RatingPopupView({
    required this.eventName,
    required this.eventId,
    this.onDissmissed,
    super.key,
  });
  final String eventName;
  final String eventId;
  final void Function()? onDissmissed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RatingPopupViewState();
}

class _RatingPopupViewState extends ConsumerState<RatingPopupView> {
  final textEditingController = TextEditingController();
  double rating = 5;

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final homeNotifier = ref.read(homeViewModelProvider.notifier);
    return Wrap(
      runSpacing: context.dyHeight(20),
      children: [
        PrimaryText(
          l10n.ratingTitle(widget.eventName),
          textAlign: TextAlign.center,
          maxLines: 2,
          style: theme.textTheme.h4.copyWith(
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        PrimaryText(
          l10n.rating,
          style: theme.textTheme.h5.copyWith(
            fontWeight: FontWeight.w700,
            color: theme.appColors.text,
          ),
          textAlign: TextAlign.center,
        ),
        RatingBar.builder(
          minRating: 1,
          initialRating: 5,
          allowHalfRating: true,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4),
          itemBuilder: (context, _) => Assets.icons.bold.star.svg(
            color: MainColors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              rating = rating;
            });
          },
        ),
        PrimaryText(
          l10n.ratingExp,
          style: theme.textTheme.h5.copyWith(
            fontWeight: FontWeight.w700,
            color: theme.appColors.text,
          ),
          textAlign: TextAlign.center,
        ),
        CustomTextField(
          label: l10n.description_label,
          minLines: 3,
          /*    onTap: () {
            setState(() {});
          }, */
          onFieldSubmitted: (p0) {
            homeNotifier.createEventRating(
              widget.eventId,
              rating,
              textEditingController.text,
            );
            widget.onDissmissed?.call();

            AutoRouter.of(context).pop();
            showToast(
              context,
              'Başarılı',
              gravity: ToastGravity.CENTER,
            );
          },
          controller: textEditingController,
          textInputAction: TextInputAction.send,
        ),
        CustomButton(
          text: l10n.send,
          onPressed: () {
            homeNotifier.createEventRating(
              widget.eventId,
              rating,
              textEditingController.text,
            );
            widget.onDissmissed?.call();

            AutoRouter.of(context).pop();
            showToast(
              context,
              'Başarılı',
              gravity: ToastGravity.CENTER,
            );
          },
          radius: 100,
        ),
        CustomButton(
          text: l10n.noThnx,
          mode: ButtonMode.dark,
          onPressed: () {
            widget.onDissmissed?.call();
            AutoRouter.of(context).pop();
          },
          radius: 100,
        ),
      ],
    );
  }
}

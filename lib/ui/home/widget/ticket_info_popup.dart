import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/index.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';

class TicketInfoWidget extends StatelessWidget {
  const TicketInfoWidget({
    required this.l10n,
    required this.theme,
    required this.url,
    super.key,
  });
  final L10n l10n;
  final AppTheme theme;
  final String url;

  @override
  Widget build(BuildContext context) {
    return CustomModal(
      maxHeight: context.sized.dynamicHeight(0.8),
      borderRadius: const BorderRadius.all(
        Radius.circular(52),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: context.dyHeight(12),
          ),
          Assets.images.dark.g8.svg(),
          SizedBox(
            height: context.dyHeight(32),
          ),
          PrimaryText(
            l10n.ticketPopupTitle,
            style: theme.textTheme.h4.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
          SizedBox(
            height: context.dyHeight(32),
          ),
          PrimaryText(
            l10n.ticketPopupInfo,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: context.dyHeight(32),
          ),
          CustomButton(
            text: l10n.close,
            mode: ButtonMode.dark,
            onPressed: () {
              Navigator.of(context).pop();
            },
            radius: 100,
          ),
          SizedBox(
            height: context.dyHeight(12),
          ),
          CustomButton(
            text: l10n.buyTicket,
            onPressed: () {
              Navigator.of(context).pop();
              launchUrls(url);
            },
            radius: 100,
          ),
          SizedBox(
            height: context.dyHeight(12),
          ),
        ],
      ),
    );
  }
}

void showTicketInfo(
  AppTheme theme,
  BuildContext context,
  L10n l10n,
  String ticketUrl,
) {
  showDialog<Dialog>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: TicketInfoWidget(
        l10n: l10n,
        theme: theme,
        url: ticketUrl,
      ),
    ),
  );
}

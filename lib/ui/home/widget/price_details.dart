import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/home/view_model/event_details_view_model.dart';

class EventPriceDetails extends StatelessWidget {
  const EventPriceDetails({
    required this.l10n,
    required this.theme,
    required this.model,
    super.key,
  });

  final L10n l10n;
  final AppTheme theme;
  final EventDetailsState model;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: context.sized.dynamicWidth(201 / 430),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryText(
                        l10n.price,
                        style: theme.textTheme.bodyXSmall.copyWith(
                          fontWeight: FontWeight.w500,
                          color: theme.appColors.secondText,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                          style: theme.textTheme.bodyMedium.copyWith(
                            color: theme.appColors.secondText,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '${model.events!.price}',
                              style: theme.textTheme.h3.copyWith(
                                color: MainColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: '₺',
                              style: theme.textTheme.bodyLarge.copyWith(
                                color: MainColors.primary,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            TextSpan(
                              text: l10n.priceInfo,
                              style: theme.textTheme.bodyMedium.copyWith(
                                color: theme.appColors.secondText,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            if (model.events!.ticketUrl != null)
              SizedBox(
                width: context.sized.dynamicWidth(172 / 430),
                height: 58,
                child: CustomButton(
                  radius: 100,
                  shadowColor: Colors.transparent,
                  bgColor: MainColors.transparentBlue.withOpacity(0.08),
                  text: l10n.buyTicket,
                  style: theme.textTheme.bodyLarge.copyWith(
                    color: MainColors.primary,
                    fontWeight: FontWeight.w700,
                  ),
                  onPressed: () {
                    launchUrls(model.events!.ticketUrl!);
                  },
                ),
              ),
          ],
        ),
        if (model.events!.prices.ext.isNotNullOrEmpty)
          const SizedBox(
            height: 24,
          ),
        if (model.events!.prices.ext.isNotNullOrEmpty)
          TextButton(
            onPressed: () => ticketDetailsShow(context),
            child: PrimaryText(
              l10n.ticketInfo,
              style: theme.textTheme.bodyLarge.copyWith(
                fontWeight: FontWeight.w500,
                color: MainColors.primary,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        Divider(
          color: theme.appColors.divider,
          height: 48,
        ),
      ],
    );
  }

  void ticketDetailsShow(BuildContext context) {
    showModalBottomSheet<DraggableScrollableSheet>(
      context: context,
      enableDrag: false,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        // Burada yeni post ekleme formunuzu oluşturun
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.45, // Başlangıç boyutu
          maxChildSize: 0.6,
          minChildSize: 0.45, // Minimum kaplayacağı boyut
          builder: (_, controller) {
            return SingleChildScrollView(
              controller: controller,
              child: CustomModal(
                title: l10n.ticketInfo,
                maxHeight: context.sized.dynamicHeight(0.9),
                isCloseDivider: true,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 23,
                ),
                child: Wrap(
                  runSpacing: 24,
                  children: [
                    const Divider(),
                    Wrap(
                      runSpacing: 24,
                      children: model.events!.prices!
                          .map(
                            (e) => CustomButton(
                              text: '${e.name} - ${e.fee} ${e.currency}',
                              mode: ButtonMode.dark,
                              mainAxisAlignment: MainAxisAlignment.start,
                              leftIcon: Assets.icons.social.googleMapsSvg.path,
                              iconSize: 24,
                              isLeftIconColor: false,
                              onPressed: () {},
                            ),
                          )
                          .toList(),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }
}

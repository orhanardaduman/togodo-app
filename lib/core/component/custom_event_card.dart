// ignore_for_file: no_default_cases, use_named_constants, deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:form_builder_extra_fields/form_builder_extra_fields.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/date_time.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/features/component/featured_image.dart';
import 'package:togodo/features/component/like_button.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/settings/language_settings.dart';

enum EventCardSize { small, medium, large, custom }

class EnventCards extends HookConsumerWidget {
  const EnventCards({
    this.data,
    super.key,
    this.size = EventCardSize.medium,
    this.width,
    this.height,
    this.onLikeChanged,
    this.isShowRating = false,
    this.radius = 28,
  });
  final EventCardSize size;
  final double? width;
  final double? height;
  final EventCommonProperties? data;
  final double? radius;
  final bool isShowRating;
  final void Function({required bool isLiked})? onLikeChanged;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final language = ref.watch(languageProvider);
    final theme = ref.watch(appThemeProvider);
    double calculatedWidth;
    double calculatedHeight;
    double subFontSize;
    double titleFontSize;
    // ignore: unused_local_variable
    double iconSize;
    double dateSize;
    if (size == EventCardSize.custom) {
      calculatedWidth = width ?? 250;
      calculatedHeight = height ?? 388;
      subFontSize = 14;
      titleFontSize = 20;
      iconSize = 28;
      dateSize = 18;
    } else {
      // Diğer durumlarda enum değerine göre boyutları ayarla
      switch (size) {
        case EventCardSize.small:
          calculatedWidth = 156;
          calculatedHeight = 238;
          subFontSize = 10;
          iconSize = 17.2;
          titleFontSize = 10;
          dateSize = 14;

        case EventCardSize.medium:
          calculatedWidth = 189;
          calculatedHeight = 302;
          subFontSize = 12;
          iconSize = 20;
          dateSize = 16;
          titleFontSize = 14;

        case EventCardSize.large:
          calculatedWidth = 300;
          calculatedHeight = 458;
          subFontSize = 14;
          iconSize = 28;
          dateSize = 18;
          titleFontSize = 20;

        default:
          calculatedWidth = 250;
          calculatedHeight = 388;
          titleFontSize = 20;
          iconSize = 28;
          dateSize = 18;
          subFontSize = 14;
      }
    }

    return SizedBox(
      width: calculatedWidth,
      height: calculatedHeight,
      child: Stack(
        fit: StackFit.expand,
        children: [
          FeaturedImageWidget(
            imageUrl: data?.imageUrl ?? '',
            resolution: data?.resolution ?? '1200x800',
            borderRadius: BorderRadius.all(Radius.circular(radius ?? 28)),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 12,
              left: 12,
              bottom: onLikeChanged == null ? 14 : 5,
            ),
            child: onTextColumn(
              theme,
              dateSize,
              subFontSize,
              titleFontSize,
              context,
              calculatedWidth,
              language,
            ),
          ),
        ],
      ),
    );
  }

  Column onTextColumn(
    AppTheme theme,
    double dateSize,
    double subFontSize,
    double titleFontSize,
    BuildContext context,
    double calculatedWidth,
    String language,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (isShowRating && data?.rating != null && data?.rating != 0.0)
              Row(
                children: [
                  RatingBarIndicator(
                    rating: data?.rating ?? 0,
                    itemSize: 16,
                    itemBuilder: (context, _) => Assets.icons.bold.star.svg(
                      color: MainColors.amber,
                    ),
                  ),
                  const SizedBox(width: 8),
                  PrimaryText(
                    '${data?.rating}/5',
                    style: theme.textTheme.bodySmall.copyWith(
                      color: theme.appColors.text,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              )
            else
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    PrimaryText(
                      data?.date != null
                          ? data?.date?.getFormattedDate(language) ?? ''
                          : '',
                      style: theme.textTheme.bodyXLarge.copyWith(
                        color: MainColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: dateSize,
                      ),
                    ),
                    PrimaryText(
                      data?.date != null
                          ? data?.date?.getFormattedDay(language) ?? ''
                          : '',
                      style: theme.textTheme.bodyMedium.copyWith(
                        color: MainColors.white,
                        fontSize: subFontSize,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        const Spacer(),
        Row(
          children: [
            Container(
              width: EventCardSize.large == size ? 20 : 16,
              height: EventCardSize.large == size ? 20 : 16,
              decoration: BoxDecoration(
                image: data?.vendorDetails != null
                    ? DecorationImage(
                        image: NetworkImage(
                          data?.vendorDetails?.imageUrl ?? '',
                        ),
                        fit: BoxFit.cover,
                      )
                    : DecorationImage(
                        image: AssetImage(
                          Assets.images.stock.avatar.path,
                        ),
                        fit: BoxFit.cover,
                      ),
                borderRadius: BorderRadius.circular(99.9994888305664),
              ),
            ),
            const SizedBox(width: 8),
            SizedBox(
              width: calculatedWidth - 90,
              child: PrimaryText(
                data?.vendorDetails?.name ?? 'Vendor Name',
                maxLines: 1,
                style: theme.textTheme.bodyMedium.copyWith(
                  color: MainColors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: EventCardSize.large == size ? 14 : 10,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ),
        if (data?.name != null)
          SizedBox(
            width: calculatedWidth - 24,
            child: PrimaryText(
              data?.name ?? '',
              maxLines: 2,
              style: theme.textTheme.h5.copyWith(
                color: MainColors.white,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
                fontSize: titleFontSize,
              ),
            ),
          ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (data?.location != null)
              SizedBox(
                width: size == EventCardSize.small
                    ? 85
                    : context.isSmallScrn
                        ? 85
                        : 120,
                child: PrimaryText(
                  data?.location ?? '',
                  style: theme.textTheme.bodyMedium.copyWith(
                    color: MainColors.white,
                    fontSize: subFontSize,
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            const Spacer(),
            if (onLikeChanged != null)
              SizedBox(
                width: 35,
                height: 30,
                child: LikeButton(
                  theme: theme,
                  isLiked: data?.likeStatus ?? false,
                  onLikeChanged: ({required bool isLiked}) {
                    onLikeChanged?.call(isLiked: isLiked);
                  },
                ),
              ),
          ],
        ),
      ],
    );
  }

  BoxDecoration decoration(double radius) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(radius),
      gradient: const LinearGradient(
        colors: [
          Color(0xff272727),
          Color(0x00000000),
        ],
        stops: [
          0,
          0.375,
        ],
        begin: Alignment(-0, -1),
        end: Alignment(0, 1),
        // angle: 180,
        // scale: undefined,
      ),
    );
  }
}

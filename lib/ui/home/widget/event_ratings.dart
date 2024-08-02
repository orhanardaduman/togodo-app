// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/extension/time_ago_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_details_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/home/widget/event_ratings_all.dart';
import 'package:togodo/ui/settings/language_settings.dart';

class EventRatingsWidget extends HookConsumerWidget {
  const EventRatingsWidget({
    this.ratings,
    this.ratingsList,
    this.count,
    super.key,
  });
  final List<Ratings>? ratingsList;
  final double? ratings;
  final int? count;

  @override
  Widget build(
    BuildContext context,
    WidgetRef ref,
  ) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();

    return Column(
      children: [
        Row(
          children: [
            PrimaryText(
              l10n.evaluation,
              style: theme.textTheme.h5.copyWith(
                fontWeight: FontWeight.bold,
                color: theme.appColors.text,
              ),
            ),
            const Spacer(),
            Assets.icons.bold.star.svg(
              color: MainColors.amber,
              width: 24,
            ),
            const SizedBox(width: 8),
            PrimaryText(
              '${ratings?.toStringAsFixed(2)}/($count)',
              style: theme.textTheme.bodyMedium.copyWith(
                color: theme.appColors.text,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        if (ratingsList.ext.isNotNullOrEmpty)
          EventRatingsItem(ratings: ratingsList!.last),
        if (ratingsList.ext.isNotNullOrEmpty && ratingsList!.length > 1)
          allSeeButton(context, l10n, theme),
        Divider(
          color: theme.appColors.divider,
          height: 48,
        ),
      ],
    );
  }

  TextButton allSeeButton(BuildContext context, L10n l10n, AppTheme theme) {
    return TextButton(
      onPressed: () {
        showMaterialModalBottomSheet<DraggableScrollableSheet>(
          context: context,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            // Burada yeni post ekleme formunuzu oluşturun
            return DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.9, // Başlangıç boyutu
              maxChildSize: 0.9,
              minChildSize: 0.9, // Minimum kaplayacağı boyut
              builder: (_, controller) {
                return EventRatingsAllPage(
                  dragScrollController: controller,
                  ratingsList: ratingsList,
                );
              },
            );
          },
        );
      },
      child: PrimaryText(
        l10n.seeAll,
        style: theme.textTheme.bodyLarge.copyWith(
          fontWeight: FontWeight.w700,
          color: MainColors.primary,
        ),
      ),
    );
  }
}

class EventRatingsItem extends HookConsumerWidget {
  const EventRatingsItem({required this.ratings, super.key});
  final Ratings ratings;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final language = ref.watch(languageProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            router.push(UserProfileRoute(userId: ratings.userId!));
          },
          child: Row(
            children: [
              CustomAvatarImage(
                borderRadius: 100,
                imageUrl: ratings.imageUrl,
              ),
              SizedBox(
                width: context.dyWidth(16),
              ),
              PrimaryText(
                '${ratings.name}',
                style: theme.textTheme.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
        /*  SizedBox(
          height: context.dyHeight(24),
        ),
        ReadMoreText(
          text: ratings.description ?? '',
          onTapDetection: (p0) {},
        ),
        SizedBox(
          height: context.dyHeight(12),
        ),*/
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            RatingBarIndicator(
              rating: ratings.rating!,
              itemSize: 24,
              itemBuilder: (context, _) => Assets.icons.bold.star.svg(
                color: MainColors.amber,
              ),
            ),
            const Spacer(),
            PrimaryText(
              language == 'tr'
                  ? ratings.createdAt!.formatCreatedAt()
                  : ratings.createdAt!.formatCreatedAtEn(),
              style: theme.textTheme.bodySmall.copyWith(
                fontWeight: FontWeight.w500,
                color: MainColors.grey700,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

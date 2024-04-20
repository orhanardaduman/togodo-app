// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_social_textfield/flutter_social_textfield.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/extension/time_ago_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_comment_model.dart';
import 'package:togodo/features/component/like_button.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/settings/language_settings.dart';

class CommentItems extends HookConsumerWidget {
  const CommentItems({
    required this.model,
    required this.theme,
    required this.eventId,
    required this.isEventOwner,
    required this.onLikeChanged,
    required this.replyOnTap,
    this.markPressed,
    this.deleteOnPressed,
    this.isSettingIcon = false,
    super.key,
  });

  final EventCommentModel model;
  final String eventId;
  final bool isEventOwner;
  final AppTheme theme;
  final void Function({required bool isLiked}) onLikeChanged;
  final void Function()? replyOnTap;
  final void Function(BuildContext)? deleteOnPressed;
  final void Function(BuildContext)? markPressed;
  final bool isSettingIcon;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final isDark = ref.watch(appThemeModeProvider.notifier).isDark;
    final router = useRouter();
    final language = ref.watch(languageProvider);
    final l10n = useL10n();
    final userModel = ref.watch(userViewModelProvider).userId ?? '';
    return Slidable(
      key: Key(model.id!),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          if (model.userId == userModel || model.isCurrentUser! || isEventOwner)
            CustomSlidableAction(
              onPressed: deleteOnPressed,
              backgroundColor: MainColors.transparentRed.withOpacity(0.08),
              foregroundColor: MainColors.red,
              child: Assets.icons.bold.delete.svg(
                width: 24,
                height: 24,
                color: MainColors.red,
              ),
            ),
          CustomSlidableAction(
            onPressed: (BuildContext? context) {
              replyOnTap?.call();
            },
            backgroundColor: isDark ? MainColors.dark2 : MainColors.grey400,
            foregroundColor: MainColors.grey50,
            child: Assets.icons.bold.reply.svg(
              width: 24,
              height: 24,
            ),
          ),
          if (isEventOwner && markPressed != null)
            CustomSlidableAction(
              onPressed: markPressed,
              backgroundColor: isDark ? MainColors.dark2 : MainColors.grey400,
              foregroundColor: MainColors.grey50,
              child: Assets.icons.bold.pinned.svg(
                width: 24,
                height: 24,
              ),
            ),
          /*    if (!model.isCurrentUser! && !model.isEventOwner!)
            CustomSlidableAction(
              onPressed: (BuildContext? context) {},
              backgroundColor: isDark ? MainColors.dark2 : MainColors.grey400,
              foregroundColor: MainColors.grey50,
              child: Assets.icons.bold.dangerCircle.svg(
                width: 24,
                height: 24,
              ),
            ), */
        ],
      ),
      child: model.isEventOwner ?? false
          ? Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 24,
              ),
              decoration: BoxDecoration(
                color: MainColors.transparentBlue.withOpacity(0.08),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  PrimaryText(
                    l10n.eventAdmin,
                    style: theme.textTheme.bodySmall.copyWith(
                      fontWeight: FontWeight.w500,
                      color: MainColors.primary,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  body(context, theme, router, language, l10n),
                ],
              ),
            )
          : body(context, theme, router, language, l10n),
    );
  }

  Column body(
    BuildContext context,
    AppTheme theme,
    StackRouter router,
    String language,
    L10n l10n,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                model.isCurrentUser ?? false
                    ? router.push(
                        ProfileRoute(),
                      )
                    : router.push(
                        UserProfileRoute(
                          userId: model.userId!,
                        ),
                      );
              },
              child: Row(
                children: [
                  CustomAvatarImage(
                    borderRadius: 100,
                    imageUrl: model.imageUrl,
                  ),
                  SizedBox(
                    width: context.dyWidth(16),
                  ),
                  PrimaryText(
                    '${model.name}',
                    style: theme.textTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            if (model.isMark!)
              Assets.icons.bold.pinned.svg(
                width: 24,
                height: 24,
                color: MainColors.primary,
              ),
            if (isSettingIcon)
              InkWell(
                onTap: () {
                  showCustomModalBottomSheets(
                    context,
                    initialChildSize: 0.2,
                    [
                      listTile(
                        l10n.deleteMessage,
                        isLast: true,
                        () {
                          deleteOnPressed?.call(context);
                        },
                        theme,
                      ),
                    ],
                    theme,
                  );
                },
                child: Assets.icons.bold.additionalIcons.svg(
                  width: 24,
                  height: 24,
                  color: MainColors.grey700,
                ),
              ),
          ],
        ),
        SizedBox(
          height: context.dyHeight(24),
        ),
        ReadMoreText(
          text: model.comment ?? '',
          onTapDetection: (p0) {
            /*  if (p0.text.trim().startsWith('@')) {
              final name = p0.text.trim().replaceAll('@', '');
            } else if (p0.text.trim().startsWith('#')) {
              final name = p0.text.trim().replaceAll('#', '');
            } */
          },
        ),
        SizedBox(
          height: context.dyHeight(12),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LikeButton(
              isLiked: model.likeStatus!,
              onLikeChanged: onLikeChanged,
              theme: theme,
              width: 40,
              likeCount: model.likeCount,
              isShowCount: true,
              isRow: true,
              style: theme.textTheme.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.mode == ThemeMode.dark
                    ? MainColors.grey50
                    : MainColors.grey500,
              ),
            ),
            SizedBox(
              width: context.dyWidth(24),
            ), // 3.02.2024 16:54:31,
            //"2024-02-03 19:54:31.65771+03"

            PrimaryText(
              language == 'tr'
                  ? model.date!.formatCreatedAt()
                  : model.date!.formatCreatedAtEn(),
              style: theme.textTheme.bodySmall.copyWith(
                fontWeight: FontWeight.w500,
                color: MainColors.grey700,
              ),
            ),
            const Spacer(),
            InkWell(
              onTap: replyOnTap,
              child: PrimaryText(
                l10n.reply,
                style: theme.textTheme.bodySmall.copyWith(
                  fontWeight: FontWeight.w500,
                  color: theme.appColors.text,
                ),
              ),
            ),
            SizedBox(
              width: context.dyWidth(4),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }

  Column listTile(
    String text,
    void Function()? onTap,
    AppTheme theme, {
    bool isLast = false,
  }) {
    return Column(
      children: [
        ListTile(
          title: Center(
            child: PrimaryText(
              text,
              style: theme.textTheme.bodyMedium.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          onTap: onTap,
        ),
        if (!isLast)
          Divider(
            indent: 20,
            endIndent: 28,
            color: theme.appColors.divider,
          ),
      ],
    );
  }
}

class ReadMoreText extends HookConsumerWidget {
  const ReadMoreText({
    required this.text,
    this.trimLength = 150,
    this.onTapDetection,
    this.style,
    super.key,
  });

  final String text;
  final int trimLength;
  final TextStyle? style;
  final dynamic Function(SocialContentDetection)? onTapDetection;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    final readMore = useState(true);

    final displayText = readMore.value
        ? text.substring(0, text.length > trimLength ? trimLength : text.length)
        : text;
    final l10n = useL10n();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AutoSizeText.rich(
          TextSpan(
            style: theme.textTheme.bodyMedium.copyWith(
              fontWeight: FontWeight.w400,
              color: theme.appColors.text,
            ),
            children: [
              SocialTextSpanBuilder(
                regularExpressions: {
                  DetectedType.mention: atSignRegExp,
                  DetectedType.hashtag: hashTagRegExp,
                  DetectedType.url: urlRegex,
                },
                defaultTextStyle: style ??
                    theme.textTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w500,
                      color: theme.appColors.text,
                    ),
                detectionTextStyles: {
                  DetectedType.mention: TextStyle(
                    color: MainColors.primary,
                    backgroundColor: MainColors.primary.withAlpha(50),
                  ),
                  DetectedType.hashtag: const TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                  DetectedType.url: const TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w600,
                  ),
                },
                onTapDetection: onTapDetection,
              ).build(displayText),
            ],
          ),
          textAlign: TextAlign.start,
        ),
        if (text.length > trimLength)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  readMore.value = !readMore.value;
                },
                child: Text(
                  readMore.value ? l10n.seeMore : l10n.seeLess,
                  style: theme.textTheme.bodyXSmall,
                ),
              ),
            ],
          ),
      ],
    );
  }
}

RegExp atSignRegExps = RegExp(
  r'@([A-Za-z0-9_çğışöüÇĞİŞÖÜ]+)(\s+[A-Za-z0-9_çğışöüÇĞİŞÖÜ]+)?',
);

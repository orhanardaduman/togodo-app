import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/features/provider/tag_provider.dart';
import 'package:togodo/ui/common/index.dart';

class TagChipWidget extends HookConsumerWidget {
  const TagChipWidget({this.userType = UserType.user, super.key, this.tagList});
  final List<TagsModel>? tagList;
  final UserType userType;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final hobyData = ref.watch(hobyStateNotifierProvider(context));
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Wrap(
        spacing: 10,
        children: tagList!.expand(
          (tag) {
            final data = hobyData.firstWhere(
              (element) => element.id == tag.id,
              orElse: TagsModel.new,
            );
            return buildTagsWithSubtags(
              data,
              theme,
              router,
              tag.id!,
              context,
            );
          },
        ).toList(),
      ),
    );
  }

  List<Widget> buildTagsWithSubtags(
    TagsModel tag,
    AppTheme theme,
    StackRouter router,
    int routeId,
    BuildContext context,
  ) {
    // Ana tag için bir chip widget'ı oluştur
    final widgets = <Widget>[
      chipMet(theme, tag.name!, router, routeId, context),
    ];

    // Eğer alt tag'lar varsa, bunlar için de chip widget'ları oluştur ve listeye ekle
    if (tag.subTags != null && tag.subTags!.isNotEmpty) {
      for (final subTag in tag.subTags!) {
        widgets.addAll(
          buildTagsWithSubtags(
            subTag,
            theme,
            router,
            tag.id!,
            context,
          ),
        );
      }
    }

    return widgets;
  }

  InkWell chipMet(
    AppTheme theme,
    String text,
    StackRouter router,
    int index,
    BuildContext context,
  ) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        if (userType == UserType.guest) {
          return showGuestInfo(theme, context);
        }
        router.popAndPush(
          DiscoverRoute(initialIndex: index),
        );
      },
      child: Chip(
        backgroundColor: theme.mode == ThemeMode.dark
            ? const Color(0x3d2a2b39)
            : MainColors.transparentGreen,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(
            color: Colors.transparent,
          ),
        ),
        label: PrimaryText(
          text,
          style: theme.textTheme.bodyMedium.copyWith(
            color: MainColors.primary,
          ),
        ),
      ),
    );
  }
}

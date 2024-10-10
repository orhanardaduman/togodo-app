import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';

class RandomUser extends HookConsumerWidget {
  const RandomUser({
    required this.data,
    super.key,
  });
  final List<UserSearchModel> data;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final theme = ref.watch(appThemeProvider);
    return SizedBox(
      width: context.sized.dynamicWidth(0.8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(
          top: 8,
          bottom: 8,
        ),
        child: Wrap(
          spacing: 12,
          children: data
              .map(
                (element) => GestureDetector(
                  onTap: () {
                    router.push(
                      UserProfileRoute(
                        userId: element.id!,
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomAvatarImage(
                        imageUrl: element.imageUrl,
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: 81,
                        child: PrimaryText(
                          element.name ?? '',
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: theme.textTheme.bodyLarge.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

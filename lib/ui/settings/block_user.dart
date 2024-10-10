import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/component/shimmer/comment_shimmer.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/ui/settings/view_model.dart/block_relations_view_model.dart';

@RoutePage()
class BlockUserPage extends HookConsumerWidget {
  const BlockUserPage({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final notifier = ref.watch(blockRelationsViewModelProvider.notifier);
    final users = ref.watch(
      blockRelationsViewModelProvider.select((value) {
        return value.blockRelations;
      }),
    );
    final loading = ref.watch(
      blockRelationsViewModelProvider.select((value) {
        return value.loading;
      }),
    );
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.settings,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 17.5),
            PrimaryText(
              l10n.blockedUser,
              style: theme.textTheme.bodyXLarge.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 23),
            PrimaryText(
              l10n.blockInfo,
              style: theme.textTheme.bodyMedium.copyWith(
                color: theme.appColors.secondText,
              ),
            ),
            const SizedBox(height: 32),
            if (loading)
              Column(
                children: List.generate(
                  4,
                  (index) => CommentShimmer(
                    isDark: theme.mode == ThemeMode.dark,
                  ),
                ),
              )
            else
              ListView.builder(
                itemCount: users.length,
                padding: const EdgeInsets.only(bottom: 32),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return body(
                    router,
                    users[index],
                    theme,
                    l10n,
                    notifier,
                    context,
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  Padding body(
    StackRouter router,
    UserSearchModel user,
    AppTheme theme,
    L10n l10n,
    BlockRelationsViewModel notifier,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: GestureDetector(
        onTap: () {
          router.push(
            UserProfileRoute(
              userId: user.id!,
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    router.push(
                      UserProfileRoute(
                        userId: user.id!,
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      CustomAvatarImage(
                        imageUrl: user.imageUrl,
                      ),
                      const SizedBox(width: 8),
                      SizedBox(
                        width: 173,
                        child: PrimaryText(
                          user.name ??
                              '', // Replace with actual user's username
                          style: theme.textTheme.bodyLarge.copyWith(
                            fontWeight: FontWeight.w700,
                            color: theme.appColors.text,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            TextButton(
              onPressed: () {
                showDialog<Dialog>(
                  context: context,
                  builder: (context) => Dialog(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    child: CustomModal(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(52),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          PrimaryText(
                            '🫂',
                            style: theme.textTheme.h1,
                          ),
                          SizedBox(
                            height: context.dyHeight(32),
                          ),
                          PrimaryText(
                            l10n.blockInfoPopup,
                            style: theme.textTheme.h4.copyWith(
                              color: theme.appColors.text,
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: context.dyHeight(32),
                          ),
                          CustomButton(
                            text: l10n.yes,
                            onPressed: () async {
                              await notifier.unblockRelation(user.id!);
                              Navigator.of(context).pop();
                            },
                            radius: 100,
                          ),
                          SizedBox(
                            height: context.dyHeight(12),
                          ),
                          CustomButton(
                            mode: ButtonMode.dark,
                            text: l10n.no,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            radius: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
                /*  user.isBlocked!
                    ? notifier.unblockRelation(user.id!)
                    : notifier.blockRelation(user.id!); */
              },
              child: PrimaryText(
                user.isBlocked! ? l10n.unblock : l10n.block,
                style: theme.textTheme.bodyMedium.copyWith(
                  color: theme.appColors.secondText,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}

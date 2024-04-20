import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
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
import 'package:togodo/ui/settings/view_model.dart/event_block_view_model.dart';

@RoutePage()
class EventBlockPage extends HookConsumerWidget {
  const EventBlockPage({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();

    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.settings,
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BlockUserItem(
              status: true,
            ), //Oluşturduğum etkinlikleri bu kullanıcıya gizledim
            BlockUserItem(
              status: false,
            ), // Katıldığım etkinlikleri bu kullanıcıya gizledim
          ],
        ),
      ),
    );
  }
}

class BlockUserItem extends StatefulHookConsumerWidget {
  const BlockUserItem({required this.status, super.key});
  final bool status;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BlockUserItemState();
}

class _BlockUserItemState extends ConsumerState<BlockUserItem> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(eventBlockViewModelProvider(widget.status).notifier).fetchData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final notifier =
        ref.watch(eventBlockViewModelProvider(widget.status).notifier);
    final users = ref.watch(
      eventBlockViewModelProvider(widget.status).select((value) {
        return value.data;
      }),
    );
    final loading = ref.watch(
      eventBlockViewModelProvider(widget.status).select((value) {
        return value.loading;
      }),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 17.5),
        if (widget.status)
          PrimaryText(
            l10n.eventHide,
            style: theme.textTheme.bodyXLarge.copyWith(
              color: theme.appColors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
        const SizedBox(height: 23),
        if (users.ext.isNullOrEmpty)
          const SizedBox.shrink()
        else
          PrimaryText(
            widget.status ? l10n.isEventBlockTrue : l10n.isEventBlockFalse,
            style: theme.textTheme.bodyMedium.copyWith(
              color: theme.appColors.secondText,
            ),
          ),
        const SizedBox(height: 32),
        if (loading)
          Column(
            children: List.generate(
              3,
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
    );
  }

  Padding body(
    StackRouter router,
    UserSearchModel user,
    AppTheme theme,
    L10n l10n,
    EventBlockViewModel notifier,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: GestureDetector(
        onTap: () {
          router.push(
            UserProfileRoute(
              userId: user.userId!,
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
                        userId: user.userId!,
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
                            '👀',
                            style: theme.textTheme.h1,
                          ),
                          SizedBox(
                            height: context.dyHeight(32),
                          ),
                          PrimaryText(
                            l10n.showPopupInfo,
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
                              await notifier.removeHiddenEvent(
                                user.id!,
                                status: widget.status,
                              );
                              await router.pop();
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
                              AutoRouter.of(context).pop();
                            },
                            radius: 100,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              child: PrimaryText(
                user.isHide! ? l10n.showActivities : l10n.hideActivities,
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

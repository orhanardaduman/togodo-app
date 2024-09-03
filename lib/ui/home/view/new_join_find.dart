// ignore_for_file: avoid_equals_and_hash_code_on_mutable_classes

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/home/view_model/evet_join_with_friends_view_model.dart';
import 'package:togodo/ui/profile/view/friends_search_page.dart';

class UserSearchParam {
  UserSearchParam(this.keyword, this.eventId);
  final String keyword;
  final String eventId;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is UserSearchParam &&
        other.keyword == keyword &&
        other.eventId == eventId;
  }

  @override
  int get hashCode => keyword.hashCode ^ eventId.hashCode;
}

final eventJoinSearchProvider =
    FutureProvider.autoDispose.family<List<UserSearchModel>?, UserSearchParam>(
  (ref, param) async {
    final model = ref
        .read(eventJoinedWithFriendsViewModelProvider(param.eventId).notifier);
    return model.getUserFriends(param.keyword);
  },
);

class NewJoinFindEvent extends StatefulHookConsumerWidget {
  const NewJoinFindEvent({
    required this.initialChildSize,
    required this.eventId,
    super.key,
  });
  final double initialChildSize;
  final String eventId;
  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _NewJoinFindEventState();
}

class _NewJoinFindEventState extends ConsumerState<NewJoinFindEvent> {
  final TextEditingController _keywordController = TextEditingController();
  @override
  void initState() {
    _keywordController.addListener(_onKeywordChanged);
    super.initState();
  }

  void _onKeywordChanged() {
    if (_keywordController.text.isNotEmpty) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: widget.initialChildSize,
      minChildSize: 0.3,
      builder: (_, controller) {
        return SingleChildScrollView(
          controller: controller,
          child: DragCustomModal(
            title: l10n.findNewUser,
            isCloseDivider: true,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 23),
            controller: controller,
            child: Column(
              children: [
                SearchField(keywordController: _keywordController, l10n: l10n),
                Divider(
                  color: theme.appColors.divider,
                  height: 48,
                ),
                UsersContent(
                  router: router,
                  theme: theme,
                  l10n: l10n,
                  keywordController: _keywordController,
                  eventId: widget.eventId,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    required this.keywordController,
    required this.l10n,
    super.key,
  });

  final TextEditingController keywordController;
  final L10n l10n;

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      label: l10n.search,
      controller: keywordController,
      textInputAction: TextInputAction.search,
      prefixIcon: Assets.icons.light.search.path,
    );
  }
}

class UsersContent extends HookConsumerWidget {
  const UsersContent({
    required this.router,
    required this.theme,
    required this.l10n,
    required this.keywordController,
    required this.eventId,
    super.key,
  });

  final StackRouter router;
  final AppTheme theme;
  final L10n l10n;
  final TextEditingController keywordController;
  final String eventId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print(keywordController.text);
    final userSearchFuture = ref.watch(
      eventJoinSearchProvider(
        UserSearchParam(keywordController.text, eventId),
      ),
    );

    return userSearchFuture.when(
      data: (users) => _buildUserList(users, theme, router),
      loading: Loading.new,
      error: (error, stack) => Text('Error: $error'),
    );
  }

  Widget _buildUserList(
    List<UserSearchModel>? users,
    AppTheme theme,
    StackRouter router,
  ) {
    if (users == null || users.isEmpty) {
      return const SizedBox.shrink();
    }
    return ListView.separated(
      itemCount: users.length,
      shrinkWrap: true,
      padding: const EdgeInsets.only(bottom: 24),
      itemBuilder: (context, index) => UserRow(
        user: users[index],
        eventId: eventId,
      ),
      separatorBuilder: (_, __) => const SizedBox(height: 24),
    );
  }
}

class UserRow extends StatefulHookConsumerWidget {
  const UserRow({
    required this.user,
    required this.eventId,
    super.key,
  });

  final UserSearchModel user;
  final String eventId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _UserRowState();
}

class _UserRowState extends ConsumerState<UserRow> {
  bool isInvitedStatus = false,
      invatedByOtherUser = false,
      invateHasStatus = false;
  @override
  void initState() {
    isInvitedStatus = widget.user.inviteStatus ?? false;
    invatedByOtherUser = widget.user.sendByOtherUser ?? false;
    invateHasStatus = widget.user.inviteStatusData ?? false;
    super.initState();
  }

  void inrementStatus() {
    setState(() {
      isInvitedStatus = !isInvitedStatus;
    });
  }

  void inrementStatusAccept() {
    setState(() {
      invateHasStatus = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final notifier = ref.watch(
      eventJoinedWithFriendsViewModelProvider(widget.eventId).notifier,
    );

    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    return Row(
      children: [
        Expanded(
          child: UserInfoWidget(
            user: widget.user,
            isExpanded: true,
          ),
        ),
        SizedBox(
          width: 130,
          height: 38,
          child: invateHasStatus
              ? CustomButton(
                  canter: true,
                  text: l10n.joinedTgother,
                  bgColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  style: theme.textTheme.bodyLarge.copyWith(
                    fontWeight: FontWeight.w500,
                    color: MainColors.primary,
                  ),
                  radius: 100,
                  side: const BorderSide(
                    color: MainColors.primary,
                  ),
                  onPressed: () {},
                )
              : invatedByOtherUser
                  ? CustomButton(
                      text: l10n.accept,
                      maxLines: 2,
                      bgColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      style: theme.textTheme.bodyLarge.copyWith(
                        fontWeight: FontWeight.w500,
                        color: MainColors.primary,
                      ),
                      radius: 100,
                      side: const BorderSide(
                        color: MainColors.primary,
                      ),
                      onPressed: () {
                        inrementStatusAccept();
                        notifier
                            .acceptInvate(widget.user.invateId ?? '', null)
                            .then((value) {
                          if (!value) {
                            inrementStatusAccept();
                            showToast(
                              context,
                              'Hata oluştu. Lütfen tekrar deneyin.',
                              type: AlertType.error,
                            );
                          }
                        });
                      },
                    )
                  : isInvitedStatus
                      ? CustomButton(
                          text: l10n.invited,
                          bgColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          style: theme.textTheme.bodyLarge.copyWith(
                            fontWeight: FontWeight.w500,
                            color: MainColors.primary,
                          ),
                          radius: 100,
                          side: const BorderSide(
                            color: MainColors.primary,
                          ),
                          onPressed: () {
                            inrementStatus();
                            notifier
                                .removeInviteToFriend(widget.user.id!)
                                .then((value) {
                              if (!value) {
                                inrementStatus();
                                showToast(
                                  context,
                                  'Hata oluştu. Lütfen tekrar deneyin.',
                                  type: AlertType.error,
                                );
                              }
                            });
                          },
                        )
                      : CustomButton(
                          text: l10n.withJoin,
                          radius: 100,
                          style: theme.textTheme.bodyLarge.copyWith(
                            fontWeight: FontWeight.w500,
                            color: MainColors.white,
                          ),
                          onPressed: () {
                            inrementStatus();
                            notifier
                                .createInviteToFriend(widget.user.id!)
                                .then((value) {
                              if (value) {
                              } else {
                                showToast(
                                  context,
                                  'Hata oluştu. Lütfen tekrar deneyin.',
                                  type: AlertType.error,
                                );
                              }
                            });
                          },
                        ),
        ),
      ],
    );
  }
}

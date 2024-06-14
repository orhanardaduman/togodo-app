// ignore_for_file: unnecessary_statements

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/input/custom_text_field.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/user_search_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/chat/services/post_service.dart';
import 'package:togodo/ui/chat/view_model/web_socket_notifier.dart';
import 'package:togodo/ui/profile/view/friends_search_page.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';

import '../../../core/enums/cache_items.dart';

final addUserSearchProvider = FutureProvider.autoDispose
    .family<List<UserSearchModel>?, String>((ref, keyword) async {
  final model = ref.watch(
    profilViewModelProvider(null).notifier,
  );

  return model.getUserFriends(keyword);
});

@RoutePage()
class AddGroupChatUserPage extends StatefulHookConsumerWidget {
  const AddGroupChatUserPage({required this.roomId, super.key});
  final String roomId;
  @override
  ConsumerState<StatefulHookConsumerWidget> createState() =>
      _AddGroupChatUserPageState();
}

class _AddGroupChatUserPageState extends ConsumerState<AddGroupChatUserPage> {
  final TextEditingController _keywordController = TextEditingController();
  PostService postService = PostService();
  @override
  void initState() {
    super.initState();
    _keywordController.addListener(_onKeywordChanged);
  }

  void _onKeywordChanged() {
    if (_keywordController.text.isNotEmpty) {
      setState(() {});
    }
  }

  void clearTextField() {
    _keywordController.clear();
  }

  @override
  void dispose() {
    _keywordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();

    return Scaffold(
      backgroundColor: theme.appColors.background,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar(
        title: l10n.addPerson,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                CustomTextField(
                  label: l10n.search,
                  controller: _keywordController,
                  prefixIcon: Assets.icons.light.search.path,
                ),
              ],
            ),
            const SizedBox(height: 12),
            usersContent(
              router,
              theme,
            ),
          ],
        ),
      ),
    );
  }

  Widget usersContent(
    StackRouter router,
    AppTheme theme,
  ) {
    return Consumer(
      builder: (context, ref, child) {
        final userSearchFuture =
            ref.watch(addUserSearchProvider(_keywordController.text));
        final notifier = ref.read(profilViewModelProvider(null).notifier);
        final notifierSocket = ref.watch(webSocketProvider.notifier);
        final model = ref
            .watch(
              profilViewModelProvider(null),
            )
            .friendsRequest;
        return userSearchFuture.when(
          data: (users) {
            return users != null && users.isNotEmpty
                ? ListView.separated(
                    itemCount: users.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final user = users[index];
                      final isModel = model!
                          .where((element) => element.id == user.id)
                          .first;
                      return Row(
                        children: [
                          SizedBox(
                            width: 250,
                            child: UserInfoWidget(
                              user: isModel,
                            ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () async {
                              isModel.isRequest ?? false
                                  ? null
                                  : await notifierSocket
                                      .addUserToGroupChat(
                                      widget.roomId,
                                      user.id!,
                                    )
                                      .then(
                                      (value) async {
                                        final token = await CacheItems.token
                                            .readSecureData();

                                        notifierSocket
                                            .closeAndOpenWebSocket(token);
                                        notifier.incrementChangeRequest(
                                          user.id!,
                                        );
                                      },
                                    );
                            },
                            child: isModel.isRequest ?? false
                                ? PrimaryText(
                                    'Eklendi',
                                    style: theme.textTheme.bodyMedium.copyWith(
                                      color: MainColors.primary,
                                      decoration: TextDecoration.underline,
                                    ),
                                  )
                                : PrimaryText(
                                    'Ekle',
                                    style: theme.textTheme.bodyMedium.copyWith(
                                      color: theme.appColors.secondText,
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(height: 32);
                    },
                  )
                : const SizedBox.shrink();
          },
          loading: () => const SizedBox.shrink(),
          error: (error, stack) => Text('Error: $error'),
        );
      },
    );
  }
}

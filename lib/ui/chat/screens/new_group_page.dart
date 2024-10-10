// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:simple_chips_input/simple_chips_input.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/component/custom_checkbox.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/chat/services/post_service.dart';
import 'package:togodo/ui/chat/view_model/web_socket_notifier.dart';
import 'package:togodo/ui/chat/widgets/custom_chips_input.dart';
import 'package:togodo/ui/profile/view/friends_search_page.dart';
import 'package:togodo/ui/profile/view_model/user_search_view_model.dart';

class CheckModel {
  const CheckModel({
    required this.id,
    required this.name,
    this.isCheck = false,
  });

  final String id;
  final String name;
  final bool isCheck;

  CheckModel copyWith({String? id, String? name, bool? isCheck}) {
    return CheckModel(
      id: id ?? this.id,
      name: name ?? this.name,
      isCheck: isCheck ?? this.isCheck,
    );
  }
}

@RoutePage()
class NewGroupPage extends StatefulHookConsumerWidget {
  const NewGroupPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NewGroupPageState();
}

class _NewGroupPageState extends ConsumerState<NewGroupPage> {
  final TextEditingController _keywordController = TextEditingController();
  TextEditingController nameTextController = TextEditingController();
  final Map<String, CheckModel> checkedUsers = {};
  String output = '';
  String? deletedChip;
  String? deletedChipIndex;
  final keySimpleChipsInput = GlobalKey<FormState>();
  final FocusNode focusNode = FocusNode();
  final FocusNode _focusName = FocusNode();
  final List<String> _chipsText = [];
  PostService postService = PostService();
  @override
  void initState() {
    nameTextController.addListener(() {
      setState(() {});
    });
    _keywordController.addListener(_onKeywordChanged);
    super.initState();
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
    nameTextController.dispose();
    _focusName.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final notifier = ref.watch(webSocketProvider.notifier);
    final model = ref.watch(webSocketProvider);

    return Scaffold(
      appBar: customAppBar(context, theme),
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          Stack(
            children: [
              SizedBox(
                height: context.sized
                    .dynamicHeight(context.isMediumScrn ? 0.82 : 0.715),
                child: ListView(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        PrimaryText(
                          l10n.friends,
                          style: theme.textTheme.bodyMedium.copyWith(
                            color: theme.appColors.text,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        CustomChipsInput(
                          separatorCharacter: ',',
                          focusNode: focusNode,
                          chipsText: _chipsText,
                          formKey: keySimpleChipsInput,
                          controller: _keywordController,
                          textFormFieldStyle: TextFormFieldStyle(
                            decoration: InputDecoration(
                              hintText: l10n.search,
                              hintStyle: theme.textTheme.bodyMedium.copyWith(
                                color: theme.appColors.secondText,
                                fontWeight: FontWeight.bold,
                              ),
                              border: InputBorder.none,
                            ),
                          ),
                          onChipAdded: (p0) {
                            setState(() {
                              output = p0;
                            });
                          },
                          onChipDeleted: (p0, p1) {
                            setState(() {
                              deletedChip = p0;
                              deletedChipIndex = p1.toString();
                              String? userIdToDelete;
                              for (final entry in checkedUsers.entries) {
                                if (entry.value.name == p0) {
                                  userIdToDelete = entry.key;
                                  break; // Eşleşen ilk kullanıcıyı bulduktan sonra döngüden çık
                                }
                              }

                              if (userIdToDelete != null) {
                                // isCheck durumunu false olarak güncelle
                                checkedUsers.update(
                                  userIdToDelete,
                                  (value) => value.copyWith(isCheck: false),
                                );
                              }
                            });
                          },
                          onSubmitted: (p0) {
                            setState(() {
                              output = p0;
                            });
                          },
                          onSaved: (p0) {
                            setState(() {
                              output = p0;
                            });
                          },
                          chipTextStyle: const TextStyle(
                            color: MainColors.primary,
                            fontSize: 14,
                          ),
                          deleteIcon: const Icon(
                            Icons.clear,
                            size: 12,
                          ),
                          chipContainerDecoration: BoxDecoration(
                            color: const Color(0xff2A2B39).withOpacity(0.24),
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        const SizedBox(height: 12),
                        /*   CustomTextField(
                          label: l10n.search,
                          controller: _keywordController,
                          prefixIcon: Assets.icons.light.search.path,
                        ), */
                        const SizedBox(height: 12),
                        usersContent(router, theme, l10n),
                      ],
                    ),
                  ],
                ),
              ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 50),
                left: 0,
                right: 0,
                bottom: MediaQuery.of(context).viewInsets.bottom,
                child: Container(
                  decoration: const BoxDecoration().buttonShadow,
                  child: CustomButton(
                    text: l10n.createGroup,
                    onPressed: () {
                      if (nameTextController.text.isEmpty) {
                        _focusName.requestFocus();
                        showToast(
                          context,
                          l10n.enterGroupName,
                          gravity: ToastGravity.TOP,
                          type: AlertType.error,
                        );
                      } else {
                        if (!model.loading) {
                          notifier
                              .createChatRoomWithGroup(
                            nameTextController.text,
                            checkedUsers.keys.toList(),
                          )
                              .then((value) {
                            if (value) {
                              Navigator.of(context).pop();
                            }
                          });
                        }
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  AppBar customAppBar(BuildContext context, AppTheme theme) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      leading: InkWell(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20), // Sol boşluk
          child: Assets.icons.lightOutline.arrowLeft.svg(
            width: 28,
            height: 28,
            color: theme.appColors.text,
          ),
        ),
      ),
      title: SizedBox(
        width: 180,
        child: TextField(
          textAlign: TextAlign.center,
          controller: nameTextController,
          focusNode: _focusName,
          decoration: InputDecoration(
            hintText: 'Gruba İsim Ver',
            hintStyle: theme.textTheme.bodyXLarge.copyWith(
              color: theme.appColors.secondText,
            ),
            border: InputBorder.none,
            suffixIcon: nameTextController.text.isNotEmpty
                ? GestureDetector(
                    onTap: nameTextController.clear,
                    child: Padding(
                      padding: const EdgeInsets.all(18),
                      child: Assets.icons.bold.close.svg(
                        color: theme.appColors.text,
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }

  Widget usersContent(StackRouter router, AppTheme theme, L10n l10n) {
    return Consumer(
      builder: (context, ref, child) {
        final userSearchFuture = ref.watch(
          userSearchProvider(
            UserSearchParam(
              keyword: _keywordController.text,
            ),
          ),
        );
        return userSearchFuture.when(
          data: (users) {
            return users != null && users.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PrimaryText(
                        l10n.suggestions,
                        style: theme.textTheme.bodyMedium.copyWith(
                          color: theme.appColors.text,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ListView.separated(
                        itemCount: users.length,
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.only(bottom: 24),
                        itemBuilder: (context, index) {
                          final user = users[index];
                          // CheckModel kullanarak CheckBox'ın işaretli olup olmadığını kontrol et.
                          final checkModel = checkedUsers[user.id] ??
                              CheckModel(
                                id: user.id!,
                                name: user.name!,
                              );

                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            splashColor: Colors.transparent,
                            leading: SizedBox(
                              width: context.dyWidth(240),
                              child: UserInfoWidget(user: user, isRoute: false),
                            ),
                            trailing: CustomCheckBox(
                              isVal: checkModel.isCheck,
                              onTap: () {
                                setState(() {
                                  // CheckModel güncellemesi
                                  final newCheckModel = checkModel.copyWith(
                                    isCheck: !checkModel.isCheck,
                                  );
                                  checkedUsers[user.id!] = newCheckModel;

                                  if (newCheckModel.isCheck) {
                                    _chipsText.add(user.name!);
                                  } else {
                                    _chipsText.remove(user.name);
                                  }
                                });
                              },
                            ),
                            onTap: () {
                              setState(() {
                                // CheckModel güncellemesi
                                final newCheckModel = checkModel.copyWith(
                                  isCheck: !checkModel.isCheck,
                                );
                                checkedUsers[user.id!] = newCheckModel;

                                if (newCheckModel.isCheck) {
                                  _chipsText.add(user.name!);
                                } else {
                                  _chipsText.remove(user.name);
                                }
                              });
                            },
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            height: 24,
                          );
                        },
                      ),
                    ],
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

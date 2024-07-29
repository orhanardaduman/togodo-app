import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/ui/profile/widget/add_account_view.dart';

import '../../../core/component/primary_text.dart';
import '../../../core/enums/cache_items.dart';
import '../../../core/helpers/colors/colors.dart';
import '../../../core/hook/use_l10n.dart';
import '../../../core/hook/use_router.dart';
import '../../../core/theme/app_text_theme.dart';
import '../../auth/viewmodel/user_view_model.dart';
import '../../chat/view_model/web_socket_notifier.dart';
import '../view_model/saved_profiles_view_model.dart';

class AccountsView extends StatefulHookConsumerWidget {
  const AccountsView({super.key});

  @override
  ConsumerState<AccountsView> createState() => _AccountsViewState();
}

class _AccountsViewState extends ConsumerState<AccountsView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(savedProfilesViewModelProvider("").notifier).fetchProfiles();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final data = ref.watch(savedProfilesViewModelProvider(''));
    final userModel = ref.watch(userViewModelProvider).tokenModel;
    final router = useRouter();

    return Container(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: DraggableScrollableSheet(
        initialChildSize: 0.3,
        minChildSize: 0.3,
        maxChildSize: 0.6,
        expand: false,
        builder: (BuildContext context, ScrollController scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: 38,
                  height: 3,
                  color: Color(0xFFFE0E0E0),
                ),
                const SizedBox(
                  height: 10,
                ),
                PrimaryText(
                  l10n.changeAccount,
                  style: AppTextTheme().h4.copyWith(
                        color: Colors.white,
                      ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .9,
                  height: 1,
                  color: Color(0xFFF35383F),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (data.loading)
                  const SizedBox()
                else
                  Column(
                    children: data.users
                        .map(
                          (e) => GestureDetector(
                            onTap: () async {
                              ref
                                  .read(webSocketProvider.notifier)
                                  .closeWebSocket();
                              await GoogleSignIn().signOut();
                              final firebaseAuth = FirebaseAuth.instance;
                              await firebaseAuth.signOut();
                              await CacheItems.uid.writeSecureData(e.id ?? '');
                              await CacheItems.firebaseId
                                  .writeSecureData(e.firebaseId ?? '');

                              await CacheItems.token
                                  .writeSecureData(e.token ?? '');
                              await router.pushAndPopUntil(
                                const SplashViewRoute(),
                                predicate: (route) => false,
                              );
                            },
                            child: Container(
                              margin: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                children: [
                                  Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                        16,
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          e.pp ?? '',
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: PrimaryText(
                                        "@${e.name ?? ''}",
                                        style:
                                            AppTextTheme().bodyXLarge.copyWith(
                                                  fontWeight: FontWeight.w700,
                                                ),
                                      ),
                                    ),
                                  ),
                                  if (userModel?.userId == e.id)
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: MainColors.primary,
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                      ),
                                      child: const Center(
                                        child: Icon(
                                          Icons.check,
                                          color: MainColors.dark2,
                                          size: 10,
                                        ),
                                      ),
                                    )
                                ],
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    showModalBottomSheet(
                      backgroundColor: MainColors.dark2,
                      elevation: 0,
                      shape: const RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(15)),
                      ),
                      isScrollControlled: true,
                      context: context,
                      builder: (context) {
                        return const AddAccountView();
                      },
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: MainColors.dark3,
                            borderRadius: BorderRadius.circular(
                              16,
                            ),
                          ),
                          child: Center(
                            child: Container(
                              width: 23,
                              height: 23,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    color: MainColors.dark3,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: PrimaryText(
                              l10n.addTogodoAccount,
                              style: AppTextTheme().bodyXLarge.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/chat/screens/group_tab.dart';
import 'package:togodo/ui/chat/screens/person_tab.dart';
import 'package:togodo/ui/chat/view_model/web_socket_notifier.dart';
import 'package:togodo/ui/chat/widgets/index.dart';

import '../../../core/enums/cache_items.dart';

@RoutePage()
class ChatHomePage extends StatefulHookConsumerWidget {
  const ChatHomePage({
    super.key,
    this.isNotificationRoute = false,
    this.isBackButton = true,
  });
  final bool isNotificationRoute;
  final bool isBackButton;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatHomePageState();
}

class _ChatHomePageState extends ConsumerState<ChatHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool deneme = false;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    refreshData();

    super.initState();
  }

  refreshData() async {
    final token = await CacheItems.token.readSecureData();
    await ref.read(webSocketProvider.notifier).refreshData();

    await ref.read(webSocketProvider.notifier).connect(token: token);
    await Future.delayed(const Duration(milliseconds: 200));
    setState(() {
      deneme = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    return Scaffold(
      body: FlatPageWrapper(
        scrollType: ScrollType.chatPage,
        onRefresh: () async {
          final token = await CacheItems.token.readSecureData();

          ref.read(webSocketProvider.notifier).closeAndOpenWebSocket(token);
        },
        backgroundColor: theme.appColors.background,
        header: ChatAppbar(theme: theme, widget: widget, router: router),
        children: [
          if (deneme)
            SizedBox(
              height: context.sized.height,
              child: NestedScrollView(
                physics: const NeverScrollableScrollPhysics(),
                headerSliverBuilder:
                    (BuildContext context, bool boxIsScrolled) {
                  return <Widget>[
                    SliverList(
                      delegate: SliverChildListDelegate([
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: TabBar(
                            controller: _tabController,
                            labelColor: MainColors.primary,
                            indicator: TabIndicator(),
                            indicatorSize: TabBarIndicatorSize.tab,
                            unselectedLabelColor: MainColors.dark3,
                            labelStyle: theme.textTheme.bodyXLarge.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                            tabs: [
                              Tab(
                                text: l10n.people,
                              ),
                              Tab(
                                text: l10n.groups,
                              ),
                            ],
                          ),
                        ),
                      ]),
                    ),
                  ];
                },
                body: TabBarView(
                  controller: _tabController,
                  children: [
                    TabFirst(theme: theme, router: router),
                    TabSecond(theme: theme, router: router),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

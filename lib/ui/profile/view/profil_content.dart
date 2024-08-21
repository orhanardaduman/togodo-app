// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/index.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/ui/profile/view/tab_created_events.dart';
import 'package:togodo/ui/profile/view/tab_events.dart';
import 'package:togodo/ui/profile/view/tab_events_draft.dart';
import 'package:togodo/ui/profile/view/tab_events_joined.dart';
import 'package:togodo/ui/profile/view/tab_events_request.dart';
import 'package:togodo/ui/profile/widget/block_container.dart';
import 'package:togodo/ui/profile/widget/index.dart';

class ProfilContent extends HookConsumerWidget {
  const ProfilContent({
    required this.data,
    required this.tabController,
    super.key,
    this.userId,
    this.controller,
  });
  final ProfilModel? data;
  final String? userId;
  final TabController tabController;
  final ScrollController? controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    // Oluşturulan etkinliklerin gösterilip gösterilmeyeceğini kontrol eder
    final showCreatedEvents = data!.isCurrentUser!
        ? true // Mevcut kullanıcı için her zaman göster
        : data!
            .isHideEventCreatedUserToCurrentUser!; // Diğer kullanıcı için koşula bağlı göster

// Katıldığım etkinliklerin gösterilip gösterilmeyeceğini kontrol eder
    final showJoinedEvents = data!.isCurrentUser!
        ? true // Mevcut kullanıcı için her zaman göster
        : data!
            .isHideEventJoinedUserToCurrentUser!; // Diğer kullanıcı için koşula bağlı göster

    return data != null &&
            (data!.isBlockedCurrentUserToUser! ||
                data!.isBlockedUserToCurrentUser!)
        ? ListView(
            children: [
              if (data!.isBlockedUserToCurrentUser!)
                BlockedUserToCurrentUserWidget(
                  theme: theme,
                  l10n: l10n,
                  userId: userId!,
                )
              else
                titleWidget(context, data),
              BlockContainerWidget(
                theme: theme,
                l10n: l10n,
                userId: userId!,
                isUserBlock: data!.isBlockedCurrentUserToUser!,
              ),
            ],
          )
        : NestedScrollView(
            physics: const BouncingScrollPhysics(),
            controller: controller,
            headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
              return <Widget>[
                SliverToBoxAdapter(
                  child: titleWidget(context, data),
                ),
                if (data != null)
                  SliverList(
                    delegate: SliverChildListDelegate([
                      const SizedBox(
                        height: 20,
                      ),
                      TabBar(
                        controller: tabController,
                        labelColor: MainColors.primary,
                        indicator: TabIndicator(),
                        unselectedLabelColor: MainColors.dark3,
                        labelStyle: theme.textTheme.bodyMedium.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                        tabs: userId != null
                            ? [
                                Tab(
                                  text: data?.type == 1
                                      ? l10n.comingEvents
                                      : l10n.eventsTab,
                                ),
                                Tab(
                                  text: data?.type == 1
                                      ? l10n.pastEvents
                                      : l10n.created,
                                ),
                              ]
                            : [
                                Tab(
                                  text: l10n.eventsTab,
                                ),
                                Tab(
                                  text: l10n.requestsTab,
                                ),
                                Tab(
                                  text: l10n.created,
                                ),
                              ],
                      ),
                    ]),
                  ),
              ];
            },
            body: data != null
                ? TabBarView(
                    controller: tabController,
                    children: userId != null
                        ? [
                            if (showJoinedEvents)
                              data?.type == 1
                                  ? TabEventsView(
                                      userId: userId,
                                      isCurrentUser:
                                          data?.isCurrentUser ?? false,
                                    )
                                  : TabEventsJoinedView(
                                      userId: userId,
                                    )
                            else
                              NullEventWidget(
                                theme: theme,
                                userId: userId,
                                userName: data?.name ?? '',
                                l10n: l10n,
                                isCurrentUser: data?.isCurrentUser ?? false,
                              ),
                            if (showCreatedEvents)
                              TabCreatedEventsView(
                                userId: userId,
                                isCurrentUser: data?.isCurrentUser ?? false,
                              )
                            else
                              NullEventWidget(
                                theme: theme,
                                userId: userId,
                                userName: data?.name ?? '',
                                l10n: l10n,
                                isCurrentUser: data?.isCurrentUser ?? false,
                              ),
                          ]
                        : [
                            TabEventsView(
                              isCurrentUser: data?.isCurrentUser ?? false,
                            ),
                            TabEventsRequestView(
                              isCurrentUser: data?.isCurrentUser ?? false,
                            ),
                            const TabEventsDraftView(),
                          ],
                  )
                : NullEventWidget(
                    theme: theme,
                    userId: userId,
                    userName: data?.name ?? '',
                    userType: data?.type,
                    l10n: l10n,
                    isCurrentUser: data?.isCurrentUser ?? false,
                  ),
          );
  }

  Stack titleWidget(BuildContext context, ProfilModel? data) {
    return Stack(
      children: [
        SlideProfilImage(
          images: data?.images,
          userId: userId,
          currentUserID: data?.id,
          userTag: data?.userName,
          isFriends: data?.isFriend ?? false,
          isFollow: data?.isFollowed ?? false,
          isBlock: data?.isBlockedCurrentUserToUser ?? false,
          type: data?.type ?? 0,
          isHiddenEvent: data?.isHideEventCurrentUserToUser ?? false,
        ),
        Container(
          margin: EdgeInsets.only(
            top: context.sized.dynamicHeight(0.3),
          ),
          child: UserProfileCard(
            data: data,
            userId: userId,
          ),
        ),
      ],
    );
  }
}

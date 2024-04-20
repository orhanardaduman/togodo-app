import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_event_card.dart';
import 'package:togodo/core/component/custom_refresher.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/event/create_event_page.dart';
import 'package:togodo/ui/profile/view_model/tab_draft_event_view_model.dart';
import 'package:togodo/ui/profile/widget/block_container.dart';

class TabEventsDraftView extends StatefulHookConsumerWidget {
  const TabEventsDraftView({super.key, this.userId});
  final String? userId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TabEventsDraftViewState();
}

class _TabEventsDraftViewState extends ConsumerState<TabEventsDraftView> {
  final RefreshController _refreshController = RefreshController();
  @override
  void dispose() {
    _refreshController.dispose();

    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(tabEventsDraftViewModelProvider(widget.userId).notifier)
          .fetchEvents();
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(tabEventsDraftViewModelProvider(widget.userId));
    final notifier =
        ref.watch(tabEventsDraftViewModelProvider(widget.userId).notifier);
    final router = useRouter();
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    // homeViewModel.data içerisinde verilerinizi bulabilirsiniz.
    return data.loading
        ? const SizedBox.shrink()
        : CustomRefresher(
            controller: _refreshController,
            onRefresh: () async => notifier.fetchEvents(),
            onLoading: () async => notifier.fetchMoreEvents(),
            enablePullUp: true,
            child: data.events.ext.isNullOrEmpty
                ? Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 35,
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        EmptyContainer(theme: theme),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            PrimaryText(
                              l10n.creatNewEvent,
                              style: theme.textTheme.h5.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            const SizedBox(height: 20),
                            SizedBox(
                              width: context.sized.dynamicWidth(0.7),
                              child: PrimaryText(
                                l10n.eventDetailInfo,
                                textAlign: TextAlign.center,
                                style: theme.textTheme.bodyMedium.copyWith(
                                  color: theme.mode == ThemeMode.dark
                                      ? MainColors.grey500
                                      : MainColors.grey700,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30),
                            Container(
                              width: 176,
                              height: 45,
                              decoration: const BoxDecoration().buttonShadow,
                              child: CustomButton(
                                radius: 100,
                                text: l10n.eventCreateButton,
                                style: theme.textTheme.bodyXLarge.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: MainColors.white,
                                ),
                                onPressed: () {
                                  showMaterialModalBottomSheet<CreateEventPage>(
                                    context: context,
                                    enableDrag: false,
                                    builder: (BuildContext context) {
                                      // Burada yeni post ekleme formunuzu oluşturun
                                      return CreateEventPage(
                                        isProfil: true,
                                        userId: widget.userId,
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Yan yana iki öğe olacak
                      crossAxisSpacing: 18, // Yatay aralık
                      mainAxisSpacing: 16, // Dikey aralık
                      childAspectRatio:
                          189 / 302, // Öğelerin genişlik/yükseklik oranı
                    ),
                    padding: const EdgeInsets.only(
                      left: 24,
                      right: 24,
                      top: 24,
                      bottom: 100,
                    ),
                    itemCount: data.events.length,
                    itemBuilder: (context, index) {
                      final event = data.events[index];
                      return GestureDetector(
                        onTap: () {
                          if (event.isPublish!) {
                            router.push(
                              EventDetailsRoute(eventId: event.id!),
                            );
                          } else {
                            showMaterialModalBottomSheet<CreateEventPage>(
                              context: context,
                              enableDrag: false,
                              builder: (BuildContext context) {
                                // Burada yeni post ekleme formunuzu oluşturun
                                return CreateEventPage(
                                  isDraft: true,
                                  eventId: event.id,
                                  isProfil: true,
                                  userId: widget.userId,
                                );
                              },
                            );
                          }
                        },
                        child: event.isPublish!
                            ? EnventCards(
                                isShowRating: true,
                                data: event,
                              )
                            : InkWell(
                                onTap: () {
                                  showMaterialModalBottomSheet<CreateEventPage>(
                                    context: context,
                                    enableDrag: false,
                                    builder: (BuildContext context) {
                                      // Burada yeni post ekleme formunuzu oluşturun
                                      return CreateEventPage(
                                        isDraft: true,
                                        eventId: event.id,
                                        isProfil: true,
                                        userId: widget.userId,
                                      );
                                    },
                                  );
                                },
                                child: SizedBox(
                                  width: 189,
                                  height: 302,
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      ClipRRect(
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(28),
                                        ),
                                        child: CachedNetworkImage(
                                          imageUrl: event.imageUrl ?? '',
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        width: 189,
                                        height: 302,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFF1B1D23)
                                              .withOpacity(0.7),
                                        ),
                                        child: PrimaryText(
                                          l10n.draftsTab,
                                          style: theme.textTheme.bodyXLarge
                                              .copyWith(
                                            color: theme.appColors.text,
                                            fontWeight: FontWeight.w700,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      );
                    },
                  ),
          );
  }
}

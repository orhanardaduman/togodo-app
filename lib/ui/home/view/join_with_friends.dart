import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_friend_invite_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/home/view/new_join_find.dart';
import 'package:togodo/ui/home/view_model/evet_join_with_friends_view_model.dart';
import 'package:togodo/ui/home/widget/ticket_info_popup.dart';

@RoutePage()
class JoinWithFriendsPage extends StatefulHookConsumerWidget {
  const JoinWithFriendsPage({
    required this.eventId,
    this.ticketUrl,
    super.key,
  });
  final String eventId;
  final String? ticketUrl;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _JoinWithFriendsPageState();
}

class _JoinWithFriendsPageState extends ConsumerState<JoinWithFriendsPage> {
  bool _isList = false;
  final SwiperController _swiperController = SwiperController();

  @override
  void dispose() {
    _swiperController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    print("ticket url ${widget.ticketUrl}");
    if (widget.ticketUrl != null && widget.ticketUrl != "") {
      Future.delayed(const Duration(milliseconds: 2000), () {
        showTicketInfo(
          ref.watch(appThemeProvider),
          context,
          L10n.of(context)!,
          widget.ticketUrl ?? '',
        );
      });
    }
    super.initState();
  }

  double _calculateInitialChildSize(List<EventFriendInviteModel> datas) {
    if (datas.isEmpty) return 0.47; // Varsayılan boyut
    if (_isList) {
      // Listeye göre boyut hesaplaması
      return datas.length == 1
          ? 0.8
          : datas.length == 2
              ? 0.7
              : 0.47;
    } else {
      // Grid'e göre boyut hesaplaması
      return 0.47;
    }
  }

  bool isInvitedStatus = false;
  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final notifier = ref.read(
      eventJoinedWithFriendsViewModelProvider(widget.eventId).notifier,
    );
    final model = ref.watch(
      eventJoinedWithFriendsViewModelProvider(widget.eventId),
    );

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: CustomAppBar(
          title: l10n.joinedUsers,
        ),
        body: model.loading
            ? const Loading()
            : Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  if (model.events.isEmpty) nullContainer(theme, context, l10n),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (model.events.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.all(24),
                          child: PrimaryText(
                            l10n.joinedInfo(model.events.length),
                            style: theme.textTheme.bodyXLarge.copyWith(
                              color: theme.appColors.text,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      if (!_isList)
                        SizedBox(
                          height: context.sized.dynamicHeight(0.36),
                          child: Swiper(
                            loop: false,
                            itemBuilder: (BuildContext context, int index) {
                              final isMainItem = index ==
                                  _swiperController
                                      .index; // Şu anda aktif olan öğe mi?
                              log('index: ${_swiperController.index}');
                              return Stack(
                                alignment: Alignment.topCenter,
                                children: [
                                  Container(
                                    height: isMainItem ? 320 : 320,
                                    width: isMainItem ? 320 : 320,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          model.events[index].imageUrl!,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius:
                                          BorderRadius.circular(106.67),
                                      color: MainColors.transparentBlue,
                                      border: Border.all(
                                        color: MainColors.primary,
                                        width: isMainItem ? 4 : 2,
                                      ),
                                    ).addCustomShadow(
                                      color: MainColors.transparentBlue,
                                      offsetY: 20,
                                      offsetX: 12,
                                      blurRadius: 24,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    child: Container(
                                      height: 45,
                                      width: 183,
                                      decoration:
                                          const BoxDecoration().addCustomShadow(
                                        color: MainColors.transparentBlue,
                                        offsetY: 4,
                                        offsetX: 8,
                                        blurRadius: 24,
                                      ),
                                      child: model.events[index]
                                                  .inviteStatusData ??
                                              false
                                          ? CustomButton(
                                              text: l10n.joinedTgother,
                                              radius: 100,
                                              canter: true,
                                              onPressed: () {},
                                            )
                                          : model.events[index]
                                                      .sendByOtherUser ??
                                                  false
                                              ? CustomButton(
                                                  text: l10n.accept,
                                                  radius: 100,
                                                  onPressed: () {
                                                    notifier
                                                        .acceptInvate(
                                                            model.events[index]
                                                                    .invateId ??
                                                                '',
                                                            model.events[index]
                                                                .id)
                                                        .then((value) {
                                                      if (value) {
                                                        //  inrementStatus();
                                                      } else {
                                                        showToast(
                                                          context,
                                                          'Hata oluştu. Lütfen tekrar deneyin.',
                                                          type: AlertType.error,
                                                        );
                                                      }
                                                    });
                                                  },
                                                )
                                              : model.events[index]
                                                          .inviteStatus ??
                                                      false
                                                  ? CustomButton(
                                                      text: l10n.toRequest(
                                                        model.events[index]
                                                                .name ??
                                                            '',
                                                      ),
                                                      radius: 100,
                                                      onPressed: () {
                                                        notifier
                                                            .removeInviteToFriend(
                                                          model.events[index]
                                                              .id!,
                                                        )
                                                            .then((value) {
                                                          if (value) {
                                                            //  inrementStatus();
                                                          } else {
                                                            showToast(
                                                              context,
                                                              'Hata oluştu. Lütfen tekrar deneyin.',
                                                              type: AlertType
                                                                  .error,
                                                            );
                                                          }
                                                        });
                                                      },
                                                    )
                                                  : CustomButton(
                                                      text: l10n.withJoins(
                                                        model.events[index]
                                                                .name ??
                                                            '',
                                                      ),
                                                      radius: 100,
                                                      onPressed: () {
                                                        notifier
                                                            .createInviteToFriend(
                                                          model.events[index]
                                                              .id!,
                                                        )
                                                            .then((value) {
                                                          if (value) {
                                                            //  inrementStatus();
                                                          } else {
                                                            showToast(
                                                              context,
                                                              'Hata oluştu. Lütfen tekrar deneyin.',
                                                              type: AlertType
                                                                  .error,
                                                            );
                                                          }
                                                        });
                                                      },
                                                    ),
                                    ),
                                  ),
                                ],
                              );
                            },
                            onIndexChanged: (index) {
                              if (kDebugMode) {
                                print('Current index: $index');
                              }
                            },
                            itemCount: model.events.length,
                            viewportFraction: 0.77,
                            scale: 0.9,
                            controller:
                                _swiperController, // SwiperController'ı tanımla ve atama yap
                          ),
                        )
                      else
                        ListView.builder(
                          itemCount: model.events.length,
                          padding: const EdgeInsets.all(24),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return listBody(
                              router,
                              model.events[index],
                              theme,
                              l10n,
                              notifier,
                              context,
                            );
                          },
                        ),
                    ],
                  ),
                  NewJoinFindEvent(
                    // Yeni katılanları bulma sayfası
                    initialChildSize: _calculateInitialChildSize(model.events),
                    eventId: widget.eventId,
                  ),
                  if (model.events.isNotEmpty)
                    Positioned(
                      bottom: 82,
                      child: Container(
                        width: 136,
                        height: 45,
                        decoration: const BoxDecoration().addCustomShadow(
                          color: MainColors.black.withOpacity(0.7),
                          offsetY: 4,
                          offsetX: 4,
                          blurRadius: 32,
                        ),
                        child: CustomButton(
                          text: _isList ? l10n.scroll : l10n.list,
                          leftIcon: _isList
                              ? Assets.icons.bold.icRoundViewCarousel.path
                              : Assets.icons.bold.phListBold.path,
                          mode: ButtonMode.dark,
                          radius: 100,
                          onPressed: () {
                            setState(() {
                              _isList = !_isList;
                            });
                          },
                        ),
                      ),
                    ),
                ],
              ),
      ),
    );
  }

  Positioned nullContainer(AppTheme theme, BuildContext context, L10n l10n) {
    return Positioned(
      top: 22,
      child: Column(
        children: [
          PrimaryText(
            l10n.firstJoined,
            style: theme.textTheme.h3.copyWith(
              color: theme.appColors.text,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            width: context.sized.width,
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: PrimaryText(
              l10n.firstJoinedInfo,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20),
          if (theme.mode == ThemeMode.dark)
            Assets.images.dark.eventPeopleDark.svg(
              fit: BoxFit.cover,
            )
          else
            Assets.images.light.eventPeopleLight.svg(
              fit: BoxFit.cover,
            ),
        ],
      ),
    );
  }

  Padding listBody(
    StackRouter router,
    EventFriendInviteModel data,
    AppTheme theme,
    L10n l10n,
    EventJoinedWithFriendsViewModel notifier,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 32),
      child: GestureDetector(
        onTap: () {
          router.push(
            UserProfileRoute(
              userId: data.id!,
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
                        userId: data.id!,
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      CustomAvatarImage(
                        imageUrl: data.imageUrl,
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: context.sized.dynamicWidth(0.41),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            PrimaryText(
                              data.name ??
                                  '', // Replace with actual user's username
                              style: theme.textTheme.bodyLarge.copyWith(
                                fontWeight: FontWeight.w700,
                                color: theme.appColors.text,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            if (data.title != null)
                              PrimaryText(
                                data.title!,
                                style: theme.textTheme.bodySmall.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: MainColors.grey600,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Spacer(),
            InviteButtonWidget(
              data: data,
              eventId: widget.eventId,
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}

class InviteButtonWidget extends HookConsumerWidget {
  const InviteButtonWidget({
    required this.data,
    required this.eventId,
    super.key,
  });
  final EventSearchProperties data;
  final String eventId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final notifier = ref.watch(
      eventJoinedWithFriendsViewModelProvider(eventId).notifier,
    );

    return SizedBox(
      width: 130,
      height: 38,
      child: data.inviteStatusData ?? false
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
                width: 2,
              ),
              onPressed: () {},
            )
          : data.sendByOtherUser ?? false
              ? CustomButton(
                  text: l10n.accept,
                  bgColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  style: theme.textTheme.bodyLarge.copyWith(
                    fontWeight: FontWeight.w500,
                    color: MainColors.primary,
                  ),
                  radius: 100,
                  side: const BorderSide(
                    color: MainColors.primary,
                    width: 2,
                  ),
                  onPressed: () {
                    notifier
                        .acceptInvate(data.invateId ?? '', eventId)
                        .then((value) {
                      if (value) {
                        showToast(context, 'Başarılı');
                      } else {
                        showToast(
                          context,
                          'Hata oluştu. Lütfen tekrar deneyin.',
                          type: AlertType.error,
                        );
                      }
                    });
                  },
                )
              : data.inviteStatus ?? false
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
                        width: 2,
                      ),
                      onPressed: () {
                        notifier.removeInviteToFriend(data.id!).then((value) {
                          if (value) {
                            showToast(context, 'Başarılı');
                          } else {
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
                        notifier.createInviteToFriend(data.id!).then((value) {
                          if (value) {
                            showToast(context, 'Başarılı');
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
    );
  }
}

import 'package:blur/blur.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/ui/home/view_model/quiz_view_model.dart';

class EventSuggestions extends HookConsumerWidget {
  const EventSuggestions({
    required this.item,
    required this.controller,
    super.key,
  });
  final EventModel item;
  final SwiperController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizModel = ref.watch(quizViewModelProvider(item.id!)).data;
    final notifier = ref.read(quizViewModelProvider(item.id!).notifier);
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    /*   if (quizModel.isEmpty) {
      controller.next();
    } */
    return Stack(
      alignment: Alignment.center,
      children: [
        Blur(
          blur: 10,
          blurColor: Colors.black.withOpacity(0.5),
          child: Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: item.imageUrl!,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => CachedNetworkImage(
                imageUrl:
                    'https://api.togodo.xyz/resource/event-image/togodo-combination-logo-dark.png',
                fit: BoxFit.contain,
                errorWidget: (context, url, error) => const SizedBox.shrink(),
              ),
            ),
          ),
        ),
        Positioned(
          top: context.sized.dynamicHeight(0.15),
          child: Column(
            children: [
              SizedBox(
                width: context.sized.dynamicWidth(0.6),
                child: PrimaryText(
                  item.name ?? '',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.h5.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: context.sized.dynamicWidth(0.6),
                child: PrimaryText(
                  textAlign: TextAlign.center,
                  l10n.quizTitle,
                  style: theme.textTheme.h4.copyWith(color: Colors.white),
                ),
              ),
              const SizedBox(height: 32),
              Wrap(
                children: quizModel
                    .map(
                      (e) => Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            height: 320,
                            width: 320,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  e.imageUrl!,
                                ),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(106.67),
                              color: MainColors.transparentBlue,
                              border: Border.all(
                                color: MainColors.primary,
                                width: 2,
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
                              decoration: const BoxDecoration().addCustomShadow(
                                color: MainColors.transparentBlue,
                                offsetY: 4,
                                offsetX: 8,
                                blurRadius: 24,
                              ),
                              child: e.inviteStatus ?? false
                                  ? CustomButton(
                                      text: '${e.name} davet edildi',
                                      radius: 100,
                                      onPressed: () {
                                        notifier
                                            .removeInviteToFriend(
                                          e.id!,
                                        )
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
                                  : CustomButton(
                                      text: '${e.name} ile Katıl',
                                      radius: 100,
                                      onPressed: () {
                                        notifier
                                            .createInviteToFriend(
                                          e.id!,
                                        )
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
                                    ),
                            ),
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

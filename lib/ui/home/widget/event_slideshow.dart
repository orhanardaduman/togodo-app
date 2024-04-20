import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:togodo/core/component/image/custom_image_slideshow.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/index.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/component/togodo_logo.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/common/welcome.dart';
import 'package:togodo/ui/home/reels/components/screen_options.dart';
import 'package:togodo/ui/home/view/share_event.dart';
import 'package:togodo/ui/home/view_model/event_details_view_model.dart';

class EventSlidesShow extends StatelessWidget {
  const EventSlidesShow({
    required this.model,
    required this.notifier,
    required this.theme,
    required this.router,
    required this.userType,
    this.onLikeIncrement,
    super.key,
  });
  final EventDetailsState model;
  final EventDetailsViewModel notifier;
  final AppTheme theme;
  final StackRouter router;
  final UserType userType;
  final void Function()? onLikeIncrement;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomImageSlideshow(
          height: context.dyHeight(610),
          indicatorColor: MainColors.primary,
          indicatorPadding: 8,
          indicatorRadius: 4,
          onPageChanged: (value) {
            if (kDebugMode) {
              print('Page changed: $value');
            }
          },
          items: model.events!.images!.map((e) => e.downloadUrl!).toList(),
          children: [
            for (var i = 0; i < model.events!.images!.length; i++)
              Hero(
                tag: model.events!.images![i].number!,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CachedNetworkImage(
                      key: UniqueKey(),
                      imageUrl: model.events!.images![i].downloadUrl!,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent, // Üst kısım şeffaf
                            Color(
                              0xFF303135,
                            ), // Alt kısım sizin belirttiğiniz renk
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 24,
                ),
                child: TogodoLogo(),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 24,
                ),
                child: IconButton(
                  onPressed: router.pop,
                  icon: Assets.icons.lightOutline.arrowLeft.svg(
                    width: 28,
                    height: 28,
                    // ignore: deprecated_member_use_from_same_package
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: ScreenOptions(
            item: model.events!,
            isDetailsRoute: false,
            padding: const EdgeInsets.only(
              left: 24,
              right: 12,
              bottom: 40,
            ),
            onClickMoreBtn: () {},
            onFollow: () {},
            onLike: (id) {
              if (userType == UserType.guest) {
                return showGuestInfo(theme, context);
              }
              notifier.incrementLike(id);
              if (onLikeIncrement != null) {
                onLikeIncrement!.call();
              }
            },
            onShare: (p0) {
              if (userType == UserType.guest) {
                return showGuestInfo(theme, context);
              }
              showModalBottomSheet<DraggableScrollableSheet>(
                context: context,
                enableDrag: false,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                builder: (BuildContext context) {
                  // Burada yeni post ekleme formunuzu oluşturun
                  return DraggableScrollableSheet(
                    minChildSize: 0.6,
                    maxChildSize: 0.9,
                    initialChildSize: 0.85,
                    builder: (_, controller) {
                      return ShareEvent(
                        event: model.events,
                        controller: controller,
                      );
                    },
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

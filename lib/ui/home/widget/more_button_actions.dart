// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/index.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/component/coustom_popup_divider.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/bottom_menu.dart';
import 'package:togodo/ui/common/welcome.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';

class OwnerIconPopupMenu extends HookConsumerWidget {
  const OwnerIconPopupMenu({
    required this.userId,
    required this.eventId,
    required this.isClosedComment,
    super.key,
  });
  final String userId;
  final String eventId;
  final bool isClosedComment;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final notifier = ref.read(homeViewModelProvider.notifier);
    final router = useRouter();
    final l10n = useL10n();
    /*  final userModel = ref.watch(userViewModelProvider).tokenModel;
        final textEditingController =
        useTextEditingController(text: userModel!.token!.eMail ?? '');
    final desctextEditingController = useTextEditingController(); */
    return PopupMenuButton<String>(
      offset: const Offset(5, -100),
      constraints: BoxConstraints(
        minWidth: context.sized.dynamicWidth(0.9),
      ),
      onSelected: (String value) {
        // Seçilen değere göre işlem yapın
        if (value == 'report') {
          // Şikayet et işlevini tetikleyin
          showReportSheet(
            context,
            onPressed: (type, reportDescription) {
              ref
                  .read(profilViewModelProvider(null).notifier)
                  .createReporUser(userId, eventId: eventId, reportDescription);
              Navigator.pop(context);
            },
          );
        } /* else if (value == 'help') {
          showHelpInfo(
            textEditingController,
            desctextEditingController,
            context,
            onPressed: (desc) {
              router.pop();
            },
          );
        }  */
        else if (value == 'commentsClose') {
          notifier
              .updateCommentPrivacy(eventId)
              .then((value) => Navigator.of(context).pop());
        } else if (value == 'delete') {
          final page = ref.watch(intStateNotifierProvider);

          showAlertDialog(
              theme, context, l10n.confirmDeletion, l10n.confirmDeletePost, () {
            Navigator.of(context).pop();
            showShareDeleteInfo(
              context,
              onPressed: (desc) {
                notifier.removeEvent(
                  eventId,
                );
                if (page == 4) {
                  router
                      .pushAndPopUntil(
                    const HomeRoute(),
                    predicate: (_) => false,
                  )
                      .then((value) {
                    ref
                        .read(profilViewModelProvider(null).notifier)
                        .fetchProfil();
                  });
                } else {
                  router.pushAndPopUntil(
                    const BottomMenuRoute(),
                    predicate: (_) => false,
                  );
                }
              },
            );
          });
        }
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          value: 'commentsClose',
          child: Center(
            child: PrimaryText(
              isClosedComment ? 'Yorumları Aç' : l10n.closeComments,
              style: theme.textTheme.bodyMedium.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        CustomPopupMenuDivider(
          color: theme.appColors.divider,
        ),
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          value: 'share',
          child: Center(
            child: PrimaryText(
              l10n.share,
              style: theme.textTheme.bodyMedium.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        CustomPopupMenuDivider(
          color: theme.appColors.divider,
        ),
        /*  PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          value: 'help',
          child: Center(
            child: PrimaryText(
              l10n.help,
              style: theme.textTheme.bodyMedium.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        CustomPopupMenuDivider(
          color: theme.appColors.divider,
        ), */
        PopupMenuItem<String>(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          value: 'delete',
          child: Center(
            child: PrimaryText(
              l10n.deleteEvent,
              style: theme.textTheme.bodyMedium.copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ],
      icon: Assets.icons.bold.additionalIcons.svg(
        width: 28,
        height: 28,
        color: Colors.white,
      ), // İkona tıklandığında menüyü göster
    );
  }
}

class UserIconPopupMenu extends HookConsumerWidget {
  const UserIconPopupMenu({
    required this.userId,
    required this.eventId,
    super.key,
  });
  final String userId;
  final String eventId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final notifier = ref.read(homeViewModelProvider.notifier);
    final userType = ref.watch(userTypeStateNotifierProvider);

    final l10n = useL10n();
    return userType == UserType.guest
        ? Padding(
            padding: const EdgeInsets.all(8),
            child: Assets.icons.bold.additionalIcons.svg(
              width: 28,
              height: 28,
              color: Colors.white,
            ),
          )
        : PopupMenuButton<String>(
            offset: const Offset(-40, -70), // Menüyü sola doğru kaydır
            onSelected: (String value) {
              // Seçilen değere göre işlem yapın
              if (value == 'report') {
                // Şikayet et işlevini tetikleyin
                showReportSheet(
                  context,
                  onPressed: (type, reportDescription) {
                    ref
                        .read(profilViewModelProvider(null).notifier)
                        .createReporUser(
                          userId,
                          eventId: eventId,
                          reportDescription,
                        )
                        .then(
                          (value) => notifier.incrementRemoveEvent(eventId),
                        );
                    Navigator.pop(context);
                  },
                );
              } else if (value == 'inform') {
                /*   showAlertDialog(theme, context, 'Silmek İstediğine Emin Misin?',
              'Bu gönderiyi silmek istediğine emin misin?'); */
/* notifier.incrementBlockRemoveEvent(userId); */
                print(userId);
                print(
                  userId == '8ebb12ec-05db-4230-aa9e-28af26600d93',
                );
                ref
                    .read(profilViewModelProvider(null).notifier)
                    .blockRelationUser(
                      userId == '8ebb12ec-05db-4230-aa9e-28af26600d93'
                          ? eventId
                          : userId,
                      userId == '8ebb12ec-05db-4230-aa9e-28af26600d93',
                    )
                    .then(
                      (value) => notifier.incrementBlockRemoveEvent(
                        userId == '8ebb12ec-05db-4230-aa9e-28af26600d93'
                            ? eventId
                            : userId,
                        userId == '8ebb12ec-05db-4230-aa9e-28af26600d93',
                      ),
                    );
              }
            },
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20)),
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                value: 'report',
                child: PrimaryText(
                  l10n.report,
                  style: theme.textTheme.bodyMedium.copyWith(
                    color: theme.appColors.text,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              CustomPopupMenuDivider(
                color: theme.appColors.divider,
              ),
              PopupMenuItem<String>(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                value: 'inform',
                child: PrimaryText(
                  l10n.block,
                  style: theme.textTheme.bodyMedium.copyWith(
                    color: theme.appColors.text,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
            icon: Assets.icons.bold.additionalIcons.svg(
              width: 28,
              height: 28,
              color: Colors.white,
            ), // İkona tıklandığında menüyü göster
          );
  }
}

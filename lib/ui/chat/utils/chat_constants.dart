import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:vibration/vibration.dart';

EmojiParser parser = EmojiParser();

// message sent status (wheather it is seen, delivered and seen)
abstract class MessageStatus {
  static final String Sent = parser.emojify(':thumbsup:');
  static final String Delivered = parser.emojify(':shushing_face:');
  static final String Seen = parser.emojify(':slightly_smiling_face:');
}

// message type

// Message reaction
abstract class Reactions {
  static final String Smiley = parser.emojify(':slightly_smiling_face:');
  static final String Heart = parser.emojify(':heart:');
  static final String Wow = parser.emojify(':open_mouth:');
  static final String Sad = parser.emojify(':cry:');
  static final String Angry = parser.emojify(':rage:');
  static final String Like = parser.emojify(':thumbsup:');
}

Future<void> showMessageTilePopUpMenu(
  BuildContext context,
  Offset offset,
  List<PopupMenuEntry<dynamic>> items,
  AppTheme theme,
  WidgetRef ref,
  void Function()? onDeleted,
  void Function() onSwipe,
) async {
  final left = offset.dx;
  final top = offset.dy;

  await showMenu(
    context: context,
    color: theme.appColors.background,
    position: RelativeRect.fromDirectional(
      textDirection: Directionality.of(context),
      start: left,
      top: top,
      end: left + 2,
      bottom: top + 2,
    ),
    items: items,
    elevation: 8,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(16),
      ),
    ),
  ).then((value) {
    switch (value) {
      /*  case 'Info':
          showCustomBottomSheet(
            bottomSheetContext,
            const MessageInfo(),
            .18,
            .18,
          );
          break; */
      case 'Sil':
        warningShowDialog(
          'Mesaı Sil',
          'Mesajı silmek istediğine emin misin?',
          'Mesaı Sil',
          onDeleted,
          theme,
          context,
        );

      /* case 'Forward':
          // have to implement
          break; */
      case 'Yanıtla':
        onSwipe();
      default:
    }
  });
}

Future<void> vibrates() async {
  final canVibrate = await Vibration.hasVibrator();
  if (canVibrate ?? false) {
    await Vibration.vibrate();
  }
}

void warningShowDialog(
  String title,
  String infoTitle,
  String buttonText,
  void Function()? onPressed,
  AppTheme theme,
  BuildContext context,
) {
  showDragCustomSheet(
    minChildSize: 0.3,
    maxChildSize: 0.4,
    initialChildSize: 0.3,
    context: context,
    child: Column(
      children: <Widget>[
        const SizedBox(height: 12),
        PrimaryText(
          infoTitle,
          style: theme.textTheme.bodyLarge.copyWith(
            color: theme.appColors.secondText,
          ),
        ),
        const SizedBox(height: 24),
        CustomButton(
          text: buttonText,
          bgColor: MainColors.dark2,
          mode: ButtonMode.dark,
          side: const BorderSide(
            color: MainColors.dark3,
          ),
          style: theme.textTheme.bodyLarge.copyWith(
            color: MainColors.red,
            fontWeight: FontWeight.bold,
          ),
          onPressed: onPressed,
        ),
      ],
    ),
    title: title,
  );
}

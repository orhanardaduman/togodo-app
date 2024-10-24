// ignore_for_file: use_build_context_synchronously

import 'dart:math';
import 'dart:ui' as ui;

import 'package:auto_route/auto_route.dart';
import 'package:clipboard/clipboard.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:http/http.dart' as http;
import 'package:map_location_picker/map_location_picker.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:share_plus/share_plus.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/input/custom_text_field.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/enums/cache_items.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:url_launcher/url_launcher.dart';

class Utility {
  static void customSnackBar(
    GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey,
    String msg, {
    double height = 30,
    Color backgroundColor = Colors.black,
  }) {
    if (scaffoldMessengerKey == null ||
        scaffoldMessengerKey.currentState == null) {
      return;
    }
    scaffoldMessengerKey.currentState!.hideCurrentSnackBar();
    final snackBar = SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        msg,
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
    );
    scaffoldMessengerKey.currentState!.showSnackBar(snackBar);
  }
}
// Etkinlik tarihi ve saati şu andan önceyse, etkinlik geçmiş demektir

bool isEventPassed(String date, String startTime, String? endTime) {
  // Tarih formatını DD.MM.YYYY'den YYYY-MM-DD'ye dönüştürüyoruz
  final initTime = endTime == "" ? startTime : endTime;
  print(initTime);
  print(endTime);
  print(startTime);
  print(endTime == "");

  try {
    final dateParts = date.replaceAll('.', '-').split('-');
    final formattedDate = '${dateParts[0]}-${dateParts[1]}-${dateParts[2]}';
    print('$formattedDate $initTime');
    // Tarih ve saat bilgisini birleştirip DateTime nesnesi oluşturuyoruz
    var eventDateTime = DateTime.parse('$formattedDate $initTime');

    // Şu anki zamanı alıyoruz
    final now = DateTime.now();

    // Eğer bitiş saati startTime'den küçükse, bir gün ekleyerek tarih ve saat bilgisini güncelliyoruz
    if (endTime != null && endTime.compareTo(startTime) < 0) {
      eventDateTime = eventDateTime.add(const Duration(days: 1));
    }

    // Etkinlik tarihi ve saati şu andan önceyse, etkinlik geçmiş demektir
    print(eventDateTime.isBefore(now));
    return eventDateTime.isBefore(now);
  } catch (e) {
    print(e);
    return false;
  }
}

Future<void> launchUrls(String url) async {
  if (!await launchUrl(
    Uri.parse(
      url.contains("http") ? url : 'https://$url',
    ),
  )) {
    // ignore: only_throw_errors
    throw 'Could not launch $url'; // username //
  }
}

String getGoogleMapsApiKey() {
  return dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
}

Future<void> copyLink(
  BuildContext context,
  AppTheme theme,
  String copyUrl,
) async {
  showToast(
    context,
    'Link kopyalandı! 🔗',
    type: AlertType.custom,
    isPosition: true,
    style: theme.textTheme.bodyMedium.copyWith(
      color: MainColors.black,
    ),
  );
  await FlutterClipboard.copy(copyUrl);
}

Future<void> copyLinkNewText(
  BuildContext context,
  AppTheme theme,
  String eventName,
  String eventDescription,
  String url,
  L10n l10n,
) async {
  final splited = eventDescription.split(' ');

  var starts = [
    l10n.shareStartOne,
    l10n.shareStartTwo,
    l10n.shareStartThree,
  ];
  final random = Random();

  final shareText = '${starts[random.nextInt(starts.length)]} '
      "... *devamı togodo'da*\n\n"
      '$url';
  showToast(
    context,
    'Link kopyalandı! 🔗',
    type: AlertType.custom,
    isPosition: true,
    style: theme.textTheme.bodyMedium.copyWith(
      color: MainColors.black,
    ),
  );
  await FlutterClipboard.copy(shareText);
}

class RefreshNullHeader extends StatelessWidget {
  const RefreshNullHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ClassicHeader(
      idleText: '',
      refreshingText: '',
      completeText: '',
      failedText: '',
      canTwoLevelText: '',
      idleIcon: SizedBox.shrink(),
      completeIcon: SizedBox.shrink(),
      failedIcon: SizedBox.shrink(),
      releaseIcon: SizedBox.shrink(),
      canTwoLevelIcon: SizedBox.shrink(),
      releaseText: '',
    );
  }
}

void showHelpInfo(
  TextEditingController controller,
  TextEditingController desController,
  BuildContext context, {
  void Function(String)? onPressed,
}) {
  final focusNode = FocusNode();
  // ignore: cascade_invocations
  focusNode.requestFocus();
  showReportBase(context, initialChildSize: 0.4, (l10n) {
    return [
      CustomTextField(
        controller: controller,
        label: l10n.email,
        prefixIcon: Assets.icons.bold.message.path,
      ),
      const SizedBox(height: 16),
      CustomTextField(
        label: l10n.helpMessage,
        controller: desController,
        isFillColor: false,
        focusNode: focusNode,
        suffixIcon: Assets.icons.bulk.send.path,
        onFieldSubmitted: (value) {
          onPressed?.call(value);
        },
        onSuffixTap: () {
          onPressed?.call(controller.text);
        },
      ),
    ];
  });
}

Future<void> shareEventPlus(
  BuildContext context,
  String eventName,
  String eventDescription,
  String url,
) async {
  final box = context.findRenderObject() as RenderBox?;

  final shareText = '$eventName\n\n'
      '$eventDescription\n\n'
      '$url';

  await Share.share(
    shareText,
    subject: eventDescription,
    sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
  );
}

Future<void> shareEventPlusWithImage(
  String? image,
  BuildContext context,
  String eventName,
  String eventDescription,
  String url,
  L10n l10n,
) async {
  final box = context.findRenderObject() as RenderBox?;
  final splited = eventDescription.split(' ');

  var starts = [
    l10n.shareStartOne,
    l10n.shareStartTwo,
    l10n.shareStartThree,
  ];
  final random = Random();

  final shareText = '${starts[random.nextInt(starts.length)]} '
      "... *devamı togodo'da*\n\n"
      '$url';
  if (image != null) {
    await Share.shareXFiles(
      [
        XFile(image),
      ],
      text: shareText,
      subject: eventDescription,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  } else {
    await Share.share(
      shareText,
      subject: eventDescription,
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }
}

void showShareDeleteInfo(
  BuildContext context, {
  void Function(String)? onPressed,
}) {
  final focusNode = FocusNode();
  final controller = TextEditingController();
  focusNode.requestFocus();
  showReportBase(context, initialChildSize: 0.35, onPressed: () {
    onPressed?.call('');
  }, (l10n) {
    return [
      CustomTextField(
        label: l10n.shareReasonForDeletion,
        controller: controller,
        isFillColor: false,
        focusNode: focusNode,
        suffixIcon: Assets.icons.bulk.send.path,
        onFieldSubmitted: (value) {
          onPressed?.call(value);
        },
        onSuffixTap: () {
          onPressed?.call(controller.text);
        },
      ),
    ];
  });
}

void showReportBase(
  BuildContext context,
  List<Widget> Function(L10n l10n) children, {
  double? initialChildSize,
  void Function()? onPressed,
}) {
  final l10n = L10n.of(context);
  showModalBottomSheet<dynamic>(
    context: context,
    backgroundColor: Colors.transparent,
    elevation: 0,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: DraggableScrollableSheet(
          initialChildSize:
              initialChildSize ?? 0.56, // Başlangıçta daha yüksek bir oran
          minChildSize: initialChildSize != null
              ? initialChildSize - 0.04
              : 0.5, // Minimum boyutu artırın
          maxChildSize: 0.9, // Maksimum boyutu artırın
          builder: (_, scrollController) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ListView(
                controller: scrollController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  ...children(l10n!),
                  const SizedBox(height: 22),
                  CustomButton(
                    text: l10n.close,
                    mode: ButtonMode.dark,
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      );
    },
  );
}

void showReportSheet(
  BuildContext context, {
  void Function(int, String)? onPressed,
}) {
  final controller = TextEditingController();
  showReportBase(
    context,
    (l10n) => [
      Wrap(
        runSpacing: 8,
        children: [
          CustomButton(
            text: l10n.badBehaviour,
            mode: ButtonMode.dark,
            onPressed: () {
              onPressed?.call(
                0,
                l10n.badBehaviour,
              );
            },
          ),
          CustomButton(
            text: l10n.someoneElse,
            maxWidthTextContainer: 200,
            mode: ButtonMode.dark,
            onPressed: () {
              onPressed?.call(1, l10n.someoneElse);
            },
          ),
          CustomButton(
            text: l10n.spam,
            mode: ButtonMode.dark,
            onPressed: () {
              onPressed?.call(2, l10n.spam);
            },
          ),
          CustomTextField(
            label: l10n.other,
            controller: controller,
            isFillColor: false,
            suffixIcon: Assets.icons.bulk.send.path,
            onFieldSubmitted: (value) {
              onPressed?.call(3, value);
            },
            onSuffixTap: () {
              onPressed?.call(3, controller.text);
            },
          ),
        ],
      ),
    ],
  );
}

void showAlertDialog(
  AppTheme theme,
  BuildContext context,
  String title,
  String info,
  void Function()? onPressed,
) {
  final l10n = L10n.of(context);
  showDialog<Dialog>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: CustomModal(
        padding:
            const EdgeInsets.only(top: 40, bottom: 32, left: 32, right: 32),
        borderRadius: const BorderRadius.all(
          Radius.circular(52),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            PrimaryText(
              title,
              textAlign: TextAlign.center,
              style: theme.textTheme.h4.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 32),
            PrimaryText(
              info,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            CustomButton(
              text: l10n!.delete,
              bgColor: MainColors.transparentRed,
              style: theme.textTheme.bodyLarge.copyWith(
                color: MainColors.red,
                fontWeight: FontWeight.w700,
              ),
              onPressed: onPressed,
              radius: 100,
            ),
            const SizedBox(height: 16),
            CustomButton(
              text: l10n.giveUp,
              mode: ButtonMode.dark,
              onPressed: () {
                Navigator.of(context).pop();
              },
              radius: 100,
            ),
          ],
        ),
      ),
    ),
  );
}

void showCustomModalBottomSheets(
  BuildContext context,
  List<Widget> children,
  AppTheme theme, {
  double? initialChildSize,
}) {
  final l10n = L10n.of(context);
  showModalBottomSheet<dynamic>(
    context: context,
    backgroundColor: Colors.transparent,
    elevation: 0,
    isScrollControlled: true,
    // Bu tam ekran yükseklik için sayfayı izin verir.
    builder: (BuildContext context) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: theme.mode == ThemeMode.light
                      ? Colors.white
                      : MainColors.dark2,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: <Widget>[
                    ...children, // Kullanıcı tarafından sağlanan widget listesi
                  ],
                ),
              ),
              const SizedBox(height: 22),
              CustomButton(
                text: l10n!.close,
                mode: ButtonMode.dark,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}

extension BoolParsing on String {
  bool toBool() {
    return toLowerCase() == 'true';
  }
}

void closeKeyboard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

void whiteAppDevice() {
  return SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light.copyWith(
      statusBarColor: Colors.transparent, // StatusBar'ı şeffaf yapın
      statusBarIconBrightness:
          Brightness.light, // StatusBar simgelerini beyaz yapın
    ),
  );
}

void showGuestInfo(
  AppTheme theme,
  BuildContext context,
) {
  final l10n = L10n.of(context);
  showDialog<Dialog>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: CustomModal(
          maxHeight: 365,
          padding:
              const EdgeInsets.only(top: 40, bottom: 32, left: 32, right: 32),
          borderRadius: const BorderRadius.all(
            Radius.circular(52),
          ),
          child: SizedBox(
            height: 355,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const PrimaryText(
                  '👀',
                  style: TextStyle(
                    fontSize: 48,
                  ),
                ),

                SizedBox(height: context.dyHeight(32)),
                PrimaryText(
                  l10n!.guest,
                  style: theme.textTheme.h4.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: context.dyHeight(32)),
                // Diğer kullanıcıların ilgi alanlarını ve sosyal medya hesaplarını görmek için kendi bilgilerini eklem
                PrimaryText(
                  l10n.guestInfo,
                  style: theme.textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: context.dyHeight(32)),

                CustomButton(
                  text: l10n.signUp,
                  onPressed: () {
                    AutoRouter.of(context).popAndPush(
                      const SignupRoute(),
                    );
                  },
                  radius: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

void showBlurInfo(
  AppTheme theme,
  BuildContext context,
) {
  final l10n = L10n.of(context);
  showDialog<Dialog>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: CustomModal(
        padding:
            const EdgeInsets.only(top: 40, bottom: 32, left: 32, right: 32),
        borderRadius: const BorderRadius.all(
          Radius.circular(52),
        ),
        child: SizedBox(
          height: 355,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const PrimaryText(
                '👀',
                style: TextStyle(
                  fontSize: 48,
                ),
              ),

              SizedBox(height: context.dyHeight(32)),
              PrimaryText(
                l10n!.addToSee,
                style: theme.textTheme.h4.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                ),
              ),
              SizedBox(height: context.dyHeight(32)),
              // Diğer kullanıcıların ilgi alanlarını ve sosyal medya hesaplarını görmek için kendi bilgilerini eklem
              PrimaryText(
                l10n.addToSeeInfo,
                style: theme.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: context.dyHeight(32)),

              CustomButton(
                text: l10n.goToProfileAndAdd,
                onPressed: () {
                  AutoRouter.of(context).popAndPush(
                    ProfileRoute(),
                  );
                },
                radius: 100,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

Future<void> requestLocationService(
  AppTheme theme,
  L10n l10n,
  BuildContext context,
) async {
  final serviceEnabled = await Geolocator.isLocationServiceEnabled();
  final cachedDateStr = await CacheItems.locationPopup.readSecureData();
  final showPopup =
      await CacheItems.locationPopupShow.readSecureData() ?? 'False';
  final cachedDate =
      cachedDateStr != null ? DateTime.tryParse(cachedDateStr) : null;
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);

  if (cachedDate != null && today.isAfter(cachedDate) && showPopup == 'True') {
    // Eğer cachedDate bugünden farklıysa ve showPopup 'True' ise, showPopup'ı 'False' olarak ayarla
    await CacheItems.locationPopupShow.writeSecureData('False');
  }
  if (!serviceEnabled) {
    if (cachedDate == null ||
        (now.difference(cachedDate).inDays >= 3 && showPopup == 'False')) {
      // Konum servisleri kapalı ve popup son gösterim tarihinden itibaren 3 gün geçmiş
      await CacheItems.locationPopup.writeSecureData(now.toString());
      await CacheItems.locationPopupShow.writeSecureData('True');
      showLocationRequest(theme, l10n, context);
    }
    return;
  }

  final permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied ||
      permission == LocationPermission.deniedForever) {
    // Konum izinleri reddedildi veya kalıcı olarak reddedildi
    if (cachedDate == null ||
        (now.difference(cachedDate).inDays >= 3 && showPopup == 'False')) {
      // await Geolocator.requestPermission();
      await CacheItems.locationPopup.writeSecureData(now.toString());
      await CacheItems.locationPopupShow.writeSecureData('True');

      showLocationRequest(theme, l10n, context);
    }
  } else {
    // İzinler verildi
    if (kDebugMode) {
      print('İzin verildi');
    }
  }
}

void showLocationRequest(
  AppTheme theme,
  L10n l10n,
  BuildContext context,
) {
  showDialog<Dialog>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: CustomModal(
        borderRadius: const BorderRadius.all(
          Radius.circular(52),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Assets.images.dark.addLocation.svg(),
            SizedBox(
              height: context.dyHeight(12),
            ),
            PrimaryText(
              l10n.addLocation,
              style: theme.textTheme.h4.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: context.dyHeight(12),
            ),
            PrimaryText(
              l10n.addLocationInfo,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: context.dyHeight(12),
            ),
            CustomButton(
              text: l10n.close,
              mode: ButtonMode.dark,
              onPressed: () {
                Navigator.of(context).pop();
              },
              radius: 100,
            ),
            SizedBox(
              height: context.dyHeight(12),
            ),
            CustomButton(
              text: l10n.permissionLocation,
              onPressed: () async {
                Navigator.of(context).pop();
                //  await Geolocator.requestPermission();
                await _openDeviceSettings();
              },
              radius: 100,
            ),
          ],
        ),
      ),
    ),
  );
}

void showGaleryRequest(
  AppTheme theme,
  L10n l10n,
  BuildContext context,
) {
  showDialog<Dialog>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: CustomModal(
        borderRadius: const BorderRadius.all(
          Radius.circular(52),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const PrimaryText(
              '📷',
              style: TextStyle(
                fontSize: 48,
              ),
            ),
            SizedBox(
              height: context.dyHeight(32),
            ),
            PrimaryText(
              l10n.permissionError,
              style: theme.textTheme.h4.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: context.dyHeight(12),
            ),
            PrimaryText(
              l10n.permissionGallery,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: context.dyHeight(12),
            ),
            CustomButton(
              text: l10n.close,
              mode: ButtonMode.dark,
              onPressed: () {
                Navigator.of(context).pop();
              },
              radius: 100,
            ),
            SizedBox(
              height: context.dyHeight(12),
            ),
            CustomButton(
              text: l10n.goToSettings,
              onPressed: () async {
                Navigator.of(context).pop();
                //  await Geolocator.requestPermission();
                await _openDeviceSettings();
              },
              radius: 100,
            ),
          ],
        ),
      ),
    ),
  );
}

Future<BitmapDescriptor> createCustomMarkerIconFromNetwork(
  String imageUrlInput,
) async {
  var imageUrl = imageUrlInput;
  if (imageUrl == '') {
    imageUrl =
        'https://upload.wikimedia.org/wikipedia/commons/4/49/A_black_image.jpg';
  }
  late ui.Image image;
  try {
    // Ağ üzerinden görüntüyü indir
    final response = await http.get(Uri.parse(imageUrl));

    // İndirilen veriyi ByteData'ya dönüştür
    final bytes = response.bodyBytes;
    // ByteData'yı ui.Image'a dönüştür
    final codec = await ui.instantiateImageCodec(
      bytes,
      targetWidth: 80 + 8, // 4pt kenarlık için her iki tarafa 8 ekleyin
      targetHeight: 80 + 8,
    );
    final fi = await codec.getNextFrame();
    image = fi.image;
  } catch (_) {
    final response = await http.get(
      Uri.parse(
        'https://upload.wikimedia.org/wikipedia/commons/4/49/A_black_image.jpg',
      ),
    );

    // İndirilen veriyi ByteData'ya dönüştür
    final bytes = response.bodyBytes;
    // ByteData'yı ui.Image'a dönüştür
    final codec = await ui.instantiateImageCodec(
      bytes,
      targetWidth: 80 + 8, // 4pt kenarlık için her iki tarafa 8 ekleyin
      targetHeight: 80 + 8,
    );
    final fi = await codec.getNextFrame();
    image = fi.image;
  }

  // ui.Image'ı daire şeklinde kırpmak için bir PictureRecorder kullan
  final pictureRecorder = ui.PictureRecorder();
  final canvas = Canvas(pictureRecorder);
  //final paint = Paint();

  // Yarıçapı ve kenarlık genişliğini hesapla
  const radius = 80.0; // Asıl yarıçap 40 olacak
  const borderWidth = 8.0; // Kenarlık genişliği
  const center = ui.Offset(
    radius + borderWidth,
    radius + borderWidth,
  ); // Kenarlık için offset ekleyin

  // Kenarlık için yeni bir Paint tanımla
  final borderPaint = Paint()
    ..color = MainColors.dark3
    ..strokeWidth = borderWidth
    ..style = PaintingStyle.stroke;

  // Daire şeklinde kenarlık çiz
  canvas.drawCircle(center, radius, borderPaint);

  // Path'i clip olarak kullan
  final path = Path()..addOval(Rect.fromCircle(center: center, radius: radius));
  canvas.clipPath(path);

  // Görüntüyü canvas'a çiz
  paintImage(
    canvas: canvas,
    rect: Rect.fromCircle(center: center, radius: radius),
    image: image,
    fit: BoxFit.cover,
  );

  // Canvas'den bir resim al ve BitmapDescriptor oluştur
  final markerAsImage = await pictureRecorder.endRecording().toImage(
        (radius.toInt() + borderWidth.toInt()) * 2,
        (radius.toInt() + borderWidth.toInt()) * 2,
      );
  final byteData =
      await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
  final pngBytes = byteData!.buffer.asUint8List();

  return BitmapDescriptor.fromBytes(pngBytes);
}

Future<void> _openDeviceSettings() async {
  if (await canLaunchUrl(Uri.parse('app-settings:'))) {
    await launchUrl(Uri.parse('app-settings:'));
  } else {
    if (kDebugMode) {
      print('Ayarlar sayfası açılamıyor.');
    }
  }
}

void showApplauseInfo(
  AppTheme theme,
  L10n l10n,
  BuildContext context,
) {
  showDialog<Dialog>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: CustomModal(
        borderRadius: const BorderRadius.all(
          Radius.circular(52),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const PrimaryText(
              '👏🏻',
              style: TextStyle(
                fontSize: 48,
              ),
            ),
            SizedBox(
              height: context.dyHeight(32),
            ),
            PrimaryText(
              l10n.whatIsApplause,
              style: theme.textTheme.h4.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 24,
              ),
            ),
            SizedBox(
              height: context.dyHeight(32),
            ),
            // Diğer kullanıcıların ilgi alanlarını ve sosyal medya hesaplarını görmek için kendi bilgilerini eklem
            PrimaryText(
              l10n.applauseInfo,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: context.dyHeight(32),
            ),
            CustomButton(
              text: l10n.close,
              mode: ButtonMode.dark,
              onPressed: () {
                Navigator.of(context).pop();
              },
              radius: 100,
            ),
          ],
        ),
      ),
    ),
  );
}

// Bottom Sheet
void showCustomBottomSheet(
  BuildContext context,
  Widget child,
  double InitialChildSize,
  double maxChildSize,
) {
  showModalBottomSheet<dynamic>(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16),
        topRight: Radius.circular(16),
      ),
    ),
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: InitialChildSize,
        minChildSize: 0.1,
        maxChildSize: maxChildSize,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: child,
          );
        },
      );
    },
  );
}

void showDragCustomSheet({
  required BuildContext context,
  required Widget child,
  required String title,
  double minChildSize = 0.7,
  double maxChildSize = 0.9,
  double initialChildSize = 0.8,
}) {
  showModalBottomSheet<GestureDetector>(
    context: context,
    isScrollControlled: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      // Burada yeni post ekleme formunuzu oluşturun
      return DraggableScrollableSheet(
        minChildSize: minChildSize,
        maxChildSize: maxChildSize,
        expand: false,
        initialChildSize: initialChildSize,
        builder: (_, controller) {
          return DragCustomModal(
            title: title,
            controller: controller,
            isCloseDivider: true,
            child: child,
          );
        },
      );
    },
  );
}

/* class RefreshNullHeader extends StatelessWidget {
  const RefreshNullHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const ClassicHeader(
      idleText: '',
      refreshingText: '',
      completeText: '',
      failedText: '',
      canTwoLevelText: '',
      idleIcon: SizedBox.shrink(),
      completeIcon: SizedBox.shrink(),
      failedIcon: SizedBox.shrink(),
      releaseIcon: SizedBox.shrink(),
      canTwoLevelIcon: SizedBox.shrink(),
      releaseText: '',
    );
  }
}
 */
Widget getEmptyWidget() {
  return const SizedBox.shrink();
}

class TabIndicator extends Decoration {
  TabIndicator({this.strokeWidth = 2.0}) : _painter = _TabPainter(strokeWidth);

  final double strokeWidth;
  final BoxPainter _painter;

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) => _painter;
}

class _TabPainter extends BoxPainter {
  _TabPainter(this.strokeWidth);

  final double strokeWidth;
  final Color theme = MainColors.primary;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final blueLineOffset1 = offset + Offset(0, cfg.size!.height);
    final greyLineOffset2 = Offset(0, cfg.size!.height + 1);

    final blueLinePaint2 = offset + Offset(cfg.size!.width, cfg.size!.height);
    final greyLineOffset1 =
        offset + Offset(cfg.size!.width * 8, cfg.size!.height + 1);

    final blueLinePaint = Paint()
      ..color = theme
      ..strokeWidth = strokeWidth; // strokeWidth kullanılıyor
    final greyLinePaint = Paint()
      ..color = MainColors.dark3
      ..strokeWidth = 0.2; // Sabit bir değer

    canvas
      ..drawLine(greyLineOffset1, greyLineOffset2, greyLinePaint)
      ..drawLine(blueLineOffset1, blueLinePaint2, blueLinePaint);
  }
}

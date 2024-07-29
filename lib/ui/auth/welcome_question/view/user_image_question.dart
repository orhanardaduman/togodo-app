// ignore_for_file: deprecated_member_use_from_same_package

import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_assets_picker/insta_assets_picker.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/notification/local_notification_service.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/auth/firebase_login_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/welcome_question/welcome_question_modelview.dart';
import 'package:togodo/ui/auth/welcome_question/widget/question_base.dart';

@RoutePage()
class UserImageQuestionPage extends StatefulHookConsumerWidget {
  const UserImageQuestionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserImageQuestionPageState();
}

class _UserImageQuestionPageState extends ConsumerState<UserImageQuestionPage> {
  final picker = ImagePicker();

  File? mediaList;
  List<AssetEntity> selectedAssets = [];
  Future<void> _onSelectedImage(
    WelcomeQuestionModel model,
    AppTheme theme,
    L10n l10n,
  ) async {
    try {
      final pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
      if (pickedFile != null && pickedFile.path.isNotEmpty) {
        final croppedFile = await ImageCropper().cropImage(
          sourcePath: pickedFile.path,
          aspectRatio: const CropAspectRatio(ratioX: 1, ratioY: 1),
          uiSettings: [
            AndroidUiSettings(
              toolbarTitle: 'Kırp',
              toolbarColor: MainColors.primary,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.square,
              lockAspectRatio: true,
              showCropGrid: false,
              hideBottomControls: true,
            ),
            IOSUiSettings(
              title: 'Kırp',
              rectWidth: 450,
              rectHeight: 450,
              doneButtonTitle: 'Tamam',
              cancelButtonTitle: 'İptal',
              rotateClockwiseButtonHidden: true,
              rotateButtonsHidden: true,
              aspectRatioPickerButtonHidden: true,
            ),
          ],
        );
        if (croppedFile != null) {
          model.updateImage(File(croppedFile.path));
        }
      }
    } catch (e) {
      // ignore: use_build_context_synchronously
      showGaleryRequest(theme, l10n, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.watch(welcomeQuestionModelProvider);
    final viewModelNot = ref.read(welcomeQuestionModelProvider.notifier);
    final router = useRouter();
    final theme = ref.watch(appThemeProvider);
    final ln10 = useL10n();
    return QuestionBase(
      index: 2,
      title: ln10.photo_title,
      subtitle: ln10.photo_sub,
      buttonWidget: Column(
        children: [
          if (viewModel.image != null || viewModel.imageUrl != null)
            CustomButton(
              text: ln10.edit,
              mode: ButtonMode.dark,
              onPressed: () async {
                await _onSelectedImage(viewModelNot, theme, ln10);
              },
            ),
          const SizedBox(height: 12),
          CustomButton(
            onPressed: viewModel.image == null && viewModel.imageUrl == null
                ? null
                : () async {
                    viewModelNot.updateLoading(true);

                    FocusScope.of(context).unfocus();
                    final viewModelFnc = ref.read(
                      welcomeQuestionModelProvider.notifier,
                    );
                    final firebase = FirebaseAuth.instance.currentUser;
                    final firebaseMessaging = FirebaseMessaging.instance;
                    final deviceId = await firebaseMessaging.getToken();
                    await viewModelFnc
                        .firebaseLogin(
                      FirebaseLoginModel(
                        idToken: await firebase?.getIdToken(),
                        deviceId: deviceId,
                        email: firebase?.email,
                        phoneNumber: firebase?.phoneNumber,
                      ),
                    )
                        .then((value) async {
                      if (value) {
                        await NotificationService.instance.showNotification(
                          ln10.welcomeNotfications,
                          ln10.welcomeNotficationsInfo,
                        );
                        await router.pushAndPopUntil(
                          const HomeRoute(),
                          predicate: (route) => false,
                        );
                        viewModelNot.updateLoading(false);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Bir hata oluştu'),
                          ),
                        );
                        viewModelNot.updateLoading(false);
                      }
                    });
                  },
            text: ln10.go,
          ),
        ],
      ),
      child: Wrap(
        runSpacing: 20,
        children: [
          InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              await _onSelectedImage(viewModelNot, theme, ln10);
            },
            child: Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: context.sized.dynamicWidth(0.8),
                    height: context.sized.dynamicWidth(0.8),
                    decoration: BoxDecoration(
                      image: viewModel.image != null
                          ? DecorationImage(
                              image: FileImage(viewModel.image!),
                              fit: BoxFit.cover,
                            )
                          : viewModel.imageUrl != null
                              ? DecorationImage(
                                  image: NetworkImage(viewModel.imageUrl!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                      borderRadius: BorderRadius.circular(60),
                      border: Border.all(
                        color: MainColors.primary,
                        width: 3,
                      ),
                    ),
                  ),
                  // Line
                  if (viewModel.image == null && viewModel.imageUrl == null)
                    Assets.icons.bold.plus.svg(
                      color: MainColors.primary,
                      width: 75,
                      height: 75,
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ServicePicker {
  Future<List<AssetEntity>> pickImage(
    BuildContext context,
    AppTheme theme,
    dynamic Function(Stream<InstaAssetsExportDetails>) onCompleted, {
    int maxAssets = 1,
  }) async {
    final instaTheme = InstaAssetPicker.themeData(MainColors.primary);
    await InstaAssetPicker.pickAssets(
      context,
      maxAssets: maxAssets,
      cropDelegate: InstaAssetCropDelegate(
        cropRatios: [
          9 / 16,
          1,
          4 / 3,
        ],
      ),
      onPermissionDenied: (context, perm) async {
        showToast(
          context,
          perm,
          type: AlertType.error,
        );
      },
      pickerTheme: instaTheme.copyWith(
        canvasColor: theme.appColors.background,
        splashColor: Colors.grey,
        dividerColor: Colors.red,
        appBarTheme: instaTheme.appBarTheme.copyWith(
          backgroundColor: theme.appColors.background,
          titleTextStyle:
              Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                    color: theme.appColors.text,
                  ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: MainColors.primary,
            disabledForegroundColor: MainColors.grey50,
          ),
        ),
        colorScheme: instaTheme.colorScheme
            .copyWith(background: theme.appColors.background),
      ),
      onCompleted: onCompleted,
    );
    return [];
  }
}

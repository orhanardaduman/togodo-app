import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/input/custom_date_picker.dart';
import 'package:togodo/core/component/input/custom_location_search.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/notification/local_notification_service.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/component/custom_divider.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/profile/view_model/profil_edit_view_model.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';
import 'package:togodo/ui/profile/widget/community_image_picker.dart';
import 'package:togodo/ui/profile/widget/multi_chip.dart';
import 'package:togodo/ui/profile/widget/profil_edit_dropdown.dart';

import '../widget/drap_drop.dart';

enum ProfilScrollPosition {
  top,
  middle,
  bottom,
}

@RoutePage()
class ProfilEditPage extends StatefulHookConsumerWidget {
  const ProfilEditPage({
    super.key,
    this.profilScrollPosition,
  });
  final ProfilScrollPosition? profilScrollPosition;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProfilEditPageState();
}

class _ProfilEditPageState extends ConsumerState<ProfilEditPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.profilScrollPosition == ProfilScrollPosition.middle) {
        scrollToMiddle();
      } else if (widget.profilScrollPosition == ProfilScrollPosition.bottom) {
        scrollToBottom();
      }
    });
  }

  void scrollToBottom() {
    final bottomPosition = _scrollController.position.maxScrollExtent;
    _scrollController.animateTo(
      bottomPosition / 1.3,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void scrollToMiddle() {
    final middlePosition = _scrollController.position.maxScrollExtent / 2;
    _scrollController.animateTo(
      middlePosition,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToSelectedPosition() {
    final dropdownRenderBox =
        _formKey.currentContext?.findRenderObject() as RenderBox?;
    final dropdownPosition = dropdownRenderBox?.localToGlobal(Offset.zero);

    if (dropdownPosition != null) {
      final screenHeight = MediaQuery.of(context).size.height;
      final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
      final dropdownBottom =
          dropdownPosition.dy + dropdownRenderBox!.size.height;

      if (dropdownBottom > screenHeight - keyboardHeight) {
        final offset = dropdownBottom -
            screenHeight +
            keyboardHeight +
            20; // 20px ekstra boşluk
        _scrollController.animateTo(
          _scrollController.offset + offset,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final model = ref.read(profilEditViewModelProvider.notifier);
    final modelView = ref.watch(profilEditViewModelProvider);
    final theme = ref.watch(appThemeProvider);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: LoadingOverlay(
        isLoading: ref.watch(profilEditViewModelProvider).putLoading,
        progressIndicator: const Loading(),
        child: Scaffold(
          appBar: CustomAppBar(
            title: l10n.profile_edit_title,
          ),
          body: Stack(
            children: [
              ListView(
                shrinkWrap: true,
                controller: _scrollController,
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 23.5,
                ),
                children: [
                  if (modelView.type == 0)
                    DragDropImage(imageUrl: model.imageUrl)
                  else
                    CommunityImage(
                      image: model.imageUrl.ext.isNullOrEmpty
                          ? null
                          : model.imageUrl?.first,
                    ),
                  if (modelView.type == 0)
                    SizedBox(height: context.sized.dynamicHeight(0.021)),
                  if (modelView.type == 0)
                    Center(
                      child: PrimaryText(
                        l10n.profile_edit_picture_change_instruction,
                      ),
                    ),
                  SizedBox(height: context.sized.dynamicHeight(0.022)),
                  if (modelView.type == 0)
                    normalUserForm(l10n, model, modelView, theme)
                  else
                    communityForm(l10n, model, modelView, theme),
                  SizedBox(height: context.sized.dynamicHeight(0.1)),
                ],
              ),
              if (MediaQuery.of(context).viewInsets.bottom == 0)
                Positioned(
                  bottom: 24,
                  left: 24,
                  right: 24,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: context.sized.dynamicHeight(0.1),
                    child: Row(
                      children: [
                        SizedBox(
                          width: context.sized.dynamicWidth(0.35),
                          child: CustomButton(
                            text: l10n.exit_button,
                            mode: ButtonMode.dark,
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: const BoxDecoration().buttonShadow,
                          width: context.sized.dynamicWidth(0.5),
                          child: CustomButton(
                            text: l10n.save_button,
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                model.updateProfil().then((value) async {
                                  if (value == 200) {
                                    await ref
                                        .read(
                                          profilViewModelProvider(null)
                                              .notifier,
                                        )
                                        .fetchProfil()
                                        .then((value) {
                                      Navigator.of(context).pop();
                                      NotificationService.instance
                                          .showNotification(
                                        l10n.info,
                                        l10n.profileNotfications,
                                      );
                                    });
                                  } else {
                                    showToast(
                                      context,
                                      'Hata Oluştu',
                                      type: AlertType.error,
                                    );
                                  }
                                });
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Form communityForm(
    L10n l10n,
    ProfilEditViewModel model,
    ProfilEditState modelView,
    AppTheme theme,
  ) {
    return Form(
      key: _formKey,
      child: Wrap(
        runSpacing: 16,
        children: [
          CustomTextField(
            label: l10n.community_name_label,
            isRegExp: true,
            controller: model.nameController,
            prefixIcon: Assets.icons.bold.profile.path,
          ),
          CustomTextField(
            isRegExp: true,
            label: l10n.username_label,
            controller: model.userNameController,
            prefixIcon: Assets.icons.bold.username.path,
          ),
          CustomTextField(
            label: l10n.description_label,
            minLines: 3,
            required: false,
            controller: model.descController,
            prefixIcon: Assets.icons.light.infoSquare.path,
          ),
          if (modelView.type == 1)
            HobyPositionMultiChip(
              onTap: (value) {
                model.hobyList = value;
              },
              initialValue: model.hobyList ?? [],
            ),
          ProfilEditDropdownField(
            label: l10n.add_social_media_label,
          ),
        ],
      ),
    );
  }

  Form normalUserForm(
    L10n l10n,
    ProfilEditViewModel model,
    ProfilEditState modelView,
    AppTheme theme,
  ) {
    return Form(
      key: _formKey,
      child: Wrap(
        runSpacing: 16,
        children: [
          CustomTextField(
            label: l10n.email,
            controller: model.emailController,
            required: false,
            prefixIcon: Assets.icons.bold.message.path,
          ),
          CustomPhoneTextField(
            controller: model.phoneController,
          ),
          CustomDropdownField(
            label: l10n.gender,
            value: modelView.gender,
            items: [
              DropDownModel(
                id: 0,
                name: l10n.female,
              ),
              DropDownModel(
                id: 1,
                name: l10n.male,
              ),
              DropDownModel(
                id: 2,
                name: l10n.preferNotToSay,
              ),
            ],
            onChanged: model.changeGender,
          ),
          CustomCupertinoDateTextBox(
            initialValue: model.birthDate,
            onDateChange: model.changeBirthDate,
            appTheme: theme,
            pickerBackgroundColor: theme.appColors.background,
            hintText: l10n.dateOfBirth,
            hintColor: theme.appColors.secondText,
          ),
          Center(
            child: PrimaryText(
              l10n.profilEditShowInfo,
            ),
          ),
          const CustomDivider(),
          CustomTextField(
            required: false,
            isRegExp: true,
            label: l10n.name_label,
            controller: model.nameController,
            prefixIcon: Assets.icons.bold.profile.path,
          ),
          CustomTextField(
            required: false,
            isRegExp: true,
            label: l10n.surname_label,
            controller: model.surNameController,
            prefixIcon: Assets.icons.bold.profile.path,
          ),
          CustomTextField(
            required: false,
            isRegExp: true,
            label: l10n.username_label,
            controller: model.userNameController,
            prefixIcon: Assets.icons.bold.username.path,
          ),
          CustomLocationSearchField(
            label: l10n.city,
            controller: model.locationController,
            prefixIcon: Assets.icons.bold.location.path,
            onTap: _scrollToSelectedPosition,
            required: false,
          ),
          CustomTextField(
            label: l10n.occupation_label,
            controller: model.titleController,
            required: false,
            prefixIcon: Assets.icons.light.work.path,
          ),

          /*   Row(
                    children: <Widget>[
                      Expanded(
                        child: CustomTextField(
                          label: 'Gün',
                          controller: TextEditingController(),
                          isReadOnly: true,
                          onTap: () => showDay(
                            context,
                            ref,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: CustomTextField(
                          label: 'Ay',
                          controller: TextEditingController(),
                          isReadOnly: true,
                          onTap: () => showMonth(
                            context,
                            ref,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Expanded(
                        child: CustomTextField(
                          label: 'Yıl',
                          controller: TextEditingController(),
                          isReadOnly: true,
                          onTap: () => showYear(
                            context,
                            ref,
                          ),
                        ),
                      ),
                    ],
                  ), */
          CustomTextField(
            label: l10n.description_label,
            required: false,
            minLines: 3,
            controller: model.descController,
            prefixIcon: Assets.icons.light.infoSquare.path,
          ),
          HobyPositionMultiChip(
            onTap: (value) {
              model.hobyList = value;
            },
            initialValue: model.hobyList ?? [],
          ),
          ProfilEditDropdownField(
            label: l10n.add_social_media_label,
          ),
        ],
      ),
    );
  }
} /*

void showDay(
  BuildContext context,
  WidgetRef ref,
) {
  var selectedDay = 1;
  return showCustomDate(
    context,
    [
      SizedBox(
        height: 150,
        child: CupertinoPicker(
          itemExtent: 32,
          onSelectedItemChanged: (int value) {
            selectedDay = value + 1;
          },
          children: List<Widget>.generate(30, (int index) {
            return Center(child: Text('${index + 1}'));
          }),
        ),
      ),
    ],
    ref.watch(appThemeProvider),
    'Gün',
    () {
      Navigator.pop(context);
      showMonth(context, ref);
    },
  );
}

void showMonth(
  BuildContext context,
  WidgetRef ref,
) {
  var selectedDay = 1;
  return showCustomDate(
    context,
    [
      SizedBox(
        height: 150,
        child: CupertinoPicker(
          itemExtent: 32,
          onSelectedItemChanged: (int value) {
            selectedDay = value + 1;
          },
          children: List<Widget>.generate(12, (int index) {
            return Center(child: Text('${index + 1}'));
          }),
        ),
      ),
    ],
    ref.watch(appThemeProvider),
    'Ay',
    () {
      Navigator.pop(context);
      showYear(context, ref);
    },
  );
}

void showYear(
  BuildContext context,
  WidgetRef ref,
) {
  var selectedYear = 1999;
  return showCustomDate(
    context,
    [
      SizedBox(
        height: 150,
        child: CupertinoPicker(
          itemExtent: 32,
          onSelectedItemChanged: (int value) {
            selectedYear = value + 1;
          },
          children: List<Widget>.generate(12, (int index) {
            return const Center(child: Text('${1950 + 1}'));
          }),
        ),
      ),
    ],
    ref.watch(appThemeProvider),
    'Yıl',
    () {
      Navigator.pop(context);
    },
  );
} */

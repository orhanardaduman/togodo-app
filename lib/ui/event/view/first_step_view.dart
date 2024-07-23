import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/features/map/new_map_picker/new_map_picker.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/event/view_model/create_event_view_model.dart';
import 'package:togodo/ui/event/widget/select_other_admin.dart';
import 'package:togodo/ui/profile/widget/multi_chip.dart';

import '../../../features/component/custom_checkbox.dart';

class FirstStepView extends StatefulHookConsumerWidget {
  const FirstStepView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _FirstStepViewState();
}

class _FirstStepViewState extends ConsumerState<FirstStepView> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final model = ref.read(createEventModelProvider.notifier);
    final modelView = ref.watch(createEventModelProvider);
    final userModel = ref.watch(userViewModelProvider).tokenModel;

    return Wrap(
      runSpacing: 16,
      children: [
        CustomTextField(
          label: l10n.eventName,
          maxLength: 200,
          controller: model.eventNameController,
          textInputAction: TextInputAction.next,
          isRegExp: true,
        ),
        CustomTextField(
          label: l10n.description_label,
          minLines: 3,
          textInputAction: TextInputAction.newline,
          required: false,
          controller: model.descController,
          onFieldSubmitted: (p0) {
            /*    setState(() {
              isOpen = true;
              Future.delayed(const Duration(milliseconds: 500), () {
                setState(() {
                  isOpen = false;
                });
              });
            }); */
          },

          // prefixIcon: Assets.icons.light.infoSquare.path,
        ),
        if (userModel?.token?.userType == 101)
          SelectOtherUserAdmin(
            initialValue: modelView.otherUserModel,
            onTap: model.updateSelectedPerson,
          ),
        HobyPositionMultiChip(
          initialValue: modelView.tagList,
          onTap: model.updateTag,
          isOpen: isOpen,
        ),
        CustomCheckBox(
          label: l10n.online,
          isVal: modelView.isOnline,
          onTap: model.changeOnline,
        ),
        if (!modelView.isOnline)
          NewCustomMapPicker(
            locationController: model.locationController,
            initLocation: model.initLocation ?? const LatLng(0, 0),
            label: model.address ?? l10n.location_label,
            onChange: model.updateLocation,
          ),
      ],
    );
  }
}

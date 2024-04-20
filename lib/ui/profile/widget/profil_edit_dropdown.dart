// ignore_for_file: deprecated_member_use, deprecated_member_use_from_same_package
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/profil_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/profile/view_model/profil_edit_view_model.dart';

class ProfilEditDropdownField extends StatefulHookConsumerWidget {
  const ProfilEditDropdownField({
    required this.label,
    super.key,
    this.prefixIcon,
    this.isEnabled = true,
  });
  final String label;
  final String? prefixIcon;
  final bool isEnabled;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProfilEditDropdownFieldState();
}

class _ProfilEditDropdownFieldState
    extends ConsumerState<ProfilEditDropdownField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool _hasInput = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onTextChanged);
    _focusNode.addListener(_onFocusChanged);
  }

  void _onTextChanged() {
    setState(() {
      _hasInput = _controller.text.isNotEmpty;
    });
  }

  void _onFocusChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(appThemeModeProvider.notifier);
    final theme = ref.watch(appThemeProvider);
    final inputColor = widget.isEnabled
        ? (_hasInput || _focusNode.hasFocus
            ? MainColors.primary200
            : (themeMode.isDark ? MainColors.white : MainColors.grey900))
        : MainColors.grey500;
    final model = ref.read(profilEditViewModelProvider.notifier);
    final state = ref.watch(profilEditViewModelProvider);
    final l10n = useL10n();
    return Column(
      children: [
        dropDown(inputColor, theme, themeMode, model, state),
        const SizedBox(height: 16),
        if (model.socialMediaController != null ||
            model.socialMediaController!.isNotEmpty)
          Wrap(
            runSpacing: 16,
            children: model.socialMediaController!
                .mapIndexed(
                  (index, e) => CustomTextField(
                    prefixIcon: e.icon,
                    isPrefixColor: false,
                    label: l10n.pasteLink,
                    controller: model.socialMediaLinkController[index],
                    onSuffixTap: () {
                      setState(() {
                        model.socialMediaController!.removeAt(index);
                      });
                    },
                    suffixIcon: Assets.icons.bold.closeSquare.path,
                  ),
                )
                .toList()
                .reversed
                .toList(),
          ),
      ],
    );
  }

  DropdownButtonHideUnderline dropDown(
    Color inputColor,
    AppTheme theme,
    ThemeModeNotifier themeMode,
    ProfilEditViewModel model,
    ProfilEditState state,
  ) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<SocialMedias>(
        focusNode: _focusNode,
        isExpanded: true,
        hint: Row(
          children: [
            Assets.icons.bold.profile.svg(
              color: inputColor,
              width: 20,
            ),
            const SizedBox(width: 12),
            Text(
              widget.label,
              style: theme.textTheme.bodyMedium.copyWith(
                color: inputColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        items: state.socialMediasData
            .map(
              (SocialMedias item) => DropdownMenuItem<SocialMedias>(
                value: item,
                child: Row(
                  children: [
                    if (item.icon != null)
                      SvgPicture.asset(
                        item.icon!,
                        width: 20,
                      ),
                    const SizedBox(width: 12),
                    Text(
                      item.name ?? '',
                      style: theme.textTheme.bodyMedium.copyWith(
                        color: inputColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            )
            .toList(),
        /*   value: model.socialMediaController == null ||
                model.socialMediaController!.isEmpty
            ? null
            : model.socialMediaController!.first, */
        onChanged: (SocialMedias? value) {
          setState(() {
            if (model.socialMediaController == null ||
                model.socialMediaController!.isEmpty) {
              // Eğer `null` ise, yeni bir liste oluşturun ve ekleyin.
              model
                ..socialMediaController = [value!]
                ..socialMediaLinkController = [TextEditingController()];
            } else {
              // Eğer `null` değilse, mevcut listeye ekleyin.
              if (!model.socialMediaController!.contains(value)) {
                model.socialMediaController!.add(value!);
                model.socialMediaLinkController.add(TextEditingController());
              }
            }
          });
        },
        buttonStyleData: ButtonStyleData(
          padding: const EdgeInsets.symmetric(
            vertical: 2,
            horizontal: 6,
          ),
          decoration: BoxDecoration(
            borderRadius: FormStyle.borderRadius,
            border: Border.all(
              width: 2,
              color: widget.isEnabled && (_hasInput || _focusNode.hasFocus)
                  ? MainColors.primary200
                  : Colors.transparent,
            ),
            color: (themeMode.isDark ? MainColors.dark2 : MainColors.grey50),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: Assets.icons.bold.arrowDown2.svg(color: inputColor, width: 20),
          iconSize: 20,
          iconEnabledColor: inputColor,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 300,
          offset: const Offset(0, -5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: themeMode.isDark ? MainColors.dark2 : MainColors.grey50,
          ),
          scrollbarTheme: ScrollbarThemeData(
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(6),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: FormStyle.inputHeight,
          padding: EdgeInsets.only(left: 14, right: 14),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }
}

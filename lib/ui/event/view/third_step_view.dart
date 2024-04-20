import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/event/widget/index.dart';

class ThirdStepView extends HookConsumerWidget {
  const ThirdStepView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryText(
          l10n.addPhoto,
          style: theme.textTheme.h4.copyWith(
            color: theme.appColors.text,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 16),
        PrimaryText(
          l10n.decorateEvent,
          style: theme.textTheme.bodyLarge.copyWith(color: MainColors.grey400),
        ),
        const SizedBox(height: 16),
        /*   CustomTextField(
          prefixIcon: Assets.icons.light.search.path,
          label: l10n.searchConcept,
          controller: TextEditingController(),
        ),
        const SizedBox(height: 16), */
        const ConceptImageTab(),
        const SizedBox(height: 16),
        DividerWithTextAndIcon(
          text: l10n.or,
          iconData: Icons.add,
        ),
        const SizedBox(height: 23),
        const CreateEventDragDropImage(),
        SizedBox(height: context.sized.dynamicHeight(0.021)),
        Center(
          child: PrimaryText(
            l10n.profile_edit_picture_change_instruction,
          ),
        ),
      ],
    );
  }
}

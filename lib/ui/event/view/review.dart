import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/event/view/index.dart';
import 'package:togodo/ui/event/widget/drag_drop_image.dart';

class ReviewView extends StatefulHookConsumerWidget {
  const ReviewView({
    super.key,
    this.focusNode,
  });
  final FocusNode? focusNode;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReviewViewState();
}

class _ReviewViewState extends ConsumerState<ReviewView> {
  @override
  void initState() {
    super.initState();
    if (widget.focusNode != null) {
      Future.delayed(const Duration(seconds: 1), () {
        widget.focusNode!.requestFocus();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    return Wrap(
      runSpacing: 16,
      children: [
        const CreateEventDragDropImage(),
        SizedBox(height: context.sized.dynamicHeight(0.021)),
        Center(
          child: PrimaryText(
            l10n.profile_edit_picture_change_instruction,
            style: theme.textTheme.bodyMedium.copyWith(
              color: MainColors.grey400,
            ),
          ),
        ),
        const Divider(),
        FirstStepView(),
        SecondStepView(
          isReview: true,
          focusNode: widget.focusNode,
        ),
      ],
    );
  }
}

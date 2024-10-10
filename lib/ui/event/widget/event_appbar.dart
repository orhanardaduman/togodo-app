// ignore_for_file: deprecated_member_use_from_same_package

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/event/view_model/create_event_view_model.dart';
import 'package:togodo/ui/event/widget/index.dart';

class EventAppBar extends HookConsumerWidget implements PreferredSizeWidget {
  const EventAppBar({
    super.key,
    this.isEdit = false,
  });
  final bool isEdit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final model = ref.read(createEventModelProvider.notifier);
    final state = ref.watch(createEventModelProvider);
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final router = useRouter();
    return AppBar(
      title: const StepLineProgress(),
      backgroundColor: Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          if (state.step == 0) {
            Navigator.of(context).pop();
            return;
          }
          model.incrementBackProgress();
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20), // Sol boşluk
          child: Assets.icons.lightOutline.arrowLeft.svg(
            width: 28,
            height: 28,
            color: theme.appColors.text,
          ),
        ),
      ),
      actions: isEdit
          ? []
          : [
              TextButton(
                onPressed: () {
                  router.push(const DraftRoute());
                },
                child: PrimaryText(
                  l10n.draft,
                  style: theme.textTheme.bodyMedium.copyWith(
                    color: const Color(0xff8b9498),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

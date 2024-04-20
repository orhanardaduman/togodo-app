import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/user_search_with_events.dart';
import 'package:togodo/ui/event/widget/search_user_for_admin_view.dart';

class SelectOtherUserAdmin extends StatefulHookConsumerWidget {
  const SelectOtherUserAdmin(
      {required this.initialValue, required this.onTap, super.key});
  final void Function(Users) onTap;
  final Users? initialValue;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SelectOtherUserAdminState();
}

class _SelectOtherUserAdminState extends ConsumerState<SelectOtherUserAdmin> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    return TextButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return Scaffold(
              body: SearchUserForAdminView(
                onTap: (Users model) {
                  widget.onTap(model);
                  Navigator.pop(context);
                },
              ),
            );
          },
        );
      },
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            width: 2,
            color: MainColors.primary,
          ),
          borderRadius: BorderRadius.circular(
            100,
          ),
        ),
      ),
      child: Text(
        widget.initialValue?.name ?? l10n.selectUser,
        style: theme.textTheme.bodyMedium.copyWith(
          fontWeight: FontWeight.w700,
          color: MainColors.primary,
        ),
      ),
    );
  }
}

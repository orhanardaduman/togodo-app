import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:togodo/core/extension/device_size_extension.dart';

import '../../../core/component/button/custom_button.dart';
import '../../../core/helpers/colors/colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/model/profil/user_search_model.dart';
import '../../profile/view/friends_search_page.dart';

class ShareEventUserView extends StatefulWidget {
  const ShareEventUserView({
    super.key,
    required this.theme,
    required this.l10n,
    required this.user,
    required this.onShare,
  });
  final AppTheme theme;
  final L10n l10n;
  final UserSearchModel user;
  final VoidCallback onShare;
  @override
  State<ShareEventUserView> createState() => _ShareEventUserViewState();
}

class _ShareEventUserViewState extends State<ShareEventUserView> {
  bool isShared = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: context.dyWidth(240),
          child: UserInfoWidget(user: widget.user),
        ),
        SizedBox(
          width: context.dyWidth(130),
          height: 38,
          child: CustomButton(
            text: isShared ? widget.l10n.shared : widget.l10n.share,
            radius: 100,
            style: widget.theme.textTheme.bodyLarge.copyWith(
              fontWeight: FontWeight.w500,
              color: MainColors.white,
            ),
            onPressed: () {
              if (!isShared) {
                setState(() {
                  isShared = true;
                });
                widget.onShare();
              }
            },
          ),
        ),
      ],
    );
  }
}

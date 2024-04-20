import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';

@RoutePage()
class FriendsRequestPage extends HookConsumerWidget {
  const FriendsRequestPage({
    this.userId,
    super.key,
  });
  final String? userId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = useRouter();
    final l10n = useL10n();
    final theme = ref.watch(appThemeProvider);
    final notifier = ref.read(profilViewModelProvider(userId).notifier);
    final users = ref.watch(
          profilViewModelProvider(userId).select((value) {
            return value.requestModel;
          }),
        ) ??
        [];
    return Scaffold(
      appBar: CustomAppBar(
        title: l10n.friendRequests,
      ),
      body: ListView.builder(
        itemCount: users.length,
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(
          vertical: 13,
        ),
        itemBuilder: (context, index) {
          final user = users[index];
          return GestureDetector(
            onTap: () {
              router.push(
                UserProfileRoute(
                  userId: user.id!,
                ),
              );
            },
            child: ListTile(
              leading: CustomAvatarImage(
                imageUrl: user.imageUrl,
              ),
              minVerticalPadding: 24,
              title: PrimaryText(
                user.name ?? '', // Replace with actual user's username
                style: theme.textTheme.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: SizedBox(
                width: 181,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 81,
                      height: 32,
                      child: CustomButton(
                        text: l10n.reject,
                        onPressed: () {
                          notifier.declineRequest(user.id!);
                        },
                        mode: ButtonMode.dark,
                        style: theme.textTheme.bodyMedium.copyWith(
                          fontWeight: FontWeight.w500,
                          color: MainColors.grey500,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 88,
                      height: 32,
                      child: CustomButton(
                        text: l10n.accept,
                        onPressed: () {
                          notifier.acceptRequest(user.id!).then((value) {
                            if (value) {
                              showToast(context, 'Başarılı');
                            } else {
                              showToast(
                                context,
                                'Hata oluştu. Lütfen tekrar deneyin.',
                                type: AlertType.error,
                              );
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

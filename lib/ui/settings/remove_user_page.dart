import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/input/custom_text_field.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/enums/cache_items.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/network/api/api_endpoint.dart';
import 'package:togodo/core/network/api/app_dio.dart';
import 'package:togodo/core/network/firebase/firebase_collections.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/data/provider/firebase_auth_provider.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';

@RoutePage()
class RemoveUserPage extends StatefulHookConsumerWidget {
  const RemoveUserPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RemoveUserPageState();
}

class _RemoveUserPageState extends ConsumerState<RemoveUserPage> {
  bool _isLoading = false;
  final TextEditingController _deletedController = TextEditingController();
  Future<bool> _deleteAccount() async {
    try {
      if (_deletedController.text.isEmpty) {
        showToast(
          context,
          'Lütfen sebebinizi yazınız.',
          type: AlertType.error,
        );
        return false;
      }
      _isLoading = true;
      // Giriş yapmış olan kullanıcının referansını alın.
      late final firebaseAuth = ref.read(firebaseAuthProvider);
      final user = firebaseAuth.currentUser;

      // Kullanıcının hesabını sil.
      if (user != null) {
        await _updateDeletedUserSettings(user);
        CacheItems.clearAll();

        await user.delete();
        if (kDebugMode) {
          await ref.read(userViewModelProvider).signOut();

          _isLoading = false;
          return true;
        }
      } else {
        if (kDebugMode) {
          _isLoading = false;
          return false;
        }
      }
    } on firebase.FirebaseAuthException catch (e) {
      if (kDebugMode) {
        _isLoading = false;
        print('Failed to delete account: $e');
        return false;
      }
    }
    return false;
  }

  Future<void> _updateDeletedUserSettings(firebase.User user) async {
    try {
      final userSettings = FirebaseCollections.userSettings.referance;
      final dio = ref.read(dioProvider);
      await dio.delete<dynamic>(
        ApiEndpoint.auth(AuthEndpoint.DELETE_USER),
      );
      await userSettings.doc(user.uid).update({
        'isWelcomePage': false,
        'isDeletedUser': true,
        'isDeletedUserReason': _deletedController.text,
      });
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  @override
  void dispose() {
    _deletedController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final l10n = useL10n();
    return LoadingOverlay(
      progressIndicator: const Loading(),
      isLoading: _isLoading,
      child: Scaffold(
        appBar: CustomAppBar(title: l10n.deleteAccount),
        body: SingleChildScrollView(
          padding: context.padding.medium,
          child: Wrap(
            runSpacing: 20,
            children: [
              CustomTextField(
                controller: _deletedController,
                label: l10n.deleteAccountInfo,
                maxLines: 4,
              ),
              CustomButton(
                onPressed: () async {
                  final val = await _deleteAccount();
                  if (val) {
                    await router.push(const WelcomeRoute());
                  }
                },
                text: l10n.deleteAccount,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

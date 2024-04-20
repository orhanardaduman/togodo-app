// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:sms_autodetect/sms_autodetect.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/loading/container_with_loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/loading_state_view_model.dart';

@RoutePage()
class VerifyEmailPage extends StatefulHookConsumerWidget {
  const VerifyEmailPage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyEmailPageState();
}

class _VerifyEmailPageState extends ConsumerState<VerifyEmailPage> {
  late final List<TextEditingController> controllers;
  Timer? timer;
  bool chacked = false;

  @override
  void initState() {
    final model = ref.read(userViewModelProvider);
    model.startStream();

    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> checkNextStep(StackRouter router) async {
    timer?.cancel();
    final loading = ref.read(loadingStateProvider);
    final model = ref.read(userViewModelProvider);
    try {
      await loading.whileLoading(() async {
        final isWelcomePage = await model.getIsWelcomePage();
        FocusScope.of(context).unfocus();
        if (isWelcomePage) {
          await router.push(const SplashViewRoute());
        } else {
          await router.push(const HobyQuestionRoute());
        }
      });
    } catch (e) {
      showToast(context, '$e');
    }
  }

  void _checkVerified(StackRouter router, User user) {
    user.reload();
    final userCheck = FirebaseAuth.instance.currentUser;

    if (userCheck?.emailVerified == true) {
      checkNextStep(router);
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.read(userViewModelProvider);
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final router = useRouter();
    final user = FirebaseAuth.instance.currentUser;

    if (!chacked && user != null) {
      if (user.emailVerified == true) {
        checkNextStep(router);
      } else {
        user.sendEmailVerification();
        timer = Timer.periodic(
          const Duration(seconds: 3),
          (_) => _checkVerified(router, user),
        );
      }
      chacked = true;
    }
    return ContainerWithLoading(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: context.sized.dynamicHeight(0.025),
                  ),
                  PrimaryText(
                    l10n.controlEmail,
                    style: theme.textTheme.h4.copyWith(
                      color: MainColors.grey50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  PrimaryText(
                    l10n.controlEmailInfo(model.emailTemp ?? ''),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge.copyWith(),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.sized.dynamicHeight(0.027)),
            StreamBuilder<int>(
              initialData: 60,
              stream: model.stream,
              builder: (context, snapshot) {
                final count = snapshot.data!;
                return Center(
                  child: RichText(
                    text: TextSpan(
                      style: theme.textTheme.bodyMedium
                          .copyWith(color: theme.appColors.secondText),
                      children: <TextSpan>[
                        if (count > 0)
                          TextSpan(
                            text:
                                l10n.ins('${count >= 0 ? " ${count}s" : ""} '),
                          ),
                        TextSpan(
                          text: l10n.againSend,
                          style: theme.textTheme.bodyMedium.copyWith(
                            color: count > 0
                                ? theme.appColors.secondText
                                : MainColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = count < 0
                                ? () {
                                    FirebaseAuth.instance.currentUser
                                        ?.sendEmailVerification();
                                  }
                                : null,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/index.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/network/api/api_endpoint.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/common/welcome.dart';
import 'package:togodo/ui/loading_state_view_model.dart';

@RoutePage()
class SigninPage extends StatefulHookConsumerWidget {
  const SigninPage({
    super.key,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SigninPageState();
}

class _SigninPageState extends ConsumerState<SigninPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Container _signUpButton(
    UserViewModel model,
    StackRouter router,
    AppTheme theme,
    L10n l10n,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: CustomButton(
        text: l10n.go,
        onPressed: model.phoneController.text.isNotEmpty ||
                (model.emailController.text.isNotEmpty &&
                    model.passwordController.text.isNotEmpty &&
                    model.passwordController.text.length > 6)
            ? () async {
                if (_formKey.currentState!.validate()) {
                  if (!model.isEmail) {
                    if (await model.checkUser()) {
                      // ignore: use_build_context_synchronously
                      model.sendOtp(
                        onCompleted: () {
                          ref
                              .read(userTypeStateNotifierProvider.notifier)
                              .setUserType(UserType.user);
                          router.push(const SplashViewRoute());
                        },
                        onCodeSent: () {
                          router.push(const VerifyPhoneRoute());
                        },
                        onMessage: (v) {
                          showToast(context, v);
                        },
                        onError: (e) {
                          showToast(context, e);
                        },
                      );
                    } else {
                      // ignore: use_build_context_synchronously
                      showToast(
                        context,
                        l10n.checkPhone,
                        type: AlertType.error,
                      );
                    }
                  } else {
                    final loading = ref.read(loadingStateProvider);
                    await loading.whileLoading(() async {
                      FocusScope.of(context).unfocus();
                      try {
                        final value = await model.validateEmailFn(
                          model.emailController.text.trim(),
                          model.passwordController.text.trim(),
                          true,
                        );
                        if (value) {
                          router.push(const VerifyEmailRoute());
                        } else {
                          showToast(
                            context,
                            l10n.controlCred,
                            type: AlertType.error,
                          );
                        }
                      } catch (e) {
                        showToast(
                          context,
                          l10n.controlCred,
                          type: AlertType.error,
                        );
                      }
                    });
                  }
                }
              }
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final loading = ref.watch(loadingStateProvider).isLoading;
    final router = useRouter();
    final model = ref.watch(userViewModelProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: LoadingOverlay(
        isLoading: loading,
        progressIndicator: const Loading(),
        child: Scaffold(
          key: _scaffoldKey,
          appBar: CustomAppBar(title: l10n.welcome),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              height: context.sized.dynamicHeight(0.88),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const SizedBox(
                    height: 12,
                  ),
                  PrimaryText(
                    l10n.welcomeSubSignin,
                  ),
                  const Spacer(),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        if (model.isEmail)
                          Column(
                            children: [
                              CustomTextField(
                                label: l10n.email,
                                controller: model.emailController,
                              ),
                              const SizedBox(height: 12),
                              CustomTextField(
                                isPassword: true,
                                label: l10n.password,
                                controller: model.passwordController,
                              ),
                            ],
                          ),
                        if (!model.isEmail)
                          CustomPhoneTextField(
                            controller: model.phoneController,
                            onChanged: (v) => model.phone = v.completeNumber,
                          ),
                      ],
                    ),
                  ),
                  PrimaryText(
                    l10n.or,
                    style: theme.textTheme.bodyMedium.copyWith(
                      color: theme.appColors.secondText,
                    ),
                  ),
                  TextButton(
                    onPressed: model.changeEmail,
                    child: PrimaryText(
                      model.isEmail ? l10n.loginWithPhone : l10n.loginWithEmail,
                      style: theme.textTheme.bodyMedium.copyWith(
                        color: theme.appColors.secondText,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  context.sized.emptySizedHeightBoxLow3x,
                  const SignButton(),
                  context.sized.emptySizedHeightBoxLow3x,
                  PrivacyText(
                    theme: theme,
                    l10n: l10n,
                  ),
                  const Spacer(),
                  AnimatedPadding(
                    duration: const Duration(milliseconds: 100),
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                    ),
                    child: _signUpButton(model, router, theme, l10n),
                  ),
                  SizedBox(
                    height: context.sized.dynamicHeight(0.024),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class PrivacyText extends StatelessWidget {
  const PrivacyText({
    required this.theme,
    required this.l10n,
    super.key,
  });
  final AppTheme theme;
  final L10n l10n;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: TextSpan(
          style: theme.textTheme.bodyMedium
              .copyWith(color: theme.appColors.secondText),
          children: <TextSpan>[
            TextSpan(
              text: l10n.privacyOne,
            ),
            TextSpan(
              text: l10n.privacyTwo,
              style: const TextStyle(
                color: MainColors.primary,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrls(
                    PrivacyURl.kullanimVeIcerikUrl,
                  );
                },
            ),
            const TextSpan(
              text: ' , ',
            ),
            TextSpan(
              text: l10n.privacyThree,
              style: const TextStyle(
                color: MainColors.primary,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrls(
                    PrivacyURl.termsUrl,
                  );
                },
            ),
            TextSpan(
              text: l10n.privacyFour,
            ),
            TextSpan(
              text: l10n.privacyFive,
              style: const TextStyle(
                color: MainColors.primary,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  launchUrls(
                    PrivacyURl.privacyUrl,
                  );
                },
            ),
            TextSpan(
              text: l10n.privacySix,
            ),
          ],
        ),
      ),
    );
  }
}

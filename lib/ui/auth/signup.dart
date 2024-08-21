import 'package:auto_route/auto_route.dart';
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
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/component/custom_checkbox.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/signin.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/common/welcome.dart';
import 'package:togodo/ui/loading_state_view_model.dart';

@RoutePage()
class SignupPage extends StatefulHookConsumerWidget {
  const SignupPage({
    super.key,
  });
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignupPageState();
}

class _SignupPageState extends ConsumerState<SignupPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formKey2 = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    final model = ref.read(userViewModelProvider);
    model.passwordController.addListener(() {
      setState(() {});
    });
    model.passwordAgainController.addListener(() {
      setState(() {});
    });
    model.emailController.addListener(() {
      setState(() {});
    });
  }

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
                    model.passwordAgainController.text.isNotEmpty)
            ? () async {
                if (_formKey.currentState!.validate() &&
                    (_formKey2.currentState?.validate() ?? true)) {
                  if (!model.isEmail) {
                    if (await model.checkUser()) {
                      // ignore: use_build_context_synchronously
                      showToast(
                        context,
                        l10n.signUpError,
                        type: AlertType.error,
                      );
                    } else {
                      model.sendOtp(
                        onCompleted: () {
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
                    }
                  } else {
                    if (model.passwordController.text.trim() !=
                        model.passwordAgainController.text.trim()) {
                      showToast(
                        context,
                        l10n.passwordsNotMatch,
                        type: AlertType.error,
                      );
                    } else {
                      final loading = ref.read(loadingStateProvider);
                      await loading.whileLoading(() async {
                        FocusScope.of(context).unfocus();
                        try {
                          final value = await model.validateEmailFn(
                            model.emailController.text.trim(),
                            model.passwordController.text.trim(),
                            false,
                          );
                          if (value) {
                            router.push(const VerifyEmailRoute());
                          } else {
                            showToast(
                              context,
                              l10n.signUpError,
                              type: AlertType.error,
                            );
                          }
                        } catch (e) {
                          showToast(
                            context,
                            e.toString() ==
                                    'Password should be at least 6 characters '
                                ? l10n.passwordIsShort
                                : e.toString() ==
                                        'The supplied auth credential is incorrect, malformed or has expired.'
                                    ? l10n.signUpError
                                    : l10n.error,
                            type: AlertType.error,
                          );
                        }
                      });
                    }
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
          appBar: CustomAppBar(title: l10n.createAccount),
          body: Container(
            height: context.sized.dynamicHeight(model.isEmail ? 1 : 0.88),
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 18.5),
                          PrimaryText(
                            l10n.welcomeSub,
                            style: theme.textTheme.bodyMedium,
                          ),
                          const SizedBox(height: 35),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                CustomTextField(
                                  prefixIcon: model.isCommunity
                                      ? Assets.icons.bold.threeUser.path
                                      : Assets.icons.bold.profile.path,
                                  label: model.isCommunity
                                      ? l10n.community_name_label
                                      : l10n.name_label,
                                  isRegExp: true,
                                  controller: model.nameController,
                                ),
                                const SizedBox(height: 12),
                                if (!model.isCommunity)
                                  CustomTextField(
                                    label: l10n.surname_label,
                                    isRegExp: true,
                                    controller: model.surnameController,
                                  ),
                                const SizedBox(height: 12),
                              ],
                            ),
                          ),
                          if (model.isEmail)
                            Form(
                              key: _formKey2,
                              child: Column(
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
                                    validation: (val) {
                                      if ((val?.length ?? 0) < 6) {
                                        return l10n.passwordMustBeLonger;
                                      } else {
                                        return null;
                                      }
                                    },
                                  ),
                                  const SizedBox(height: 12),
                                  CustomTextField(
                                    isPassword: true,
                                    validation: (val) {
                                      if ((val?.length ?? 0) < 6) {
                                        return l10n.passwordMustBeLonger;
                                      }
                                      if (val !=
                                          model.passwordAgainController.text) {
                                        return l10n.passwordDontMatch;
                                      } else {
                                        return null;
                                      }
                                    },
                                    label: l10n.passwordAgain,
                                    controller: model.passwordAgainController,
                                  ),
                                ],
                              ),
                            ),
                          if (!model.isEmail)
                            CustomPhoneTextField(
                              controller: model.phoneController,
                              onChanged: (v) => model.phone = v.completeNumber,
                            ),
                          CustomCheckBox(
                            label: l10n.createCominityAccount,
                            padding: const EdgeInsets.only(left: 2, top: 12),
                            isBgColor: false,
                            isVal: model.isCommunity,
                            onTap: model.changeCommunity,
                          ),
                          const SizedBox(
                            height: 20,
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
                              model.isEmail
                                  ? l10n.registerWithPhone
                                  : l10n.registerWithEmail,
                              style: theme.textTheme.bodyMedium.copyWith(
                                color: theme.appColors.secondText,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                          context.sized.emptySizedHeightBoxLow3x,
                          const SignButton(),
                          context.sized.emptySizedHeightBoxLow3x,
                          PrivacyText(theme: theme, l10n: l10n),
                          TextButton(
                            onPressed: () async {
                              await router.push(const SigninRoute());
                            },
                            child: PrimaryText(
                              l10n.alreadyAccount,
                              style: theme.textTheme.bodyMedium.copyWith(
                                color: theme.appColors.secondText,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  _signUpButton(model, router, theme, l10n),
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

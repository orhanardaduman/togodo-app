// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
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
import 'package:togodo/data/model/result.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/loading_state_view_model.dart';

@RoutePage()
class VerifyPhonePage extends StatefulHookConsumerWidget {
  const VerifyPhonePage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyPhonePageState();
}

class _VerifyPhonePageState extends ConsumerState<VerifyPhonePage> {
  late final List<TextEditingController> controllers;
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.requestFocus();
    controllers = List.generate(6, (_) => TextEditingController());
  }

  @override
  void dispose() {
    SmsAutoFill().unregisterListener();
    /*    focusNode.unfocus(
      disposition: UnfocusDisposition.previouslyFocusedChild,
    );*/

    for (final element in controllers) {
      element.dispose();
    }
    super.dispose();
  }

  Future<void> _validateCode(String code, StackRouter router) async {
    if (code.length != 6) {
      return;
    }
    final loading = ref.read(loadingStateProvider);
    final model = ref.read(userViewModelProvider);

    try {
      await loading.whileLoading(() async {
        return model.validatePhoneFn(code).then((value) async {
          if (value.asSuccess is Success) {
            final isWelcomePage = await model.getIsWelcomePage();
            FocusScope.of(context).unfocus();
            if (isWelcomePage) {
              await router.push(const SplashViewRoute());
            } else {
              await router.push(const HobyQuestionRoute());
            }
          } else {
            showToast(context, 'Hatayla karşılaşıldı');
          }
        });
      });
    } catch (e) {
      showToast(context, '$e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final model = ref.read(userViewModelProvider);
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();

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
                    l10n.controlPhone,
                    style: theme.textTheme.h4.copyWith(
                      color: MainColors.grey50,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  PrimaryText(
                    l10n.controlPhoneInfo(model.phone),
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge.copyWith(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: PinCodeTextField(
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: Colors.green.shade600,
                  fontWeight: FontWeight.bold,
                ),
                length: 6,
                focusNode: focusNode,
                animationType: AnimationType.fade,
                cursorColor: MainColors.primary,
                autoDismissKeyboard: false,
                keyboardAppearance: theme.mode == ThemeMode.dark
                    ? Brightness.dark
                    : Brightness.light,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(16),
                  borderWidth: 1,
                  fieldHeight: 58,
                  fieldWidth: 52,
                  inactiveFillColor: theme.mode == ThemeMode.dark
                      ? MainColors.dark2
                      : MainColors.grey50,
                  inactiveColor: theme.mode == ThemeMode.dark
                      ? MainColors.dark3
                      : MainColors.grey200,
                  selectedColor: MainColors.primary,
                  selectedFillColor: theme.mode == ThemeMode.dark
                      ? MainColors.dark2
                      : MainColors.grey50,
                  activeFillColor: theme.mode == ThemeMode.dark
                      ? MainColors.dark3
                      : MainColors.grey200,
                  activeColor: MainColors.primary,
                ),
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                keyboardType: TextInputType.number,
                onCompleted: (v) {
                  _validateCode(v, router);
                  FocusScope.of(context).unfocus();
                },
                onChanged: (value) {},
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
                                    model.sendOtp(
                                      onCodeSent: () {},
                                      onMessage: (v) {
                                        showToast(context, v);
                                      },
                                      onError: (e) => showToast(context, e),
                                      onCompleted: () {
                                        router.push(const SplashViewRoute());
                                      },
                                    );
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

  Widget buildCodeNumberBox(int index) {
    final theme = ref.watch(appThemeProvider);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      width: 52,
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:
            theme.mode == ThemeMode.dark ? MainColors.dark2 : MainColors.grey50,
        border: Border.all(color: MainColors.primary),
      ),
      child: Center(
        child: TextFormField(
          controller: controllers[index],
          keyboardAppearance:
              theme.mode == ThemeMode.dark ? Brightness.dark : Brightness.light,
          onChanged: (value) {
            if (value.length == 1 && index < 5) {
              FocusScope.of(context).nextFocus();
            } else if (value.isEmpty && index > 0) {
              FocusScope.of(context).previousFocus();
              controllers[index - 1].clear();
            }
          },
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: MainColors.primary,
          ),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration:
              const InputDecoration(counterText: '', border: InputBorder.none),
        ),
      ),
    );
  }
}

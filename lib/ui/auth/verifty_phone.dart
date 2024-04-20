import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
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
import 'package:togodo/ui/auth/widget/numeric_pad.dart';
import 'package:togodo/ui/loading_state_view_model.dart';

@RoutePage()
class VerifyPhoneSpecialPage extends StatefulHookConsumerWidget {
  const VerifyPhoneSpecialPage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerifyPhoneSpecialPageState();
}

class _VerifyPhoneSpecialPageState
    extends ConsumerState<VerifyPhoneSpecialPage> {
  String code = '';
  FocusNode? focusNode;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final model = ref.read(userViewModelProvider);
    final loading = ref.read(loadingStateProvider);
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    return ContainerWithLoading(
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ColoredBox(
              color: theme.appColors.background,
              child: Column(
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
                          'Lütfen telefonunu kontrol et',
                          style: theme.textTheme.h4.copyWith(
                            color: MainColors.grey50,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 19,
                        ),
                        PrimaryText(
                          'Doğrulama kodunu ${model.phone} numaralı telefona gönderdik.',
                          textAlign: TextAlign.center,
                          style: theme.textTheme.bodyLarge.copyWith(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: context.sized.dynamicHeight(0.073)),
                  Wrap(
                    spacing: 8,
                    children: <Widget>[
                      buildCodeNumberBox(
                        code.isNotEmpty ? code.substring(0, 1) : '',
                      ),
                      buildCodeNumberBox(
                        code.length > 1 ? code.substring(1, 2) : '',
                      ),
                      buildCodeNumberBox(
                        code.length > 2 ? code.substring(2, 3) : '',
                      ),
                      buildCodeNumberBox(
                        code.length > 3 ? code.substring(3, 4) : '',
                      ),
                      buildCodeNumberBox(
                        code.length > 4 ? code.substring(4, 5) : '',
                      ),
                      buildCodeNumberBox(
                        code.length > 5 ? code.substring(5, 6) : '',
                      ),
                    ],
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
                            text: '${count >= 0 ? " ${count}s" : ""} içinde',
                          ),
                        TextSpan(
                          text: l10n.againSend,
                          style: theme.textTheme.bodyMedium.copyWith(
                            color: MainColors.primary,
                            fontWeight: FontWeight.w700,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = count < 0
                                ? () => router.push(const HobyQuestionRoute())
                                : null,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: context.sized.dynamicHeight(0.1)),
            Expanded(
              child: NumericPad(
                theme: theme,
                isDark: theme.mode == ThemeMode.dark,
                onNumberSelected: (value) async {
                  setState(() {
                    if (value != -1) {
                      if (code.length < 6) {
                        code = code + value.toString();
                      }
                    } else {
                      code = code.substring(0, code.length - 1);
                      log(' finish $code');
                    }

                    log(code);
                  });
                  if (code.length == 6) {
                    try {
                      await loading.whileLoading(() async {
                        return model.validatePhoneFn(code).then((value) async {
                          if (value.asSuccess is Success) {
                            final isWelcomePage =
                                await model.getIsWelcomePage();
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
                      // ignore: use_build_context_synchronously
                      showToast(context, '$e');
                    }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCodeNumberBox(String codeNumber) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      width: 52,
      height: 58,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color:
            codeNumber.isEmpty ? MainColors.dark2 : MainColors.transparentBlue,
        border: Border.all(
          color: codeNumber.isEmpty
              ? MainColors.dark3
              : MainColors.primary, // Alt çizgi rengi
        ),
      ),
      child: Center(
        child: PrimaryText(
          codeNumber,
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: codeNumber.isEmpty ? MainColors.dark3 : MainColors.primary,
          ),
        ),
      ),
    );
  }
}

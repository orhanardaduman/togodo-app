import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/auth/welcome_question/welcome_question_modelview.dart';

class QuestionBase extends HookConsumerWidget {
  const QuestionBase({
    required this.title,
    required this.child,
    this.buttonWidget,
    this.subtitle,
    super.key,
    this.index = 0,
  });
  final String title;
  final String? subtitle;
  final Widget child;
  final Widget? buttonWidget;
  final int index;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.read(appThemeProvider);
    final viewModel = ref.watch(welcomeQuestionModelProvider);
    final router = useRouter();
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: LoadingOverlay(
        isLoading: viewModel.loading,
        progressIndicator: const Loading(),
        child: Scaffold(
          backgroundColor: theme.appColors.background,
          appBar: CustomAppBar(
            title: title,
            onTap: () {
              if (index == 0) {
                ref
                    .read(userViewModelProvider.notifier)
                    .signOut()
                    .then((value) => router.push(const WelcomeRoute()));
              } else {
                router.pop();
              }
            },
          ),
          body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.all(24),
                    children: [
                      if (subtitle != null)
                        PrimaryText(
                          subtitle!,
                        ),
                      context.sized.emptySizedHeightBoxNormal,
                      child,
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Center(
                    child: buttonWidget ?? const SizedBox.shrink(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

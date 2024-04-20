// ignore_for_file: use_setters_to_change_properties

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/button/outline_circle_button.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/enums/platform_enum.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/network/firebase/firebase_collections.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/auth/auth_model.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/loading_state_view_model.dart';

enum UserType {
  guest,
  user,
}

class UserTypeStateNotifier extends StateNotifier<UserType> {
  UserTypeStateNotifier()
      : super(UserType.user); // Başlangıç değeri 0 olarak ayarlanır.

  void setUserType(UserType value) {
    state = value;
  }
}

final userTypeStateNotifierProvider =
    StateNotifierProvider((_) => UserTypeStateNotifier());
final firebaseAuthProvider =
    Provider<FirebaseAuth>((ref) => FirebaseAuth.instance);

@RoutePage()
class WelcomePage extends StatefulHookConsumerWidget {
  const WelcomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  Widget _body(StackRouter router, AppTheme theme) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    /*   final image = theme.mode == ThemeMode.dark
        ? (context.isSmallScrn
            ? Assets.images.dark.onboardingEventsDarkSE.svg(
                width: context.sized.dynamicWidth(1.2),
                height: context.sized.dynamicHeight(0.46),
              )
            : Assets.images.dark.onboardingEventsDark.svg())
        : (context.isSmallScrn
            ? Assets.images.light.onboardingEventsLightSE.svg()
            : Assets.images.light.onboardingEventsLight
                .svg()); // Daha büyük ekranlar için orijinal boyut */
    final image = theme.mode == ThemeMode.dark
        ? (context.isSmallScrn
            ? LottieBuilder.asset(Assets.lottie.standartDark)
            : LottieBuilder.asset(Assets.lottie.standartDark))
        : (context.isSmallScrn
            ? LottieBuilder.asset(Assets.lottie.standartLight)
            : LottieBuilder.asset(Assets.lottie.standartLight));

    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          image,
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 44),
              child: Column(
                children: [
                  if (context.isMediumScrn)
                    SizedBox(height: context.dyHeight(24)),
                  PrimaryText(
                    l10n.welcomeTitle,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.h4.copyWith(
                      fontWeight: FontWeight.w700,
                      color: theme.appColors.text,
                    ),
                  ),
                  SizedBox(height: context.isMediumScrn ? 16 : 14),
                  PrimaryText(
                    l10n.welcomeSub,
                    textAlign: TextAlign.center,
                    style: theme.textTheme.bodyLarge.copyWith(
                      color: MainColors.grey400,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  CustomButton(
                    text: l10n.signUp,
                    onPressed: () => router.push(
                      const SignupRoute(),
                    ),
                    style: theme.textTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                      color: MainColors.white,
                    ),
                  ),
                  const SizedBox(height: 11),
                  CustomButton(
                    text: l10n.signIn,
                    bgColor: Colors.transparent,
                    onPressed: () => router.push(
                      const SigninRoute(),
                    ),
                    style: theme.textTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                      color: MainColors.primary,
                    ),
                  ),
                  CustomButton(
                    text: l10n.guest,
                    bgColor: Colors.transparent,
                    onPressed: () {
                      ref
                          .read(userTypeStateNotifierProvider.notifier)
                          .setUserType(UserType.guest);
                      router.push(
                        const SplashViewRoute(),
                      );
                    },
                    style: theme.textTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                      color: MainColors.grey500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final theme = ref.watch(appThemeProvider);
    return Scaffold(
      body: _body(router, theme),
    );
  }
}

class SignButton extends StatefulHookConsumerWidget {
  const SignButton({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignButtonState();
}

class _SignButtonState extends ConsumerState<SignButton> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchSettings();
    });
  }

  bool apple = false;
  bool email = false;
  bool facebook = false;
  bool google = false;
  bool otp = false;
  bool twitter = false;

  Future<void> fetchSettings() async {
    try {
      final data = await getVersionNumberFromDatabase();
      facebook = data?.facebook ?? false;
      apple = data?.apple ?? false;
      google = data?.google ?? false;
      otp = data?.otp ?? false;
      twitter = data?.twitter ?? false;
      email = data?.email ?? false;
      setState(() {});
    } catch (e) {
      // Handle any error here
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<AuthModel?> getVersionNumberFromDatabase() async {
    if (kIsWeb) return null;
    try {
      final response = await FirebaseCollections.auth.referance
          .withConverter<AuthModel>(
            fromFirestore: (snapshot, options) =>
                AuthModel.fromJson(snapshot.data()!),
            toFirestore: (value, options) {
              return value.toJson();
            },
          )
          .doc(PlatformEnum.versionName)
          .get();
      return response.data();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final loading = ref.watch(loadingStateProvider);
    final model = ref.read(userViewModelProvider);
    final router = useRouter();
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 22,
      children: <Widget>[
        if (apple)
          OutlineCircleButton(
            icon: Assets.icons.social.icBaselineApple.svg(),
            onTap: () => loading.whileLoading(() async {
              FocusScope.of(context).unfocus();
              return model.signInWithApple().then((value) async {
                if (value) {
                  await model.getIsWelcomePage().then((value) {
                    if (value) {
                      router.push(const SplashViewRoute());
                    } else {
                      router.push(const UserTypeQuestionRoute());
                    }
                  });
                } else {}
              });
            }),
          ),
        if (google)
          OutlineCircleButton(
            icon: Assets.icons.social.deviconGoogle.svg(),
            onTap: () => loading.whileLoading(() async {
              FocusScope.of(context).unfocus();
              return model.signInWithGoogle().then((value) async {
                if (value) {
                  await model.getIsWelcomePage().then((value) {
                    if (value) {
                      router.push(const SplashViewRoute());
                    } else {
                      router.push(const UserTypeQuestionRoute());
                    }
                  });
                } else {}
              });
            }),
          ),
        if (twitter)
          OutlineCircleButton(
            icon: Assets.icons.social.pajamasX.svg(),
            onTap: () => loading.whileLoading(() async {
              FocusScope.of(context).unfocus();
              return model.signInWithTwitter().then((value) async {
                if (value) {
                  await model.getIsWelcomePage().then((value) {
                    if (value) {
                      router.push(const SplashViewRoute());
                    } else {
                      router.push(const UserTypeQuestionRoute());
                    }
                  });
                } else {}
              });
            }),
          ),
        if (facebook)
          OutlineCircleButton(
            icon: Assets.icons.social.f.svg(),
            onTap: () => loading.whileLoading(() async {
              FocusScope.of(context).unfocus();
              return model.signInWithFacebook().then((value) async {
                if (value) {
                  await model.getIsWelcomePage().then((value) {
                    if (value) {
                      router.push(const SplashViewRoute());
                    } else {
                      router.push(const UserTypeQuestionRoute());
                    }
                  });
                } else {}
              });
            }),
          ),
      ],
    );
  }
}

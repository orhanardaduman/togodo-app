import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:open_store/open_store.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/enums/cache_items.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/network/api/app_dio.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/viewmodel/user_view_model.dart';
import 'package:togodo/ui/common/splash_provider.dart';
import 'package:togodo/ui/common/welcome.dart';

@RoutePage()
class SplashViewPage extends StatefulHookConsumerWidget {
  const SplashViewPage({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashViewPageState();
}

class _SplashViewPageState extends ConsumerState<SplashViewPage>
    with _SplashViewListenMixin {
  final splashProvider =
      StateNotifierProvider<SplashProvider, SplashState>((ref) {
    return SplashProvider();
  });

  @override
  void initState() {
    super.initState();
    ref.read(splashProvider.notifier).checkApplicationVersion(''.ext.version);
  }

  @override
  Widget build(BuildContext context) {
    final userType = ref.watch(userTypeStateNotifierProvider);
    final theme = ref.watch(appThemeProvider);
    userType == UserType.guest
        ? listenAndNavigateGuest(splashProvider, useL10n())
        : listenAndNavigate(splashProvider, useL10n());
    return Scaffold(
      backgroundColor: theme.appColors.background,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: LottieBuilder.asset(
              Assets.lottie.opening,
              width: 200,
            ),
          ),
        ],
      ),
    );
  }
}

mixin _SplashViewListenMixin on ConsumerState<SplashViewPage> {
  void listenAndNavigateGuest(
    StateNotifierProvider<SplashProvider, SplashState> provider,
    L10n l10n,
  ) {
    final router = useRouter();
    Future.delayed(Duration.zero, () async {
      await router.pushAndPopUntil(
        const HomeRoute(),
        predicate: (_) => false,
      );
    });
  }

  void listenAndNavigate(
    StateNotifierProvider<SplashProvider, SplashState> provider,
    L10n l10n,
  ) {
    final router = useRouter();
    ref.read(userTypeStateNotifierProvider.notifier).setUserType(UserType.user);
    ref.listen(provider, (previous, next) {
      if (next.isRequiredForceUpdate ?? false) {
        showDialogs(next, context, ref.read(appThemeProvider), l10n)
            .then((value) {
          if (next.isRedirectHome != null && next.isRedirectHome!) {
            Future.delayed(Duration.zero, () async {
              final status = await ref.read(userViewModelProvider).tokenCheck();
              if (!status) {
                return router.pushAndPopUntil(
                  const WelcomeRoute(),
                  predicate: (_) => false,
                );
              } else {
                if (next.isWelcomePage != null) {
                  final token = await CacheItems.token.readSecureData();
                  final signType = await CacheItems.signType.readSecureData();
                  ref.read(dioProvider.notifier).updateToken(token ?? '');
                  return router.pushAndPopUntil(
                    next.isWelcomePage ?? false
                        ? const HomeRoute()
                        : (signType == 'authOtp'
                            ? const HobyQuestionRoute()
                            : const UserTypeQuestionRoute()),
                    predicate: (_) => false,
                  );
                } else {
                  await router.pushAndPopUntil(
                    const SignupRoute(),
                    predicate: (_) => false,
                  );
                }
              }
            });
          }
        });
        return;
      }
      if (next.isRedirectHome != null && next.isRedirectHome!) {
        try {
          Future.delayed(Duration.zero, () async {
            final status = await ref.read(userViewModelProvider).tokenCheck();
            if (!status) {
              return router.pushAndPopUntil(
                const WelcomeRoute(),
                predicate: (_) => false,
              );
            } else {
              if (next.isWelcomePage != null) {
                final token = await CacheItems.token.readSecureData();
                ref.read(dioProvider.notifier).updateToken(token ?? '');
                final signType = await CacheItems.signType.readSecureData();
                return router.pushAndPopUntil(
                  next.isWelcomePage ?? false
                      ? const HomeRoute()
                      : (signType == 'authOtp'
                          ? const HobyQuestionRoute()
                          : const UserTypeQuestionRoute()),
                  predicate: (_) => false,
                );
              } else {
                await router.pushAndPopUntil(
                  const SignupRoute(),
                  predicate: (_) => false,
                );
              }
            }
          });
        } catch (e) {
          router.pushAndPopUntil(
            const WelcomeRoute(),
            predicate: (_) => false,
          );
        }
      }
    });
  }
}

Future<dynamic> showDialogs(
  SplashState next,
  BuildContext context,
  AppTheme theme,
  L10n l10n,
) {
  return showDialog<Dialog>(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: CustomModal(
        borderRadius: const BorderRadius.all(
          Radius.circular(52),
        ),
        padding: const EdgeInsets.only(
          top: 40,
          bottom: 32,
          left: 32,
          right: 32,
        ),
        maxHeight:
            context.isMediumScrn ? 670 : context.sized.dynamicHeight(0.9),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (theme.mode == ThemeMode.dark)
              context.isMediumScrn
                  ? Assets.images.dark.updateDark.svg()
                  : Assets.images.dark.updateDark.svg(
                      width: context.sized.dynamicWidth(0.5),
                      height: context.sized.dynamicHeight(0.3),
                    )
            else
              context.isMediumScrn
                  ? Assets.images.light.updateLight.svg(
                      width: context.sized.dynamicWidth(0.5),
                      height: context.sized.dynamicHeight(0.3),
                    )
                  : Assets.images.light.updateLight.svg(),
            SizedBox(
              height: context.dyHeight(20),
            ),
            SizedBox(
              width: context.isMediumScrn ? 300 : 250,
              child: Center(
                child: AutoSizeText(
                  l10n.updateTitle,
                  maxLines: 1,
                  style: theme.textTheme.h4.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: context.dyHeight(20),
            ),
            PrimaryText(
              l10n.updateInfo,
              style: theme.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: context.dyHeight(20),
            ),
            if (theme.mode == ThemeMode.dark)
              CustomButton(
                text: l10n.close,
                mode: ButtonMode.dark,
                onPressed: () {
                  AutoRouter.of(context).pop();
                },
                radius: 100,
              )
            else
              CustomButton(
                text: l10n.close,
                shadowColor: Colors.transparent,
                bgColor: MainColors.primary100,
                style: theme.textTheme.bodyLarge.copyWith(
                  color: MainColors.primary,
                  fontWeight: FontWeight.w700,
                ),
                mode: ButtonMode.dark,
                onPressed: () {
                  AutoRouter.of(context).pop();
                },
                radius: 100,
              ),
            SizedBox(
              height: context.dyHeight(12),
            ),
            CustomButton(
              text: l10n.updateButton,
              onPressed: () {
                OpenStore.instance.open(
                  appStoreId: next.appStoreId ??
                      '6450381621', // AppStore id of your app for iOS

                  androidAppBundleId: next.googlePlayId ??
                      'com.forbigs.togodo', // Android app bundle package name
                );
              },
              radius: 100,
            ),
          ],
        ),
      ),
    ),
  );
}

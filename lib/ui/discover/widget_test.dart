import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:lottie/lottie.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/button/custom_circle_button.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/event/view/pexels_search.dart';

@RoutePage()
class WidgetTestPage extends HookConsumerWidget {
  const WidgetTestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return SafeArea(
      top: false,
      bottom: false,
      child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Center(
              child: Column(
                children: [
                  const PexelsFindEvent(),
                  ElevatedButton(
                    onPressed: () {
                      // İlgili tab index'ini ayarla
                      AutoTabsRouter.of(context).setActiveIndex(
                        4,
                      ); // Örneğin, ProfileRoute için 4. index
                    },
                    child: const Text(
                      'Elevated Button',
                    ),
                  ),

                  LottieBuilder.asset(
                    Assets.lottie.opening,
                  ),

                  inputEx(theme),
                  context.sized.emptySizedHeightBoxHigh,
                  Text(
                    'Button',
                    style: theme.textTheme.h3,
                  ),
                  const Divider(),
                  buttonEx(context),
                  context.sized.emptySizedHeightBoxHigh,
                  Text(
                    'Modal',
                    style: theme.textTheme.h3,
                  ),
                  const Divider(),
                  const Center(child: OpenModalButton()),
                  context.sized.emptySizedHeightBoxHigh,
                  Text(
                    'Toast',
                    style: theme.textTheme.h3,
                  ),
                  const Divider(),
                  toastEx(context),
                  context.sized.emptySizedHeightBoxHigh,
                  Text(
                    'Avatar',
                    style: theme.textTheme.h3,
                  ),
                  // Rectangle
                  const Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      CustomAvatarImage(),
                      CustomAvatarImage(
                        onlineIndicator: true,
                        onlineColor: MainColors.primary,
                      ),
                      CustomAvatarImage(
                        onlineIndicator: true,
                        onlineColor: MainColors.grey400,
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    'Checkbox',
                    style: theme.textTheme.h3,
                  ),
                  const Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      CheckmarkWidget(),
                      CheckmarkWidget(
                        initVal: true,
                      ),
                      CheckmarkWidget(
                        label: 'Unchecked',
                      ),
                      CheckmarkWidget(
                        initVal: true,
                        label: 'Checked',
                      ),
                    ],
                  ),
                  const Divider(),
                  Text(
                    'Radio',
                    style: theme.textTheme.h3,
                  ),
                  const Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: [
                      RadioWidget(),
                    ],
                  ),
                  const Divider(),
                  Text(
                    'Toggle',
                    style: theme.textTheme.h3,
                  ),
                  const Divider(),

                  const Wrap(
                    runSpacing: 20,
                    spacing: 20,
                    children: [
                      CustomSwitchButton(
                        enabled: false,
                      ),
                      CustomSwitchButton(),
                      CustomSwitchButton(
                        initVal: true,
                      ),
                    ],
                  ),
                  Container(
                    height: 800,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Wrap toastEx(BuildContext context) {
    return Wrap(
      runSpacing: 25,
      children: [
        CustomButton(
          text: 'Show Toast',
          onPressed: () {
            showToast(
              context,
              'Toast message',
              gravity: ToastGravity.CENTER,
            );
          },
        ),
        const AlertWidget(
          message: 'Alert message',
        ),
        const AlertWidget(
          message: 'Alert message',
          type: AlertType.info,
        ),
        const AlertWidget(
          message: 'Alert message',
          type: AlertType.warning,
        ),
        const AlertWidget(
          message: 'Alert message',
          type: AlertType.error,
        ),
      ],
    );
  }

  Wrap buttonEx(BuildContext context) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      alignment: WrapAlignment.center,
      children: <Widget>[
        CustomButton(
          text: 'Button',
          leftIcon: Assets.icons.bold.buy.path,
          rightIcon: Assets.icons.bold.iconlyBoldArrowRight.path,
          onPressed: () {},
        ),
        const Divider(),
        CustomButton(
          text: 'Buttson',
          mode: ButtonMode.light,
          onPressed: () {},
          radius: 100,
        ),
        const Divider(),
        CustomButton(
          text: 'Button',
          mode: ButtonMode.dark,
          onPressed: () {},
        ),
        const Divider(),
        CustomButton(
          text: 'Haritalar ile aç',
          mode: ButtonMode.dark,
          mainAxisAlignment: MainAxisAlignment.start,
          leftIcon: Assets.icons.social.appleMapsLogo1.path,
          iconSize: 24,
          isLeftIconColor: false,
          onPressed: () {},
        ),
        const Divider(),
        CustomButton(
          text: 'Yandex Navigasyon ile aç',
          mode: ButtonMode.dark,
          mainAxisAlignment: MainAxisAlignment.start,
          leftIcon: Assets.icons.social.navi.path,
          iconSize: 24,
          isLeftIconColor: false,
          onPressed: () {},
          side: const BorderSide(
            color: MainColors.dark3,
          ),
        ),
        const Divider(),
        CustomButton(
          text: 'Yandex Navigasyon ile aç',
          mode: ButtonMode.light,
          bgColor: MainColors.white,
          mainAxisAlignment: MainAxisAlignment.start,
          leftIcon: Assets.icons.social.navi.path,
          iconSize: 24,
          isLeftIconColor: false,
          side: const BorderSide(
            color: MainColors.grey200,
          ),
          onPressed: () {},
        ),
        const Divider(),
        const ButtonGroup(),
      ],
    );
  }

  Wrap inputEx(AppTheme theme) {
    return Wrap(
      runSpacing: 10,
      spacing: 10,
      alignment: WrapAlignment.center,
      children: [
        Text(
          'Input Field',
          style: theme.textTheme.h3,
        ),
        Divider(
          color: theme.appColors.divider,
        ),
        CustomTextField(
          label: 'Placeholder',
          controller: TextEditingController(),
        ),
        const Divider(),
        CustomTextField(
          label: 'Username',
          isEnabled: false,
          controller: TextEditingController(),
          prefixIcon: Assets.icons.bold.profile.path,
        ),
        const Divider(),
        CustomTextField(
          controller: TextEditingController(),
          label: 'Email',
          prefixIcon: Assets.icons.bold.message.path,
        ),
        const Divider(),
        CustomTextField(
          label: 'Password',
          controller: TextEditingController(),
          prefixIcon: Assets.icons.bold.lock.path,
          isPassword: true,
        ),
        const Divider(),
        const Divider(),
        CustomPhoneTextField(
          controller: TextEditingController(),
        ),
      ],
    );
  }

  Container colorTest(Gradient gradient) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class ButtonGroup extends StatelessWidget {
  const ButtonGroup({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomCircleButton(
          backgroundColor: MainColors.primary,
        ),
        const SizedBox(width: 10),
        CustomCircleButton(
          backgroundColor: Colors.white,
          iconColor: Colors.black,
          side: const BorderSide(color: MainColors.grey300),
          borderRadius: BorderRadius.circular(16),
        ),
        const SizedBox(width: 10),
        CustomCircleButton(
          backgroundColor: Colors.black,
          side: const BorderSide(color: MainColors.dark3),
          borderRadius: BorderRadius.circular(16),
        ),
        const SizedBox(width: 10),
        CustomCircleButton(
          backgroundColor: MainColors.primary,
          borderRadius: BorderRadius.circular(16),
        ),
      ],
    );
  }
}

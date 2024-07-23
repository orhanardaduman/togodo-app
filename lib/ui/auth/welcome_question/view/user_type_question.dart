// ignore_for_file: deprecated_member_use_from_same_package

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/input/custom_text_field.dart';
import 'package:togodo/core/enums/cache_items.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/auth/welcome_question/welcome_question_modelview.dart';
import 'package:togodo/ui/auth/welcome_question/widget/question_base.dart';

@RoutePage()
class UserTypeQuestionPage extends StatefulHookConsumerWidget {
  const UserTypeQuestionPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UserTypeQuestionPageState();
}

class _UserTypeQuestionPageState extends ConsumerState<UserTypeQuestionPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int index = 0;
  @override
  void initState() {
    initIndex();
    super.initState();
  }

  Future<void> initIndex() async {
    index = await CacheItems.signType.readSecureData() == 'authButton' ? 0 : 1;
    if (index == 0) {
      await ref.read(welcomeQuestionModelProvider.notifier).init();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final router = useRouter();
    final model = ref.watch(welcomeQuestionModelProvider);
    final modelNot = ref.read(welcomeQuestionModelProvider.notifier);
    final theme = ref.watch(appThemeProvider);
    final isDark = ref.watch(appThemeModeProvider.notifier).isDark;
    final ln10 = useL10n();
    return QuestionBase(
      title: ln10.createAccount,
      index: index,
      subtitle: ln10.welcomeSub,
      buttonWidget: CustomButton(
        text: ln10.go,
        onPressed: (model.isButtonEnabled || model.isCommunity)
            ? () async {
                if (formKey.currentState!.validate()) {
                  await router.push(const HobyQuestionRoute());
                }
              }
            : null, // Buton durumunu kontrol edin
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              GestureDetector(
                onTap: () => modelNot.changeCommunity(value: false),
                child: Container(
                  height: context.dyHeight(200),
                  width: context.dyWidth(180),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: !model.isCommunity
                        ? MainColors.transparentBlue
                        : (isDark ? MainColors.dark2 : MainColors.grey50),
                    border: Border.all(
                      color: !model.isCommunity
                          ? MainColors.primary
                          : (isDark ? MainColors.dark2 : MainColors.grey200),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Assets.icons.bold.profile.svg(
                        width: 80,
                        height: 80,
                        color: !model.isCommunity
                            ? MainColors.primary
                            : (isDark
                                ? MainColors.grey700
                                : MainColors.grey500),
                      ),
                      const SizedBox(height: 18),
                      AutoSizeText(
                        ln10.personel,
                        maxLines: 1,
                        style: theme.textTheme.h6.copyWith(
                          color: !model.isCommunity
                              ? MainColors.primary
                              : (isDark
                                  ? MainColors.grey700
                                  : MainColors.grey500),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AutoSizeText(
                        ln10.personalText,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: theme.textTheme.bodySmall.copyWith(
                          color: !model.isCommunity
                              ? MainColors.textColor
                              : (isDark
                                  ? MainColors.grey700
                                  : MainColors.grey500),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () => modelNot.changeCommunity(value: true),
                child: Container(
                  height: context.dyHeight(200),
                  width: context.dyWidth(180),
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: model.isCommunity
                        ? MainColors.transparentBlue
                        : (isDark ? MainColors.dark2 : MainColors.grey50),
                    border: Border.all(
                      color: model.isCommunity
                          ? MainColors.primary
                          : (isDark ? MainColors.dark2 : MainColors.grey200),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Assets.icons.bold.threeUser.svg(
                        width: 80,
                        height: 80,
                        color: model.isCommunity
                            ? MainColors.primary
                            : (isDark
                                ? MainColors.grey700
                                : MainColors.grey500),
                      ),
                      const SizedBox(height: 18),
                      AutoSizeText(
                        ln10.community_name_label,
                        maxLines: 1,
                        style: theme.textTheme.h6.copyWith(
                          color: model.isCommunity
                              ? MainColors.primary
                              : (isDark
                                  ? MainColors.grey700
                                  : MainColors.grey500),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      AutoSizeText(
                        ln10.cominityText,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        style: theme.textTheme.bodySmall.copyWith(
                          color: model.isCommunity
                              ? MainColors.textColor
                              : (isDark
                                  ? MainColors.grey700
                                  : MainColors.grey500),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 35),
                CustomTextField(
                  isRegExp: true,
                  label: model.isCommunity
                      ? ln10.community_name_label
                      : ln10.name_label,
                  controller: modelNot.nameController,
                  maxLength: 45,
                ),
                const SizedBox(height: 12),
                if (!model.isCommunity)
                  CustomTextField(
                    isRegExp: true,
                    label: ln10.surname_label,
                    maxLength: 40,
                    controller: modelNot.surnameController,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

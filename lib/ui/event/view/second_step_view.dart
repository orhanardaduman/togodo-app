import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/helpers/utility.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/network/api/api_endpoint.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/component/custom_checkbox.dart';
import 'package:togodo/gen/assets.gen.dart';
import 'package:togodo/ui/event/view_model/create_event_view_model.dart';
import 'package:togodo/ui/event/widget/index.dart';

class SecondStepView extends StatefulHookConsumerWidget {
  const SecondStepView({super.key, this.focusNode, this.isReview = false});
  final bool isReview;
  final FocusNode? focusNode;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SecondStepViewState();
}

class _SecondStepViewState extends ConsumerState<SecondStepView> {
  @override
  Widget build(BuildContext context) {
    final model = ref.read(createEventModelProvider.notifier);
    final state = ref.watch(createEventModelProvider);
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();

    return Wrap(
      runSpacing: 16,
      children: [
        PrimaryText(
          l10n.detailEvent,
          style: theme.textTheme.h4
              .copyWith(
                color: theme.appColors.text,
              )
              .copyWith(
                color: theme.appColors.text,
                fontWeight: FontWeight.w700,
              ),
        ),
        CustomTextField(
          label: l10n.date,
          prefixIcon: Assets.icons.bold.calendar.path,
          controller: model.dateController,
          isReadOnly: true,
          onTap: () => showCustomDate(
            context,
            [
              const CustomCalendar(),
            ],
            ref.watch(appThemeProvider),
            l10n.selectDate,
            l10n,
            () {
              model.setDate();
              Navigator.pop(context);
              showStartHours(
                context,
                model,
                state,
                ref,
                l10n.startingTime,
                l10n.endingTime,
                theme.appColors.text,
                l10n,
              );
            },
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: CustomTextField(
                label: l10n.startTime,
                prefixIcon: Assets.icons.bold.timeSquare.path,
                controller: model.startDateController,
                isReadOnly: true,
                onTap: () => showStartHours(
                  context,
                  model,
                  state,
                  ref,
                  l10n.startingTime,
                  l10n.endingTime,
                  theme.appColors.text,
                  l10n,
                ),
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: CustomTextField(
                label: l10n.endTime,
                required: false,
                prefixIcon: Assets.icons.bold.timeSquare.path,
                controller: model.endDateController,
                isReadOnly: true,
                onTap: () => showEndHours(
                  context,
                  model,
                  state,
                  ref,
                  l10n.endingTime,
                  theme.appColors.text,
                  l10n,
                ),
              ),
            ),
          ],
        ),
        CustomTextField(
          isEnabled: !state.isJoinUserLimited,
          label: l10n.participantCount,
          maxLength: 3,
          focusNode: widget.focusNode,
          keyboardType: TextInputType.number,
          prefixIcon: Assets.icons.bold.threeUser.path,
          controller: model.userController,
        ),
        CustomCheckBox(
          label: l10n.unlimited,
          isVal: state.isJoinUserLimited,
          onTap: model.changeJoinUser,
        ),
        CustomTextField(
          label: l10n.eventFee,
          keyboardType: TextInputType.number,
          isEnabled: !state.isFree,
          maxLength: 6,
          prefixIcon: Assets.icons.bold.ticket.path,
          suffixIconWidget: Padding(
            padding: const EdgeInsets.only(top: 12),
            child: PrimaryText(
              '₺',
              style: theme.textTheme.h6.copyWith(
                color: theme.appColors.secondText,
              ),
            ),
          ),
          controller: model.eventController,
        ),
        CustomTextField(
          isEnabled: !state.isFree,
          label: l10n.tickedUrl,
          required: false,
          keyboardType: TextInputType.url,
          prefixIcon: Assets.icons.bold.link.path,
          controller: model.linkController,
        ),
        CustomCheckBox(
          label: l10n.free,
          isVal: state.isFree,
          onTap: model.changeFree,
        ),
        CustomCheckBoxFormField(
          label: l10n.acceptTerms,
          isBgColor: false,
          initialValue: state.isContract,
          isEnabled: !widget.isReview,
          onTap: model.changeContracy,
          validator: (value) {
            if (value == false) {
              return l10n.errorPrivacy;
            }
            return null;
          },
        ),
      ],
    );
  }

  void showEndHours(
    BuildContext context,
    CreateEventViewModel model,
    CreateEventState state,
    WidgetRef ref,
    String title,
    Color textColor,
    L10n l10n,
  ) {
    return showCustomDate(
      context,
      [
        SizedBox(
          height: 200,
          child: CupertinoTheme(
            data: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle: TextStyle(
                  color: textColor, // Light mod için metin rengi
                ),
              ),
            ),
            child: CupertinoDatePicker(
              use24hFormat: true,
              mode: CupertinoDatePickerMode.time,
              initialDateTime: DateTime.now().add(const Duration(hours: 3)),
              onDateTimeChanged: (DateTime newDate) {
                model.selectedEndDate = newDate;
              },
            ),
          ),
        ),
      ],
      ref.watch(appThemeProvider),
      title,
      l10n,
      () {
        model.setEndDate();
        Navigator.pop(context);
      },
      isFinish: true,
    );
  }

  void showStartHours(
    BuildContext context,
    CreateEventViewModel model,
    CreateEventState state,
    WidgetRef ref,
    String title,
    String endTitle,
    Color textColor,
    L10n l10n,
  ) {
    return showCustomDate(
      context,
      [
        SizedBox(
          height: 200,
          child: CupertinoTheme(
            data: CupertinoThemeData(
              textTheme: CupertinoTextThemeData(
                dateTimePickerTextStyle: TextStyle(
                  color: textColor, // Light mod için metin rengi
                ),
              ),
            ),
            child: CupertinoDatePicker(
              use24hFormat: true,
              mode: CupertinoDatePickerMode.time,
              minimumDate: model.selectedDate != null &&
                      model.selectedDate!.isBefore(DateTime.now())
                  ? DateTime.now().add(const Duration(hours: 1))
                  : null,
              initialDateTime: DateTime.now().add(const Duration(hours: 1)),
              onDateTimeChanged: (DateTime newDate) {
                model.selectedStartDate = newDate;
              },
            ),
          ),
        ),
      ],
      ref.watch(appThemeProvider),
      title,
      l10n,
      () {
        model.setStartDate();
        setState(() {});
        Navigator.pop(context);
        showEndHours(context, model, state, ref, endTitle, textColor, l10n);
      },
    );
  }
}

class CustomCheckBoxFormField extends FormField<bool> {
  CustomCheckBoxFormField({
    required String label,
    required void Function()? onTap,
    super.key,
    super.onSaved,
    super.validator,
    bool super.initialValue = false,
    bool autovalidate = false,
    bool isBgColor = true,
    bool isEnabled = true,
  }) : super(
          autovalidateMode: autovalidate
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          builder: (FormFieldState<bool> state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                PrivacyCustomCheckBox(
                  label: label,
                  isBgColor: isBgColor,
                  isVal: state.value ?? initialValue, // İlk değeri kullan
                  onTap: isEnabled
                      ? () {
                          state.didChange(
                            !(state.value ?? initialValue),
                          ); // Yeni değeri ayarla
                          onTap?.call();
                        }
                      : null,
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 24),
                    child: PrimaryText(
                      state.errorText ?? '',
                      style: TextStyle(
                        color: Colors.red[600],
                        fontSize: 13,
                      ),
                    ),
                  ),
              ],
            );
          },
        );
}

class PrivacyCustomCheckBox extends HookConsumerWidget {
  const PrivacyCustomCheckBox({
    this.label,
    super.key,
    this.isVal = false,
    this.onTap,
    this.padding,
    this.isBgColor = true,
  });

  final String? label;
  final void Function()? onTap;
  final bool isVal;
  final EdgeInsetsGeometry? padding;
  final bool isBgColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final l10n = useL10n();
    final bgColors = isVal
        ? MainColors.transparentBlue
        : (theme.mode == ThemeMode.dark ? MainColors.dark2 : MainColors.white);
    final checkIconColor = isVal ? MainColors.white : Colors.transparent;

    return GestureDetector(
      onTap: onTap,
      child: label == null
          ? checkBox(checkIconColor)
          : AnimatedContainer(
              duration: const Duration(milliseconds: 300), // Animasyon süresi
              width: context.sized.width,
              padding: padding ??
                  const EdgeInsets.symmetric(
                    horizontal: FormStyle.inputWidth,
                    vertical: FormStyle.inputHeightVertical,
                  ),
              decoration: isBgColor
                  ? BoxDecoration(
                      borderRadius: FormStyle.borderRadius,
                      color: bgColors,
                    )
                  : null,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  checkBox(checkIconColor),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: context.sized.dynamicWidth(0.65),
                    child: RichText(
                      text: TextSpan(
                        style: theme.textTheme.bodySmall.copyWith(
                          color: theme.appColors.text,
                          fontWeight: FontWeight.w700,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: l10n.kvkkAgreementInfo),
                          TextSpan(
                            text: l10n.kvkkAgreement,
                            style: const TextStyle(
                              color: MainColors.primary,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                launchUrls(
                                  PrivacyURl.kvkkUrl,
                                );
                              },
                          ),
                          const TextSpan(
                            text: ' , ',
                          ),
                          TextSpan(
                            text: l10n.termsAndConditions,
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
                            text: l10n.privacyPolicyInfo,
                          ),
                          TextSpan(
                            text: l10n.privacyPolicy,
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
                            text: l10n.termsAndConditionsInfo,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  AnimatedContainer checkBox(Color checkIconColor) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200), // Animasyon süresi
      width: 20, // Tik işareti genişliği
      height: 20, // Tik işareti yüksekliği
      decoration: BoxDecoration(
        color: isVal ? MainColors.primary : Colors.transparent,
        border: Border.all(
          color: isVal ? MainColors.primary : MainColors.grey500,
        ),
        borderRadius: BorderRadius.circular(
          6,
        ),
      ),
      child: Icon(
        Icons.check,
        size: isVal ? 16 : 0, // Tik işareti boyutu
        color: checkIconColor,
      ),
    );
  }
}

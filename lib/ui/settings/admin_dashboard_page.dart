import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/l10n.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/custom_shadow.dart';
import 'package:togodo/core/component/image/custom_avatar_image.dart';
import 'package:togodo/core/component/input/index.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/profil/reports_model.dart';
import 'package:togodo/features/component/custom_divider.dart';
import 'package:togodo/ui/comment/comment_items.dart';
import 'package:togodo/ui/event/widget/calendar.dart';
import 'package:togodo/ui/settings/view_model.dart/admin_dashboard_view_model.dart';

@RoutePage()
class AdminDashboardPage extends StatefulHookConsumerWidget {
  const AdminDashboardPage({
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _AdminDashboardPageState();
}

class _AdminDashboardPageState extends ConsumerState<AdminDashboardPage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  int selectedDay = 1;
  int selectedHours = 1;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(adminDashboardViewModelProvider.notifier).getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final model = ref.read(adminDashboardViewModelProvider.notifier);
    final modelView = ref.watch(adminDashboardViewModelProvider);
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: const CustomAppBar(
          title: 'Admin Dashboard',
        ),
        body: ListView(
          shrinkWrap: true,
          controller: _scrollController,
          padding: const EdgeInsets.symmetric(
            horizontal: 24,
            vertical: 23.5,
          ),
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.sized.dynamicWidth(0.3),
              ),
              child: SizedBox(
                height: 40,
                child: CustomButton(
                  text: 'Yenile',
                  onPressed: () {
                    model
                      ..fetchDaily()
                      ..getReports();
                  },
                ),
              ),
            ),
            const CustomDivider(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: context.sized.dynamicWidth(0.41),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: theme.mode == ThemeMode.light
                        ? MainColors.grey100
                        : MainColors.dark2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: PrimaryText(
                    'Günlük : ${modelView.dailyReportsModel?.daily}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: theme.appColors.text,
                    ),
                  ),
                ),
                Container(
                  width: context.sized.dynamicWidth(0.41),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: theme.mode == ThemeMode.light
                        ? MainColors.grey100
                        : MainColors.dark2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: PrimaryText(
                    'Toplam : ${modelView.dailyReportsModel?.total}',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: theme.appColors.text,
                    ),
                  ),
                ),
              ],
            ),
            const CustomDivider(
              height: 48,
            ),
            if (modelView.reports.ext.isNotNullOrEmpty)
              ListView.separated(
                itemCount: modelView.reports!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final data = modelView.reports![index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reporUser(context, theme, router, data),
                          userOrEvents(context, theme, data, router),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      PrimaryText(
                        'Açıklama',
                        style: theme.textTheme.bodyLarge.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      ReadMoreText(
                        text: data.description ?? '',
                        onTapDetection: (p0) {},
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const CustomDivider(height: 24);
                },
              ),
            const CustomDivider(
              height: 48,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mevcut Bildirimler',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: theme.appColors.text,
                  ),
                ),
                newNotification(context, l10n, model, modelView, theme),
              ],
            ),
            const CustomDivider(
              height: 24,
            ),
            if (modelView.data.ext.isNotNullOrEmpty)
              ListView.builder(
                itemCount: modelView.data!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (index == 0) // Sadece ilk öğe için başlık ekleniyor
                        const Padding(
                          padding: EdgeInsets.only(bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(child: PrimaryText('Gün')),
                              Expanded(child: PrimaryText('Saat')),
                              Expanded(child: PrimaryText('Başlık')),
                              Expanded(child: PrimaryText('Açıklama')),
                              SizedBox(width: 48), // Sil butonu için boşluk
                            ],
                          ),
                        ),
                      Row(
                        children: [
                          Expanded(
                            child: PrimaryText(
                              daysOfWeek[modelView.data![index].day! - 1],
                            ),
                          ),
                          Expanded(
                            child: PrimaryText(
                              '${modelView.data![index].hours}:00',
                            ),
                          ),
                          Expanded(
                            child: PrimaryText(modelView.data![index].titleTr!),
                          ),
                          Expanded(
                            child: PrimaryText(modelView.data![index].descTr!),
                          ),
                          Expanded(
                            child: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                model.deleteDocumentById(
                                  modelView.data![index].id!,
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
          ],
        ),
      ),
    );
  }

  SizedBox userOrEvents(
    BuildContext context,
    AppTheme theme,
    ReportsModel data,
    StackRouter router,
  ) {
    return SizedBox(
      width: context.sized.dynamicWidth(0.41),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryText(
            'Şikayet Edilen',
            style: theme.textTheme.bodyLarge.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          if (data.reportedUserFullName != null)
            InkWell(
              onTap: () {
                router.push(
                  UserProfileRoute(
                    userId: data.reportedUserId!,
                  ),
                );
              },
              child: Row(
                children: [
                  CustomAvatarImage(
                    borderRadius: 100,
                    imageUrl: data.reportedEventImageUrl,
                    size: 40,
                  ),
                  SizedBox(
                    width: context.dyWidth(16),
                  ),
                  PrimaryText(
                    '${data.reportedUserFullName}',
                    style: theme.textTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            )
          else
            InkWell(
              onTap: () {
                router.push(
                  EventDetailsRoute(
                    eventId: data.reportedEventId!,
                  ),
                );
              },
              child: Row(
                children: [
                  CustomAvatarImage(
                    borderRadius: 100,
                    imageUrl: data.reportedEventImageUrl,
                    size: 40,
                  ),
                  SizedBox(
                    width: context.dyWidth(16),
                  ),
                  PrimaryText(
                    '${data.reportedEventName}',
                    style: theme.textTheme.bodyLarge.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  SizedBox reporUser(
    BuildContext context,
    AppTheme theme,
    StackRouter router,
    ReportsModel data,
  ) {
    return SizedBox(
      width: context.sized.dynamicWidth(0.41),
      child: Column(
        children: [
          PrimaryText(
            'Şikayet Eden Kullanıcı',
            style: theme.textTheme.bodyLarge.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          InkWell(
            onTap: () {
              router.push(
                UserProfileRoute(userId: data.userId!),
              );
            },
            child: Row(
              children: [
                CustomAvatarImage(
                  borderRadius: 100,
                  imageUrl: data.userImageUrl,
                  size: 40,
                ),
                SizedBox(
                  width: context.dyWidth(16),
                ),
                PrimaryText(
                  '${data.userFullName}',
                  style: theme.textTheme.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: context.dyHeight(24),
          ),
        ],
      ),
    );
  }

  TextButton newNotification(
    BuildContext context,
    L10n l10n,
    AdminDashboardViewModel model,
    AdminDashboardViewState modelView,
    AppTheme theme,
  ) {
    return TextButton(
      onPressed: () {
        showModalBottomSheet<DraggableScrollableSheet>(
          context: context,
          enableDrag: false,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (BuildContext context) {
            // Burada yeni post ekleme formunuzu oluşturun
            return DraggableScrollableSheet(
              minChildSize: 0.6,
              maxChildSize: 0.9,
              initialChildSize: 0.85,
              builder: (_, controller) {
                return DragCustomModal(
                  title: 'Yeni Bildirim Ekle',
                  controller: _scrollController,
                  isCloseDivider: true,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 23,
                  ),
                  child: Column(
                    children: [
                      normalUserForm(l10n, model, modelView, theme),
                      SizedBox(
                        height: context.sized.dynamicHeight(0.046),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: context.sized.dynamicWidth(0.35),
                            child: CustomButton(
                              text: l10n.exit_button,
                              mode: ButtonMode.dark,
                              onPressed: () {
                                AutoRouter.of(context).pop();
                              },
                            ),
                          ),
                          const Spacer(),
                          Container(
                            decoration: const BoxDecoration().buttonShadow,
                            width: context.sized.dynamicWidth(0.5),
                            child: CustomButton(
                              text: l10n.save_button,
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  model
                                      .setUserSettings(
                                    selectedDay,
                                    selectedHours,
                                  )
                                      .then((value) {
                                    model.clear();
                                    FocusScope.of(context).unfocus();
                                    model.getData();
                                    AutoRouter.of(context).pop();
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      },
      child: PrimaryText(
        'Yeni Bildirim Ekle',
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: theme.appColors.themeColor,
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }

  Form normalUserForm(
    L10n l10n,
    AdminDashboardViewModel model,
    AdminDashboardViewState modelView,
    AppTheme theme,
  ) {
    return Form(
      key: _formKey,
      child: Wrap(
        runSpacing: 16,
        children: [
          CustomTextField(
            label: 'Başlık (Türkçe)',
            controller: model.titleTrController,
            textInputAction: TextInputAction.next,
          ),
          CustomTextField(
            label: 'Başlık (İngilizce)',
            textInputAction: TextInputAction.next,
            controller: model.titleEnController,
          ),
          CustomTextField(
            label: 'Açıklama (Türkçe)',
            textInputAction: TextInputAction.next,
            controller: model.descTrController,
          ),
          CustomTextField(
            label: 'Açıklama (İngilizce)',
            textInputAction: TextInputAction.next,
            controller: model.descEnController,
          ),
          CustomTextField(
            label: 'Bildirim Günü',
            textInputAction: TextInputAction.next,
            controller: model.dayController,
            isReadOnly: true,
            onTap: () => showDay(
              context,
              model,
              l10n,
            ),
          ),
          CustomTextField(
            label: 'Bildirim Saati',
            textInputAction: TextInputAction.send,
            controller: model.hoursController,
            isReadOnly: true,
            onTap: () => showHours(
              context,
              model,
              l10n,
            ),
          ),
        ],
      ),
    );
  }

  void showHours(
    BuildContext context,
    AdminDashboardViewModel model,
    L10n l10n,
  ) {
    return showCustomDate(
      context,
      [
        SizedBox(
          height: 150,
          child: CupertinoPicker(
            itemExtent: 32,
            onSelectedItemChanged: (int value) {
              selectedHours = value + 1;
              model.hoursController.text = selectedHours.toString();
            },
            children: List<Widget>.generate(24, (int index) {
              return Center(child: Text('${index + 1}'));
            }),
          ),
        ),
      ],
      ref.watch(appThemeProvider),
      l10n.notTime,
      l10n,
      () {
        Navigator.pop(context);
      },
    );
  }

  void showDay(
    BuildContext context,
    AdminDashboardViewModel model,
    L10n l10n,
  ) {
    return showCustomDate(
      context,
      [
        SizedBox(
          height: 150,
          child: CupertinoPicker(
            itemExtent: 32,
            onSelectedItemChanged: (int value) {
              selectedDay = value + 1;
              model.dayController.text = daysOfWeek[value];
            },
            children: List<Widget>.generate(7, (int index) {
              return Center(child: Text(daysOfWeek[index]));
            }),
          ),
        ),
      ],
      ref.watch(appThemeProvider),
      'Gün',
      l10n,
      () {
        Navigator.pop(context);
      },
    );
  }
}

List<String> daysOfWeek = [
  'Pazartesi',
  'Salı',
  'Çarşamba',
  'Perşembe',
  'Cuma',
  'Cumartesi',
  'Pazar',
];

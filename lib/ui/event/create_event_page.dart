import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:togodo/core/component/alert/alert_messages.dart';
import 'package:togodo/core/component/button/custom_button.dart';
import 'package:togodo/core/component/custom_app_bar.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/event/view/index.dart';
import 'package:togodo/ui/event/view_model/create_event_view_model.dart';
import 'package:togodo/ui/event/widget/index.dart';
import 'package:togodo/ui/home/view_model/home_view_model.dart';
import 'package:togodo/ui/profile/view_model/profil_view_model.dart';
import 'package:togodo/ui/profile/view_model/tab_draft_event_view_model.dart';

@RoutePage()
class CreateEventPage extends StatefulHookConsumerWidget {
  const CreateEventPage({
    super.key,
    this.isDraft = false, // isDraft true veri yükleme işlemi yapılıyor //
    this.initStep = 0,
    this.isProfil = false,
    this.userId,
    this.isUpdate =
        false, // isUpdate true ise sadece güncelleme için kullanılıyor //
    this.eventId,
  });
  final bool isDraft;
  final bool isUpdate;
  final bool isProfil;
  final String? eventId;
  final String? userId;
  final int initStep;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateEventPageState();
}

class _CreateEventPageState extends ConsumerState<CreateEventPage> {
  FocusNode focusNode = FocusNode();
  bool isPush = false;
  @override
  void initState() {
    if (widget.eventId != null && widget.isDraft) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(createEventModelProvider.notifier)
          ..initDraftData(widget.eventId!, isUpdate: widget.isUpdate)
          ..initStep(widget.initStep);
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = useL10n();
    final model = ref.read(createEventModelProvider.notifier);
    final state = ref.watch(createEventModelProvider);
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: LoadingOverlay(
        isLoading: state.loading,
        progressIndicator: const Loading(),
        child: Scaffold(
          backgroundColor: theme.appColors.background,
          appBar: state.step == 3
              ? CustomAppBar(
                  title: l10n.previewEvent,
                  onTap: model.incrementBackProgress,
                )
              : PreferredSize(
                  preferredSize: const Size.fromHeight(
                    kToolbarHeight,
                  ), // kToolbarHeight genellikle 56.0'dır
                  child: EventAppBar(
                    isEdit: model.isDraft,
                  ),
                ),
          body: Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                if (state.step == 0)
                  !model.isDraft
                      ? const ReadyTemplateWidget()
                      : Padding(
                          padding: const EdgeInsets.all(24),
                          child: PrimaryText(
                            l10n.updateEvent,
                            style: theme.textTheme.h5.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Form(
                    key: model.formKey,
                    child: Column(
                      children: [
                        step(
                          state.step,
                        ),
                        context.sized.emptySizedHeightBoxLow,
                        if (state.step == 2)
                          Column(
                            children: [
                              CustomButton(
                                text: l10n.previewEvent,
                                onPressed: () async {
                                  if (state.selectedAssetsAll == null ||
                                      state.selectedAssetsAll!.isEmpty) {
                                    showToast(
                                      context,
                                      'Lütfen en az bir resim ekleyiniz',
                                      type: AlertType.error,
                                      gravity: ToastGravity.TOP,
                                    );
                                  } else {
                                    model.incrementProgress();
                                  }
                                },
                              ),
                              context.sized.emptySizedHeightBoxLow,
                              if (!model.isUpdates)
                                TextButton(
                                  onPressed: () async {
                                    await model
                                        .post(
                                      isPublish: false,
                                    )
                                        .then((value) {
                                      if (value != null) {
                                        if (widget.isProfil) {
                                          ref
                                              .read(
                                                profilViewModelProvider(
                                                  null,
                                                ).notifier,
                                              )
                                              .fetchProfil();
                                        }
                                        ;
                                      } else {
                                        showToast(
                                          context,
                                          'Hata',
                                          type: AlertType.error,
                                        );
                                      }
                                    });
                                  },
                                  child: PrimaryText(
                                    l10n.saveDraft,
                                    style: theme.textTheme.bodyLarge.copyWith(
                                      color: MainColors.primary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                            ],
                          )
                        else
                          CustomButton(
                            text: state.step == 3
                                ? (model.isUpdates
                                    ? l10n.updateEvent
                                    : l10n.createEvent)
                                : l10n.go,
                            onPressed: isPush
                                ? null
                                : () async {
                                    if (state.step == 3) {
                                      setState(() {
                                        isPush = true;
                                      });
                                      await model.post().then((value) async {
                                        if (value != null) {
                                          ref
                                              .read(
                                                homeViewModelProvider.notifier,
                                              )
                                              .loading();
                                          if (widget.isProfil) {
                                            await ref
                                                .watch(
                                                  tabEventsDraftViewModelProvider(
                                                    widget.userId,
                                                  ).notifier,
                                                )
                                                .fetchEvents();
                                          }
                                          Navigator.of(context).pop();
                                          if (model.isUpdates) {
                                            model.updateLoading(true);
                                            ref
                                                .read(
                                                  homeViewModelProvider
                                                      .notifier,
                                                )
                                                .updateEvent(value);

                                            Future.delayed(
                                              const Duration(seconds: 2),
                                              () async {
                                                Navigator.of(context).pop();
                                              },
                                            );
                                            if (Platform.isAndroid) {
                                              Navigator.of(context).pop();
                                            }
                                          } else {
                                            await router.push(
                                              CreateEventSuccesRoute(
                                                theme: theme,
                                                data: value,
                                                title: l10n.succesEventCreated,
                                              ),
                                            );
                                            if (Platform.isAndroid) {
                                              Navigator.of(context).pop();
                                            }
                                          }
                                        } else {
                                          showToast(
                                            context,
                                            'Hata',
                                            type: AlertType.error,
                                          );
                                        }
                                      });
                                    } else {
                                      if (model.formKey.currentState!
                                          .validate()) {
                                        model.incrementProgress();
                                      }
                                    }
                                    return;
                                  },
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget step(int step) {
    switch (step) {
      case 0:
        return FirstStepView();
      case 1:
        return SecondStepView(
          focusNode: focusNode,
        );
      case 2:
        return const ThirdStepView();
      case 3:
        return ReviewView(
          focusNode: focusNode,
        );
      default:
        return FirstStepView();
    }
  }
}

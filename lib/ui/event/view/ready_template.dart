import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:togodo/core/component/loading/loading.dart';
import 'package:togodo/core/component/modal/custom_modal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/component/shimmer/comment_shimmer.dart';
import 'package:togodo/core/extension/device_size_extension.dart';
import 'package:togodo/core/helpers/colors/colors.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/ready_template_model.dart';
import 'package:togodo/features/component/featured_image.dart';
import 'package:togodo/ui/event/view_model/create_event_view_model.dart';
import 'package:togodo/ui/event/view_model/ready_template_view_model.dart';

@RoutePage()
class ReadyTemplatePage extends HookConsumerWidget {
  const ReadyTemplatePage({super.key, this.controller});
  final ScrollController? controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final model = ref.watch(readyTemplateViewModelProvider);
    final l10n = useL10n();

    return LoadingOverlay(
      isLoading: model.dataLoading,
      progressIndicator: const Loading(),
      child: DragCustomModal(
        title: l10n.selectTemplate,
        controller: controller!,
        isCloseDivider: true,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 23,
        ),
        child: Column(
          children: <Widget>[
            if (model.loading)
              Wrap(
                spacing: 24,
                runSpacing: 24,
                children: List.generate(
                  2,
                  (index) => const EventCardShimmer(
                    padding: EdgeInsets.zero,
                  ),
                ),
              )
            else
              SizedBox(
                height: context.dyHeight(context.height),
                child: model.groupedData == null
                    ? SizedBox.fromSize()
                    : GroupedHorizontalList(
                        groupedData: model.data,
                        theme: theme,
                      ),
              ),
          ],
        ),
      ),
    );
  }
}

class GroupedHorizontalList extends HookConsumerWidget {
  const GroupedHorizontalList({
    required this.groupedData,
    required this.theme,
    super.key,
  });
  final List<ReadyTemplateModel> groupedData;
  final AppTheme theme;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(readyTemplateViewModelProvider.notifier);
    // Grup isimlerini ve ilgili verileri gösteren bir liste oluştur
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        itemCount: groupedData.length,
        padding: const EdgeInsets.only(
          bottom: 120,
        ),
        itemBuilder: (
          context,
          index,
        ) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 33),
              PrimaryText(
                groupedData[index].title ?? '', // Grup ismi
                style: theme.textTheme.h4.copyWith(
                  color: theme.appColors.text,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 238, // Yatay liste yüksekliği
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: groupedData[index].images!.length,
                  itemBuilder: (context, imageIndex) {
                    final model = groupedData[index].images![imageIndex];
                    return GestureDetector(
                      onTap: () {
                        viewModel.loading();
                        ref
                            .read(
                              createEventModelProvider.notifier,
                            )
                            .initReadyTemplate(
                              ReadyTemplateModel(
                                id: groupedData[index].id,
                                description: groupedData[index].description,
                                title: groupedData[index].title,
                                tags: groupedData[index].tags,
                                images: [model],
                              ),
                            )
                            .then((value) {
                          viewModel.loading();
                          return AutoRouter.of(context).pop();
                        });
                      },
                      child: Container(
                        width: 156,
                        margin: const EdgeInsets.only(
                          right: 14,
                        ), // Kartlar arası boşluk
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(24),
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xff272727),
                              Color(0x00000000),
                            ],
                            stops: [0, 0.375],
                            begin: Alignment(-0, -1),
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            FeaturedImageWidget(
                              imageUrl: model.downloadUrl!,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(28),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 12,
                                left: 12,
                                bottom: 20,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: 132,
                                    child: PrimaryText(
                                      groupedData[index].description ?? '',
                                      maxLines: 2,
                                      style:
                                          theme.textTheme.bodyXSmall.copyWith(
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                        color: MainColors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

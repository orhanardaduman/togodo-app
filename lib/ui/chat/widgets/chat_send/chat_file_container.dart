import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/chat/view_model/message_details_view_model.dart';
import 'package:togodo/ui/group/view_model/event_group_detail_view_model.dart';

class ChatFileContainer extends HookConsumerWidget {
  const ChatFileContainer({
    this.viewModelNotifier,
    this.viewModel,
    this.eventViewModelNotifier,
    this.eventViewModel,
    super.key,
  });
  final MessageDetailsNotifier? viewModelNotifier;
  final MessageDetailsState? viewModel;
  final EventGroupDetailNotifier? eventViewModelNotifier;
  final EventGroupDetailState? eventViewModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.appColors.divider.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: (viewModel?.mediaList ?? eventViewModel?.mediaList)
                .ext
                .isNotNullOrEmpty
            ? 1
            : 0,
        itemBuilder: (context, index) {
          return Wrap(
            runSpacing: 20,
            spacing: 20,
            children: (viewModel?.mediaList ?? eventViewModel?.mediaList ?? [])
                .map(
                  (e) => Stack(
                    children: [
                      InkWell(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.grey.withOpacity(0.5),
                            image: DecorationImage(
                              image: FileImage(
                                e,
                              ),
                              fit: BoxFit.fill,
                            ),
                          ),
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Positioned(
                        right: 0,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.close_outlined,
                              size: 15,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              if (viewModelNotifier != null) {
                                viewModelNotifier!.removeMedia(
                                  index,
                                );
                              } else if (eventViewModelNotifier != null) {
                                eventViewModelNotifier!.removeMedia(
                                  index,
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                )
                .toList(),
          );
        },
      ),
    );
  }
}

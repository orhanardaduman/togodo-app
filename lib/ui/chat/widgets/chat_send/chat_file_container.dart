import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/ui/chat/view_model/message_details_view_model.dart';

class ChatFileContainer extends HookConsumerWidget {
  const ChatFileContainer({
    required this.viewModelNotifier,
    required this.viewModel,
    super.key,
  });
  final MessageDetailsNotifier viewModelNotifier;
  final MessageDetailsState viewModel;
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
        itemCount: viewModel.mediaList.ext.isNotNullOrEmpty ? 1 : 0,
        itemBuilder: (context, index) {
          return Wrap(
            runSpacing: 20,
            spacing: 20,
            children: viewModel.mediaList
                .mapIndexed(
                  (index, e) => Stack(
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
                              viewModelNotifier.removeMedia(
                                index,
                              );
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

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/features/component/featured_image.dart';
import 'package:togodo/ui/chat/view_model/message_details_view_model.dart';
import 'package:togodo/ui/chat/widgets/gallery_image/custom_gallery_image.dart';

class ChatReplyContainer extends HookConsumerWidget {
  const ChatReplyContainer({
    required this.viewModelNotifier,
    required this.viewModel,
    super.key,
  });
  final MessageDetailsNotifier viewModelNotifier;
  final MessageDetailsState viewModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final replyModel = viewModel.replyModel;
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.appColors.divider.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PrimaryText(
                      replyModel!.isCurrentUser!
                          ? 'Siz'
                          : replyModel.userFullName!,
                      style: theme.textTheme.bodyMedium.copyWith(
                        color: theme.appColors.themeColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (replyModel.messageContentType == '6')
                      SizedBox(
                        width: 100,
                        height: 150,
                        child: FeaturedImageWidget(
                          imageUrl: replyModel.eventInfo?.eventImageUrl ?? '',
                          borderRadius:
                              const BorderRadius.all(Radius.circular(28)),
                        ),
                      ),
                    if (replyModel.messageFiles.ext.isNotNullOrEmpty)
                      SizedBox(
                        width: 150,
                        child: CustomGalleryImage(
                          imageUrls: replyModel.messageFiles!
                              .map((e) => e.filePath!)
                              .toList(),
                          numOfShowImages: replyModel.messageFiles!.length,
                          titleGallery: 'Resimler',
                        ),
                      ),
                    if (replyModel.message != null &&
                        replyModel.message!.isNotEmpty)
                      PrimaryText(
                        replyModel.message ?? '',
                        style: TextStyle(
                          color: theme.appColors.text,
                        ),
                      ),
                  ],
                ),
              ),
              IconButton(
                onPressed: viewModelNotifier.updateState,
                icon: Icon(
                  Icons.close,
                  color: theme.appColors.text,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'package:togodo/core/component/custom_event_card.dart';
import 'package:togodo/core/component/primary_text.dart';
import 'package:togodo/core/theme/app_theme.dart';
import 'package:togodo/data/model/event/event_model.dart';
import 'package:togodo/ui/chat/model/message_info_model.dart';
import 'package:togodo/ui/chat/widgets/gallery_image/custom_gallery_image.dart';

class ChatReplyContent extends HookConsumerWidget {
  const ChatReplyContent({
    this.replyModel,
    super.key,
  });
  final MessageInfoModel? replyModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.appColors.text.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
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
                          : replyModel!.userFullName ?? '',
                      style: theme.textTheme.bodySmall.copyWith(
                        color: theme.appColors.themeColor,
                        fontWeight: FontWeight.bold,
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
                    if (replyModel!.messageContentType == '6')
                      EnventCards(
                        data: EventModel(
                          id: replyModel!.eventInfo!.eventId,
                          name: replyModel!.eventInfo!.eventName,
                          date: replyModel!.eventInfo!.eventDate,
                          location: replyModel!.eventInfo!.eventLocation,
                          description: replyModel!.eventInfo!.eventContent,
                          imageUrl: replyModel!.eventInfo!.eventImageUrl,
                          vendorDetails: VendorDetails(
                            name: replyModel!.eventInfo!.userFullName,
                            imageUrl: replyModel!.eventInfo!.userImageUrl,
                          ),
                        ),
                      ),
                    if (replyModel!.messageFiles!.ext.isNotNullOrEmpty)
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomGalleryImage(
                            imageUrls: replyModel!.messageFiles!
                                .map((e) => e.filePath!)
                                .toList(),
                            numOfShowImages: replyModel!.messageFiles!.length,
                            titleGallery: 'Resimler',
                          ),
                          PrimaryText(
                            replyModel!.message ?? '',
                          ),
                        ],
                      )
                    else
                      PrimaryText(
                        replyModel!.message ?? '',
                      ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/hook/use_l10n.dart';
import 'package:togodo/core/hook/use_router.dart';
import 'package:togodo/core/route/app_route.gr.dart';

import '../../../core/component/image/custom_avatar_image.dart';
import '../../../core/component/primary_text.dart';
import '../../../core/helpers/colors/colors.dart';
import '../../../core/theme/app_theme.dart';
import '../../../gen/assets.gen.dart';
import '../../home/widget/event_info.dart';
import '../../profile/view_model/profil_view_model.dart';
import '../model/group_model.dart';
import 'gorup_chat_messages.dart';

class GroupWidget extends StatefulHookConsumerWidget {
  final GroupModel? model;

  const GroupWidget({super.key, this.model});

  @override
  ConsumerState<GroupWidget> createState() => _GroupWidgetState();
}

class _GroupWidgetState extends ConsumerState<GroupWidget> {
  final controller = ScrollController();
  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus) {
        controller.animateTo(
          controller.position.maxScrollExtent,
          duration: Duration(seconds: 2),
          curve: Curves.fastOutSlowIn,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(appThemeProvider);
    final router = useRouter();
    final l10n = useL10n();

    return SingleChildScrollView(
      controller: controller,
      child: Column(
        children: [
          Column(
            children: (widget.model?.users ?? [])
                .map((e) => GestureDetector(
                      onTap: () {
                        router.push(
                          ProfileRoute(
                            userId: e.userModel.aspNetUsers?.id ?? "",
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 5,
                        ),
                        child: Row(
                          children: [
                            CustomAvatarImage(
                              imageUrl: e.userModel.aspNetUsers?.imageUrl,
                              size: 40,
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                PrimaryText(
                                  "${e.userModel.aspNetUsers?.name ?? ''} ${e.userModel.aspNetUsers?.surname ?? ''}", // Replace with actual user's username
                                  style: theme.textTheme.bodyLarge.copyWith(
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                PrimaryText(
                                  e.userModel.aspNetUsers?.title ??
                                      '', // Replace with actual user's username
                                  style: theme.textTheme.bodyLarge.copyWith(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color:
                                        const Color.fromRGBO(117, 117, 177, 1),
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            if (!e.isFriend)
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    e.isFriend = true;
                                  });
                                  ref
                                      .read(
                                        profilViewModelProvider(
                                          e.userModel.aspNetUsers?.id,
                                        ).notifier,
                                      )
                                      .addRequest();
                                },
                                icon: Assets.icons.bold.addUser.svg(
                                  color: Colors.white,
                                  width: 24,
                                ),
                              ),
                          ],
                        ),
                      ),
                    ))
                .toList(),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 5,
            ),
            width: MediaQuery.of(context).size.width - 40,
            height: 1,
            color: const Color.fromRGBO(53, 56, 63, 1),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 5,
            ),
            child: EventInfo(
              spacing: 12,
              isNew: true,
              name: widget.model?.detailModel.eventModel.name ?? '',
              date: widget.model?.detailModel.eventModel.date ?? '',
              location: (widget.model?.detailModel.eventModel.onlineUrl == '' ||
                      widget.model?.detailModel.eventModel.onlineUrl == null)
                  ? (widget.model?.detailModel.eventModel.location ?? ',')
                          .contains("Türkiye")
                      ? (widget.model?.detailModel.eventModel.location ?? ',')
                          .split(",")[
                              (widget.model?.detailModel.eventModel.location ??
                                          ',')
                                      .split(",")
                                      .length -
                                  2]
                          .split(" ")
                          .last
                      : (widget.model?.detailModel.eventModel.location ?? '')
                  : widget.model?.detailModel.eventModel.onlineUrl ?? '',
              starTime: '${widget.model?.detailModel.eventModel.startTime}',
              endTime: widget.model?.detailModel.eventModel.endTime,
              description:
                  widget.model?.detailModel.eventModel.description ?? '',
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextButton(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {
                  router.push(
                    EventDetailsRoute(
                        eventId: widget.model?.detailModel.eventModel.id ?? ''),
                  );
                },
                child: PrimaryText(
                  l10n.goToEventDetail,
                  style: theme.textTheme.bodyLarge.copyWith(
                    fontWeight: FontWeight.w700,
                    color: MainColors.primary,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 5,
            ),
            width: MediaQuery.of(context).size.width - 40,
            height: 1,
            color: const Color.fromRGBO(53, 56, 63, 1),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: PrimaryText(
                l10n.chat,
                style: theme.textTheme.bodyLarge.copyWith(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          GroupChatMessages(
            groupId: widget.model?.detailModel.id ?? '',
            focusNode: focusNode,
          ),
        ],
      ),
    );
  }
}

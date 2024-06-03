import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:togodo/core/helpers/permission.dart';
import 'package:togodo/ui/chat/screens/chat_room_message.dart';
import 'package:togodo/ui/chat/view_model/message_details_view_model.dart';
import 'package:togodo/ui/chat/view_model/web_socket_notifier.dart';

final PermissionHandlerProvider = Provider<PermissionHandler>(
  (ref) => PermissionHandler(),
);

@RoutePage()
class ChatPage extends StatefulHookConsumerWidget {
  const ChatPage({
    required this.userId,
    required this.name,
    required this.imageUrl,
    required this.isOnline,
    this.roomId,
    this.isProfil = false,
    this.isNotificationRoute = false,
    this.isGroup = false,
    super.key,
  });
  final String userId;
  final String? roomId;
  final String name;
  final String imageUrl;
  final bool isOnline;
  final bool? isProfil;
  final bool isNotificationRoute;
  final bool isGroup;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      listenMessage();
    });

    super.initState();
  }

  Future<void> listenMessage() async {
    final readModel = ref
        .read(messageDetailsProvider(widget.roomId ?? widget.userId).notifier);
    print("is noti route yeni deneme ${widget.isNotificationRoute}");
    if (widget.isNotificationRoute) {
      await ref.read(webSocketProvider.notifier).connect().then(
            (value) => readModel
              ..connect(isSearchRoute: widget.roomId == null)
              ..updateGroupChat(isGroupChat: widget.isGroup),
          );
    } else {
      await readModel.connect(isSearchRoute: widget.roomId == null);
      readModel.updateGroupChat(isGroupChat: widget.isGroup);
    }
  }

  @override
  void dispose() {
    ref
        .read(messageDetailsProvider(widget.roomId ?? widget.userId).notifier)
        .discoonect();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: ChatRoomMessage(
          imageUrl: widget.imageUrl,
          userId: widget.userId,
          isOnline: widget.isOnline,
          name: widget.name,
          isSearchRoute: widget.roomId == null,
          roomId: widget.roomId ?? widget.userId,
          isNotificationRoute: widget.isNotificationRoute,
          isGroup: widget.isGroup,
        ),
      ),
    );
  }
}

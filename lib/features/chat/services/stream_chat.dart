import 'package:flutter/material.dart';
import 'package:for_you/features/chat/chat_screen.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class StreamChat {
  Future<void> createChannel(BuildContext context, String userId) async {
    final core = StreamChatCore.of(context);
    final channel = core.client.channel('messaging', extraData: {
      'members': [
        core.currentUser!.id,
        userId,
      ]
    });
    await channel.watch();

    Navigator.of(context).push(
      ChatScreen.routeWithChannel(channel),
    );
  }
}

import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class UnReadedMessageCounterProvider {
  StreamChatClient client;
  UnReadedMessageCounterProvider(this.client);

  Stream<int> unReadMessageCount() async* {
    yield* client.state.unreadChannelsStream;
  }
}

import 'package:flutter/material.dart';
import 'package:for_you/core/config/Routes/routes.dart';
import 'package:for_you/core/features/auth/Providers/auth_state_provider.dart';
import 'package:provider/provider.dart';
import 'package:stream_chat_flutter_core/stream_chat_flutter_core.dart';

class App extends StatelessWidget {
  final StreamChatClient client;
  const App({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthSataProvider>(
          create: (_) => AuthSataProvider(),
        )
      ],
      child: MaterialApp(
        onGenerateRoute: onGenerateRoute,
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          return StreamChatCore(
            client: client,
            child: ChannelsBloc(
              child: UsersBloc(
                child: child!,
              ),
            ),
          );
        },
        initialRoute: '/',
      ),
    );
  }
}

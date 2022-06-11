import 'package:flutter/material.dart';
import 'package:idttest/modules/chats/view/chat_screen.dart';
import 'package:idttest/modules/messages/view/messages_screen.dart';

class AppRoutes {
  // Route name constants
  static const String messagesScreen = '/messagesScreen';
  static const String chatScreen = '/chatScreen';

  /// The map used to define our routes, needs to be supplied to [MaterialApp]
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      messagesScreen: (context) => const MessagesScreen(),
      chatScreen: (context) => const ChatScreen(),
    };
  }
}

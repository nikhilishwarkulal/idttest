// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idttest/modules/chats/view/widgets/chat_left_cell.dart';

void main() {
  testWidgets('Chat Left Cell Widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: Material(
            child: ChatLeftCell(senderName: "senderName", message: "message"),
          ),
        ),
      ),
    );
    expect(find.text('senderName'), findsOneWidget);
    expect(find.text('message'), findsOneWidget);
    await tester.pump();
  });
}

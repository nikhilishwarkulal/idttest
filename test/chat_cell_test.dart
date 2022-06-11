// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idttest/modules/chats/view/widgets/chat_cell.dart';
import 'package:idttest/modules/chats/view_model/chat_screen_view_model.dart';

void main() {
  testWidgets('Chat Cell  Widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          home: Material(
            child: ChatCell(
              chatCellItem: ChatCellItem(
                modifiedAt: DateTime.now(),
                id: "1234",
                message: "message",
                isLeft: true,
                senderName: "sendname",
                shortDate: "date",
                showDateChanger: false,
              ),
            ),
          ),
        ),
      ),
    );
    expect(find.text("message"), findsOneWidget);
    expect(find.text("sendname"), findsOneWidget);
    await tester.pump();
  });

  testWidgets('Chat Cell Right  Widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          home: Material(
            child: ChatCell(
              chatCellItem: ChatCellItem(
                modifiedAt: DateTime.now(),
                id: "1234",
                message: "message",
                isLeft: false,
                senderName: "sendname",
                shortDate: "date",
                showDateChanger: false,
              ),
            ),
          ),
        ),
      ),
    );
    expect(find.text("message"), findsOneWidget);
    expect(find.text("sendname"), findsNothing);
    await tester.pump();
  });
}

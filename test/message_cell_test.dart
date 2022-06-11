// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idttest/modules/messages/view/widgets/messages_cell.dart';
import 'package:idttest/modules/messages/view_model/message_screen_view_model.dart';

void main() {
  testWidgets('Chat Left Cell Widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MediaQuery(
        data: const MediaQueryData(),
        child: MaterialApp(
          home: Material(
            child: MessagesCell(
              item: MessageScreenCellModel(
                modifiedAt: DateTime.now(),
                members: ["s"],
                topic: "topic",
                shortTimeString: "st",
                lastMessage: "smgs",
                id: "id",
                iconType: CellModelIconType.single,
              ),
            ),
          ),
        ),
      ),
    );
    expect(find.text("topic"), findsOneWidget);
    expect(find.text("smgs"), findsOneWidget);
    expect(find.text("st"), findsOneWidget);
    await tester.pump();
  });
}

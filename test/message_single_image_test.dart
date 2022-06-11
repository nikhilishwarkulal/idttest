// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:idttest/modules/messages/view/widgets/messages_single_image_widget.dart';

void main() {
  testWidgets('Chat Left Cell Widget', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(
      const MediaQuery(
        data: MediaQueryData(),
        child: MaterialApp(
          home: Material(
            child: MessagesSingleImageWidget(),
          ),
        ),
      ),
    );
    expect(find.byType(SvgPicture), findsNWidgets(1));
    await tester.pump();
  });
}

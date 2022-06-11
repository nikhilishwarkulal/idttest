import 'package:flutter/material.dart';
import 'package:idttest/common/app_colors.dart';
import 'package:idttest/common/app_text_style.dart';

import 'chat_single_image.dart';

const double _kTextLeadigSpace = 38;

const double _kBottomSpacing = 16;
const EdgeInsets _kMessagePadding =
    EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8);
const EdgeInsets _kMessageMargin = EdgeInsets.only(left: 8);
const double _kBorderRadiusMessage = 5;

class ChatLeftCell extends StatelessWidget {
  final String message;
  final String senderName;
  const ChatLeftCell({
    Key? key,
    required this.senderName,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(
                  width: _kTextLeadigSpace,
                ),
                getSenderWidget()
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const ChatSingleImage(),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: getMessage(),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: _kBottomSpacing,
            )
          ],
        ),
      ),
    );
  }

  ///[getMessage] get The Message  widget box
  Widget getMessage() {
    return Container(
        margin: _kMessageMargin,
        padding: _kMessagePadding,
        decoration: BoxDecoration(
          color: AppColors.kMessageRecMessage,
          borderRadius: BorderRadius.circular(_kBorderRadiusMessage),
        ),
        child: Text(
          message,
          style: AppTextStyle.kChatCellChats,
        ));
  }

  ///[getSenderWidget] sender name Widget
  Widget getSenderWidget() {
    return Text(
      senderName,
      style: AppTextStyle.kMessageCellDate,
    );
  }
}

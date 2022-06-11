import 'package:flutter/material.dart';
import 'package:idttest/common/app_colors.dart';
import 'package:idttest/common/app_text_style.dart';

const double _kBottomSpacing = 16;
const EdgeInsets _kMessagePadding =
    EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8);
const EdgeInsets _kMessageMargin = EdgeInsets.only(left: 8);
const double _kBorderRadiusMessage = 5;

class ChatRightCell extends StatelessWidget {
  final String message;
  const ChatRightCell({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.topRight,
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
          color: AppColors.kMessageSndMessage,
          borderRadius: BorderRadius.circular(_kBorderRadiusMessage),
        ),
        child: Text(
          message,
          style: AppTextStyle.kChatCellChats,
        ));
  }
}

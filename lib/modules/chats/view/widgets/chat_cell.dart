import 'package:flutter/material.dart';
import 'package:idttest/modules/chats/view/widgets/chat_left_cell.dart';
import 'package:idttest/modules/chats/view/widgets/chat_right_cell.dart';
import 'package:idttest/modules/chats/view_model/chat_screen_view_model.dart';

const EdgeInsets _kContentPadding = EdgeInsets.symmetric(horizontal: 18);

class ChatCell extends StatelessWidget {
  const ChatCell({
    Key? key,
    required this.chatCellItem,
  }) : super(key: key);
  final ChatCellItem chatCellItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: _kContentPadding,
      child: chatCellItem.isLeft
          ? ChatLeftCell(
              senderName: chatCellItem.senderName,
              message: chatCellItem.message)
          : ChatRightCell(
              message: chatCellItem.message,
            ),
    );
  }
}

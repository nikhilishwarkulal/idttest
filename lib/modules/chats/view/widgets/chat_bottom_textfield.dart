import 'package:flutter/material.dart';

const double _kChatBottomTectFieldHeight = 50;
const double _kLeftPadding = 18;
const EdgeInsets _kTextFiledPadding = EdgeInsets.only(left: 20, right: 20);
const double _kCircularRadius = 25;
const double _kSizePendingSize = 60;

class ChatBottomTextField extends StatelessWidget {
  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final Function() onSend;

  const ChatBottomTextField({
    Key? key,
    required this.textEditingController,
    required this.focusNode,
    required this.onSend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).padding.bottom + 8,
      ),
      height: _kChatBottomTectFieldHeight,
      child: Row(
        children: [
          Container(
            width: _kLeftPadding,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(0xFFECECEC),
                  borderRadius: BorderRadius.circular(_kCircularRadius)),
              padding: _kTextFiledPadding,
              child: TextField(
                decoration: const InputDecoration.collapsed(
                  hintText: "",
                  border: InputBorder.none,
                ),
                expands: true,
                textAlignVertical: TextAlignVertical.center,
                controller: textEditingController,
                focusNode: focusNode,
                minLines: null,
                maxLines: null,
              ),
            ),
          ),
          InkWell(
            child: GestureDetector(
              onTap: onSend,
              child: const SizedBox(
                width: _kSizePendingSize,
                height: _kSizePendingSize,
                child: Icon(Icons.send),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

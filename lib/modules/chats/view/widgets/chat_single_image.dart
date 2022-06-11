import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double _kChatCellImageSize = 30;

class ChatSingleImage extends StatelessWidget {
  const ChatSingleImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/svg/guy.svg",
      height: _kChatCellImageSize,
      width: _kChatCellImageSize,
    );
  }
}

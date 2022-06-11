import 'package:flutter/material.dart';
import 'package:idttest/common/app_colors.dart';

class AppTextStyle {
  ///[kAppBarHeader] used in App Bar Header
  static const TextStyle kAppBarHeader = TextStyle(
    fontSize: 18,
    color: AppColors.kWhite,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.25,
  );

  ///[kMessageCellDescription] Message cell Chat Message
  static const TextStyle kMessageCellDescription = TextStyle(
    color: Color(0xFF505254),
    fontWeight: FontWeight.w400,
    overflow: TextOverflow.ellipsis,
    fontSize: 15,
  );

  ///[kChatCellChats] is used to show chat
  static const TextStyle kChatCellChats = TextStyle(
    color: Color(0xFF505254),
    fontWeight: FontWeight.w400,
    fontSize: 15,
  );

  ///[kMessageCellTitle] is used to show Message Cell Title
  static const TextStyle kMessageCellTitle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w500,
    overflow: TextOverflow.ellipsis,
    fontSize: 16,
  );

  ///[kMessageCellDate] is used to show Message Cell date
  static const TextStyle kMessageCellDate = TextStyle(
    color: Color(0xFF686A6C),
    fontWeight: FontWeight.w400,
    fontSize: 13,
  );
}

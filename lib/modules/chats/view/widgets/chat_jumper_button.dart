import 'package:flutter/material.dart';
import 'package:idttest/common/app_colors.dart';

const double _kJumperSize = 50;

class ChatJumperButton extends StatelessWidget {
  const ChatJumperButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: _kJumperSize,
      height: _kJumperSize,
      child: Icon(
        Icons.arrow_circle_down_sharp,
        size: _kJumperSize,
        color: AppColors.kPrimary,
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double _kMessageImageSize = 50;
const double _kMessageSmallImageSize = 35;

class MessagesMultiImageWidget extends StatelessWidget {
  const MessagesMultiImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _kMessageImageSize,
      width: _kMessageImageSize,
      child: Stack(
        children: [
          Positioned(
            right: 0,
            top: 0,
            child: SvgPicture.asset(
              "assets/svg/guy.svg",
              height: _kMessageSmallImageSize,
              width: _kMessageSmallImageSize,
            ),
          ),
          Positioned(
            left: 0,
            bottom: 0,
            child: SvgPicture.asset(
              "assets/svg/girl.svg",
              height: _kMessageSmallImageSize,
              width: _kMessageSmallImageSize,
            ),
          ),
        ],
      ),
    );
  }
}

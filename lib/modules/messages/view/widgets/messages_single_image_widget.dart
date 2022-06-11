import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

const double _kMessageImageSize = 50;

class MessagesSingleImageWidget extends StatelessWidget {
  const MessagesSingleImageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/svg/guy.svg",
      height: _kMessageImageSize,
      width: _kMessageImageSize,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:idttest/common/app_text_style.dart';

import '../../view_model/message_screen_view_model.dart';
import 'messages_multi_image_widget.dart';
import 'messages_single_image_widget.dart';

const double _kMessageCellHeight = 50;

const EdgeInsets _kMessageCellMargin = EdgeInsets.all(18);
const EdgeInsets _kMessageContentPadding =
    EdgeInsets.only(left: 18, top: 4, bottom: 4);

class MessagesCell extends StatelessWidget {
  final MessageScreenCellModel item;
  final Function()? onTap;
  const MessagesCell({Key? key, required this.item, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: _kMessageCellMargin,
        height: _kMessageCellHeight,
        child: Row(
          children: [
            getIconBasedOnType(item.iconType),
            Expanded(child: getContent()),
            getDateWidget(),
          ],
        ),
      ),
    );
  }

  ///[CellModelIconType] show profile icon based on type
  ///[single] or [multi]
  Widget getIconBasedOnType(CellModelIconType type) {
    switch (type) {
      case CellModelIconType.single:
        return const MessagesSingleImageWidget();
      case CellModelIconType.multi:
        return const MessagesMultiImageWidget();
    }
  }

  ///[getDateWidget] trailing date in Message screen cell item
  Widget getDateWidget() {
    return Text(
      item.shortTimeString,
      style: AppTextStyle.kMessageCellDate,
    );
  }

  ///[getContent] widget text in between the Image and date
  Widget getContent() {
    return Padding(
      padding: _kMessageContentPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.topic,
            style: AppTextStyle.kMessageCellTitle,
          ),
          Text(
            item.lastMessage,
            style: AppTextStyle.kMessageCellDescription,
          )
        ],
      ),
    );
  }
}

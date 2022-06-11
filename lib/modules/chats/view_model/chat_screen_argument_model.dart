import '../../messages/view_model/message_screen_view_model.dart';

class ChatScreenArgumentModel {
  String id;
  String lastMessage;
  List<String> members;
  String topic;
  DateTime modifiedAt;
  String shortTimeString;
  CellModelIconType iconType;
  ChatScreenArgumentModel({
    required this.id,
    required this.lastMessage,
    required this.members,
    required this.modifiedAt,
    required this.topic,
    required this.shortTimeString,
    required this.iconType,
  });

  ///[MessageScreenCellModel] map the model from Message screen model.
  ///[ChatScreenArgumentModel] return type of factory method
  ///
  factory ChatScreenArgumentModel.fromMessages(MessageScreenCellModel model) {
    return ChatScreenArgumentModel(
      iconType: model.iconType,
      id: model.id,
      lastMessage: model.lastMessage,
      modifiedAt: model.modifiedAt,
      shortTimeString: model.shortTimeString,
      topic: model.topic,
      members: model.members.toList(),
    );
  }
}

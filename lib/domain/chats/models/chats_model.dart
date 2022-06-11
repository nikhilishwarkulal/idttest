// To parse this JSON data, do
//
//     final messageData = messageDataFromMap(jsonString);

import 'dart:convert';

class ChatsData {
  List<ChatItemData>? members;
  ChatsData({
    this.members,
  });

  factory ChatsData.fromJson(String str) {
    List<dynamic> data = json.decode(str);
    return ChatsData(
        members: List<ChatItemData>.generate(data.length, (index) {
      return ChatItemData.fromMap(data.elementAt(index));
    }));
  }
}

class ChatItemData {
  ChatItemData({
    this.id,
    this.message,
    this.modifiedAt,
    this.sender,
  });

  String? id;
  String? message;
  int? modifiedAt;
  String? sender;

  factory ChatItemData.fromJson(String str) =>
      ChatItemData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ChatItemData.fromMap(Map<String, dynamic> json) => ChatItemData(
        id: json["id"],
        message: json["message"],
        modifiedAt: json["modified_at"],
        sender: json["sender"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "message": message,
        "modified_at": modifiedAt,
        "sender": sender,
      };
}

// To parse this JSON data, do
//
//     final messageData = messageDataFromMap(jsonString);

import 'dart:convert';

class MessagesData {
  List<MessagesDataItem>? members;
  MessagesData({
    this.members,
  });

  factory MessagesData.fromJson(String str) {
    List<dynamic> data = json.decode(str);
    return MessagesData(
        members: List<MessagesDataItem>.generate(data.length, (index) {
      return MessagesDataItem.fromMap(data.elementAt(index));
    }));
  }
}

class MessagesDataItem {
  MessagesDataItem({
    this.id,
    this.lastMessage,
    this.members,
    this.topic,
    this.modifiedAt,
  });

  String? id;
  String? lastMessage;
  List<String>? members;
  String? topic;
  int? modifiedAt;

  factory MessagesDataItem.fromJson(String str) =>
      MessagesDataItem.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory MessagesDataItem.fromMap(Map<String, dynamic> json) =>
      MessagesDataItem(
        id: json["id"],
        lastMessage: json["last_message"],
        members: json["members"] == null
            ? null
            : List<String>.from(json["members"].map((x) => x)),
        topic: json["topic"],
        modifiedAt: json["modified_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "last_message": lastMessage,
        "members": members == null
            ? null
            : List<dynamic>.from(members?.map((x) => x) ?? []),
        "topic": topic,
        "modified_at": modifiedAt,
      };
}

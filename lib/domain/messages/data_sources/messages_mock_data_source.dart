import '../models/messages_data_argument_model.dart';
import '../models/messages_model.dart';
import 'messages_remote_data_source.dart';

/// [MessagesMockDataSourceImpl] will contain the MessagesMockDataSourceImpl implementation.
class MessagesMockDataSourceImpl implements MessagesDataSource {
  MessagesMockDataSourceImpl();
  static String getMockData() {
    return _responseMock;
  }

  /// Call API to get the Message Screen details.
  /// [Either<ServerException, MessagesData>] to handle the Failure or result data.
  @override
  Future<MessagesData> getMessageData(
      {required MessagesDataArgumentModel argumentModel}) async {
    await Future.delayed(const Duration(seconds: 2));
    return MessagesData.fromJson(_responseMock);
  }
}

var _responseMock = """
[
  {
    "id": "9991",
    "last_message": "How about tomorrow then?",
    "members": [
      "John",
      "Daniel",
      "Rachel"
    ],
    "topic": "pizza night",
    "modified_at": 1654949250036
  },
  {
    "id": "9992",
    "last_message": "I will send them to you asap",
    "members": [
      "Raphael"
    ],
    "topic": "slides",
    "modified_at": 1599000026153
  },
  {
    "id": "9993",
    "last_message": "Can you please?",
    "members": [
      "Mum",
      "Dad",
      "Bro"
    ],
    "topic": "pictures",
    "modified_at": 1512814026153
  }
]
""";

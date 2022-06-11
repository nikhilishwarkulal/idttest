import 'package:idttest/domain/chats/data_sources/chats_remote_data_source.dart';
import 'package:idttest/domain/chats/models/chats_data_argument_model.dart';
import 'package:idttest/domain/chats/models/chats_model.dart';

class ChatsMockDataSourceImpl implements ChatsDataSource {
  ChatsMockDataSourceImpl();
  static String getMockData() {
    return _responseMock;
  }

  /// Mock response given to The mobile screen.
  /// [Either<ServerException, ChatsData>] to handle the Failure or result data.
  @override
  Future<ChatsData> getChatData(
      {required ChatsDataArgumentModel argumentModel}) async {
    await Future.delayed(const Duration(seconds: 2));
    return ChatsData.fromJson(_responseMock);
  }
}

var _responseMock = """
[
  {
    "id": "1003",
    "message": "How about tomorrow then?",
    "modified_at": 1599814026153,
    "sender": "John"
  },
  {
    "id": "1002",
    "message": "Sorry I can't today",
    "modified_at": 1599814006153,
    "sender": "Daniel"
  },
  {
    "id": "1001",
    "message": "Hei how about some pizza tonight?",
    "modified_at": 1599813006153,
    "sender": "John"
  }
]
""";

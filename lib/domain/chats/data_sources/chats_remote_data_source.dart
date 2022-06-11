import 'package:idttest/common/app_constants.dart';
import 'package:idttest/core/dio/dio.dart';
import 'package:idttest/core/exception/exception.dart';
import 'package:idttest/domain/chats/models/chats_data_argument_model.dart';
import 'package:idttest/domain/chats/models/chats_model.dart';

/// Interface for Chat Data remote data source.
abstract class ChatsDataSource {
  /// Call API to get the Chat Screen.
  /// [Either<ServerException, ChatsData>] to handle the Failure or result data.
  Future<ChatsData> getChatData(
      {required ChatsDataArgumentModel argumentModel});
}

/// [MessagesRemoteDataSourceImpl] will contain the MessagesRemoteDataSourceImpl implementation.
class MessagesRemoteDataSourceImpl implements ChatsDataSource {
  CustomDio? customDio;

  MessagesRemoteDataSourceImpl({CustomDio? dio}) {
    if (dio == null) {
      customDio = CustomDioImpl(baseUrl: "${AppConstants.baseUrl}/inbox.json");
    } else {
      customDio = dio;
    }
  }

  /// Call API to get the chat Screen details.
  ///
  /// [Either<ServerException, ChatsData>] to handle the Failure or result data.
  @override
  Future<ChatsData> getChatData(
      {required ChatsDataArgumentModel argumentModel}) async {
    try {
      final String? result = await customDio?.callApi(
          customUrl: "${AppConstants.baseUrl}/${argumentModel.chatId}.json");
      if (result == null) {
        throw ServerException.failure();
      }
      return ChatsData.fromJson(result);
    } catch (ex) {
      throw ServerException.failure();
    }
  }
}

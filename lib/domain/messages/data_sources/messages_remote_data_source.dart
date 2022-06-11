import 'package:idttest/common/app_constants.dart';
import 'package:idttest/core/dio/dio.dart';

import '../../../core/exception/exception.dart';
import '../models/messages_data_argument_model.dart';
import '../models/messages_model.dart';

/// Interface for Message Data remote data source.
abstract class MessagesDataSource {
  /// Call API to get the Message Screen details.
  /// [Either<ServerException, MessagesData>] to handle the Failure or result data.
  Future<MessagesData> getMessageData(
      {required MessagesDataArgumentModel argumentModel});
}

/// [MessagesRemoteDataSourceImpl] will contain the MessagesRemoteDataSourceImpl implementation.
class MessagesRemoteDataSourceImpl implements MessagesDataSource {
  CustomDio? customDio;

  MessagesRemoteDataSourceImpl({CustomDio? dio}) {
    if (dio == null) {
      customDio = CustomDioImpl(baseUrl: "${AppConstants.baseUrl}/inbox.json");
    } else {
      customDio = dio;
    }
  }

  /// Call API to get the Message Screen details.
  ///
  /// [Either<ServerException, MessagesData>] to handle the Failure or result data.
  @override
  Future<MessagesData> getMessageData(
      {required MessagesDataArgumentModel argumentModel}) async {
    try {
      final String? result = await customDio?.callApi();
      if (result == null) {
        throw ServerException.failure();
      }
      return MessagesData.fromJson(result);
    } catch (ex) {
      throw ServerException.failure();
    }
  }
}

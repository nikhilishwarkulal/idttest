import 'package:either_dart/either.dart';
import 'package:idttest/core/exception/exception.dart';
import 'package:idttest/domain/messages/data_sources/messages_remote_data_source.dart';
import 'package:idttest/domain/messages/models/messages_data_argument_model.dart';

import '../models/messages_model.dart';

/// Interface for [MessagesRepository] repository.
abstract class MessagesRepository {
  /// Call API to get the Message Screen details.
  ///
  /// [Either<ServerException, MessagesData>] to handle the Failure or result data.
  Future<Either<ServerException, MessagesData>> getMessageData(
      {required MessagesDataArgumentModel argumentModel});
}

/// MessagesRepositoryImpl will contain the MessagesRepositoryImpl implementation.
class MessagesRepositoryImpl implements MessagesRepository {
  MessagesDataSource? messageRemoteDataSource;

  /// Dependence injection via constructor
  MessagesRepositoryImpl({MessagesDataSource? remoteDataSource}) {
    if (remoteDataSource == null) {
      messageRemoteDataSource = MessagesRemoteDataSourceImpl();
      //messageRemoteDataSource = MessagesMockDataSourceImpl();
    } else {
      messageRemoteDataSource = remoteDataSource;
    }
  }

  /// Call API to get the Message Screen details.
  ///
  /// [MessagesDataArgumentModel] to get the Message Data for users.
  /// [Either<ServerException, MessagesData>] to handle the Failure or result data.
  @override
  Future<Either<ServerException, MessagesData>> getMessageData(
      {required MessagesDataArgumentModel argumentModel}) async {
    try {
      final splashResult = await messageRemoteDataSource?.getMessageData(
          argumentModel: argumentModel);
      return Right(splashResult!);
    } on ServerException catch (error) {
      return Left(error);
    }
  }
}

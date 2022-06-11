import 'package:either_dart/either.dart';
import 'package:idttest/core/exception/exception.dart';
import 'package:idttest/domain/chats/data_sources/chats_remote_data_source.dart';
import 'package:idttest/domain/chats/models/chats_data_argument_model.dart';
import 'package:idttest/domain/chats/models/chats_model.dart';

/// Interface for [ChatsRepository] repository.
abstract class ChatsRepository {
  /// Call API to get the Chat Screen.
  ///
  /// [Either<ServerException, ChatsData>] to handle the Failure or result data.
  Future<Either<ServerException, ChatsData>> getChatData(
      {required ChatsDataArgumentModel argumentModel});
}

/// [ChatsRepositoryImpl] will contain the ChatsRepositoryImpl implementation.
class ChatsRepositoryImpl implements ChatsRepository {
  ChatsDataSource? chatRemoteDataSource;

  /// Dependence injection via constructor
  ChatsRepositoryImpl({ChatsDataSource? remoteDataSource}) {
    if (remoteDataSource == null) {
      chatRemoteDataSource = MessagesRemoteDataSourceImpl();
      //chatRemoteDataSource = ChatsMockDataSourceImpl();
    } else {
      chatRemoteDataSource = remoteDataSource;
    }
  }

  /// Call API to get the chat Screen.
  ///
  /// [ChatsDataArgumentModel] to get the Chat Data for users.
  /// [Either<ServerException, ChatsData>] to handle the Failure or result data.
  @override
  Future<Either<ServerException, ChatsData>> getChatData(
      {required ChatsDataArgumentModel argumentModel}) async {
    try {
      final splashResult =
          await chatRemoteDataSource?.getChatData(argumentModel: argumentModel);
      return Right(splashResult!);
    } on ServerException catch (error) {
      return Left(error);
    }
  }
}

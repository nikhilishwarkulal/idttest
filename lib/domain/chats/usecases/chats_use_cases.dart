import 'package:either_dart/either.dart';
import 'package:idttest/core/exception/exception.dart';
import 'package:idttest/domain/chats/models/chats_data_argument_model.dart';
import 'package:idttest/domain/chats/models/chats_model.dart';
import 'package:idttest/domain/chats/repositories/chats_repository_impl.dart';

/// Interface for [ChatsUseCases] cases.
abstract class ChatsUseCases {
  /// Call API to get the chat Screen.
  ///
  /// [Either<ServerException, ChatsData>] to handle the Failure or result data.
  Future<Either<ServerException, ChatsData>?> getChatData(
      {required ChatsDataArgumentModel argumentModel});
}

/// [ChatsUseCasesImpl] will contain the [ChatsUseCasesImpl] implementation.
class ChatsUseCasesImpl implements ChatsUseCases {
  ChatsRepository? messageRepository;

  /// Dependence injection via constructor
  ChatsUseCasesImpl({ChatsRepository? repository}) {
    if (repository == null) {
      messageRepository = ChatsRepositoryImpl();
    } else {
      messageRepository = repository;
    }
  }

  /// Call API to get the Chat Screen.
  ///
  /// [Either<ServerException, ChatsData>] to handle the Failure or result data.
  @override
  Future<Either<ServerException, ChatsData>?> getChatData(
      {required ChatsDataArgumentModel argumentModel}) async {
    return await messageRepository?.getChatData(argumentModel: argumentModel);
  }
}

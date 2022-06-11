import 'package:either_dart/either.dart';
import 'package:idttest/core/exception/exception.dart';

import '../models/messages_data_argument_model.dart';
import '../models/messages_model.dart';
import '../repositories/messages_repository_impl.dart';

/// Interface for Message use cases.
abstract class MessagesUseCases {
  /// Call API to get the Message Screen details.
  ///
  /// [Either<ServerException, MessagesData>] to handle the Failure or result data.
  Future<Either<ServerException, MessagesData>?> getMessageData(
      {required MessagesDataArgumentModel argumentModel});
}

/// [MessagesUseCasesImpl] will contain the MessagesUseCasesImpl implementation.
class MessagesUseCasesImpl implements MessagesUseCases {
  MessagesRepository? messageRepository;

  /// Dependence injection via constructor
  MessagesUseCasesImpl({MessagesRepository? repository}) {
    if (repository == null) {
      messageRepository = MessagesRepositoryImpl();
    } else {
      messageRepository = repository;
    }
  }

  /// Call API to get the Message Screen Details details.
  ///
  /// [Either<ServerException, MessagesData>] to handle the Failure or result data.
  @override
  Future<Either<ServerException, MessagesData>?> getMessageData(
      {required MessagesDataArgumentModel argumentModel}) async {
    return await messageRepository?.getMessageData(
        argumentModel: argumentModel);
  }
}

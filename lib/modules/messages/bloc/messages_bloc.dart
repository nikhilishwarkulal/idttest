import 'package:either_dart/either.dart';
import 'package:idttest/core/bloc/bloc.dart';
import 'package:idttest/core/exception/exception.dart';
import 'package:idttest/domain/messages/models/messages_data_argument_model.dart';
import 'package:idttest/domain/messages/models/messages_model.dart';
import 'package:idttest/domain/messages/usecases/messages_use_cases.dart';
import 'package:idttest/modules/messages/view_model/message_screen_view_model.dart';

class MessagesBloc extends Bloc<MessageScreenViewModel> {
  @override
  MessageScreenViewModel initDefaultValue() {
    return MessageScreenViewModel.empty();
  }

  void getAllMessages() async {
    ///[MessagesUseCases] use case declaration
    MessagesUseCases messagesUseCases = MessagesUseCasesImpl();
    state.messageScreenState = MessageScreenState.loading;

    ///[loading] set the Ui As loading
    emit(state);
    Either<ServerException, MessagesData?>? data = await messagesUseCases
        .getMessageData(argumentModel: MessagesDataArgumentModel());
    if (data?.isLeft ?? true) {
      state.messageScreenState = MessageScreenState.failure;

      ///[loading] set the Ui As failure
      emit(state);
      return;
    }
    state.cellModel = List<MessageScreenCellModel>.generate(
        data?.right?.members?.length ?? 0, (index) {
      return MessageScreenCellModel.fromDomain(
          data!.right!.members!.elementAt(index));
    });

    state.messageScreenState = MessageScreenState.success;

    ///[loading] set the Ui As success
    emit(state);
  }
}

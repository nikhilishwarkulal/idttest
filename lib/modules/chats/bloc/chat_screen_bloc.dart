import 'package:either_dart/either.dart';
import 'package:flutter/material.dart';
import 'package:idttest/common/fake_message_generator.dart';
import 'package:idttest/core/bloc/bloc.dart';
import 'package:idttest/core/exception/exception.dart';
import 'package:idttest/domain/chats/models/chats_data_argument_model.dart';
import 'package:idttest/domain/chats/models/chats_model.dart';
import 'package:idttest/domain/chats/usecases/chats_use_cases.dart';
import 'package:idttest/modules/chats/view_model/chat_screen_argument_model.dart';
import 'package:idttest/modules/chats/view_model/chat_screen_view_model.dart';

class ChatScreenBloc extends Bloc<ChatScreenViewModel> {
  @override
  ChatScreenViewModel initDefaultValue() {
    return ChatScreenViewModel.initial();
  }

  void loadChatMessages(ChatScreenArgumentModel argumentModel) async {
    ///[loading] set the Ui As loading
    state.chatScreenViewModelState = ChatScreenViewModelState.loading;
    emit(state);

    ///[ChatsUseCasesImpl] use case declaration
    ChatsUseCases chatsUseCases = ChatsUseCasesImpl();
    Either<ServerException, ChatsData?>? data = await chatsUseCases.getChatData(
        argumentModel: ChatsDataArgumentModel(chatId: argumentModel.id));

    if (data?.isLeft ?? true) {
      state.chatScreenViewModelState = ChatScreenViewModelState.failure;

      ///[loading] set the Ui As failure
      emit(state);
    }

    List<ChatCellItem> items =
        List<ChatCellItem>.generate(data?.right?.members?.length ?? 0, (index) {
      return ChatCellItem.fromChatItemData(
          data!.right!.members!.elementAt(index));
    });

    state.chatCell = items.where((element) {
      return element.message.trim().isNotEmpty;
    }).toList();
    state.chatScreenViewModelState = ChatScreenViewModelState.success;

    ///[loading] set the Ui As success
    emit(state);
  }

  ///[addChatToCell] this will send a chat message which user typed
  ///[ScrollController] will scroll down to end of the
  ///[String] msg typed by user.
  void addChatToCell(String msg, ScrollController controller) {
    if (msg.trim().isEmpty) {
      return;
    }
    state.chatCell.add(ChatCellItem(
      modifiedAt: DateTime.now(),
      id: "1234",
      message: msg,
      senderName: "senderName",
      shortDate: "shortDate",
      showDateChanger: false,
      isLeft: false,
    ));
    emit(state);
    jumpToEnd(controller);
    Future.delayed(
      const Duration(seconds: 2),
      () {
        sendDelayedRandomMessage(controller);
      },
    );
  }

  ///[sendDelayedRandomMessage] this will send a delayed bot message to user
  ///[ScrollController] will scroll down to end of the
  void sendDelayedRandomMessage(ScrollController controller) {
    state.chatCell.add(ChatCellItem(
      modifiedAt: DateTime.now(),
      id: "1234",
      message: FakeMessageGenerator.getRandomMessage(),
      senderName: "Lake",
      shortDate: "shortDate",
      showDateChanger: false,
      isLeft: true,
    ));
    emit(state);
    jumpToEnd(controller);
  }

  double oldScollingOffset = 0;

  ///[jumpToEnd] will scroll down to the end of the chat
  ///[ScrollController] will scroll down to end of the
  ///Screen [milliseconds] delay to scroll to bottom
  ///Logic : Will only scroll to bottom if the chat is moved to end
  void jumpToEnd(ScrollController controller, {int? milliseconds}) {
    Future.delayed(
      Duration(milliseconds: milliseconds ?? 300),
      () {
        if (oldScollingOffset == controller.offset) {
          controller.jumpTo(controller.position.maxScrollExtent);
          state.jumperController.jump(controller);
        } else {
          state.jumperController.unJump();
        }
        oldScollingOffset = controller.position.maxScrollExtent;
      },
    );
  }
}

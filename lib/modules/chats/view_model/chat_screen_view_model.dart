import 'package:idttest/common/date_time_helper.dart';
import 'package:idttest/domain/chats/models/chats_model.dart';
import 'package:idttest/modules/chats/bloc/jumper_controller.dart';

class ChatScreenViewModel {
  ChatScreenViewModelState chatScreenViewModelState;
  List<ChatCellItem> chatCell;
  JumperController jumperController = JumperController();
  ChatScreenViewModel({
    required this.chatCell,
    this.chatScreenViewModelState = ChatScreenViewModelState.initial,
  });
  factory ChatScreenViewModel.initial() {
    return ChatScreenViewModel(
      chatCell: [],
      chatScreenViewModelState: ChatScreenViewModelState.initial,
    );
  }
}

class ChatCellItem {
  String id;
  String message;
  DateTime modifiedAt;
  String shortDate;
  bool showDateChanger;
  String senderName;
  bool isLeft;
  ChatCellItem({
    required this.modifiedAt,
    required this.id,
    required this.message,
    required this.senderName,
    required this.shortDate,
    required this.showDateChanger,
    required this.isLeft,
  });

  ///[ChatItemData] map the model from api response model.
  ///[ChatCellItem] return type of factory method
  ///
  factory ChatCellItem.fromChatItemData(ChatItemData chatItemData) {
    return ChatCellItem(
      modifiedAt: DateTime.fromMillisecondsSinceEpoch(
        chatItemData.modifiedAt ?? 0,
        isUtc: true,
      ),
      id: chatItemData.id ?? "",
      message: chatItemData.message ?? "",
      senderName: chatItemData.sender ?? "",
      shortDate: DateTimeHelper.getBestDateTime(
        DateTime.fromMillisecondsSinceEpoch(
          chatItemData.modifiedAt ?? 0,
        ),
      ),
      showDateChanger: false,
      isLeft: true,
    );
  }
}

///[ChatScreenViewModelState] display Screen state based on api cal;
///[intial] starting state
///[loading]api is still loading
///[failure]api call failed for some reason
///[success]api call success.
enum ChatScreenViewModelState {
  initial,
  loading,
  success,
  failure,
}

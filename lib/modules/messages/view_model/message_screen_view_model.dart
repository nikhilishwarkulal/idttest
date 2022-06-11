import 'package:idttest/common/date_time_helper.dart';
import 'package:idttest/domain/messages/models/messages_model.dart';

class MessageScreenViewModel {
  List<MessageScreenCellModel> cellModel;
  MessageScreenState messageScreenState;
  MessageScreenViewModel({
    required this.cellModel,
    this.messageScreenState = MessageScreenState.initial,
  });
  factory MessageScreenViewModel.empty() {
    return MessageScreenViewModel(
      cellModel: [],
    );
  }
}

class MessageScreenCellModel {
  String id;
  String lastMessage;
  List<String> members;
  String topic;
  DateTime modifiedAt;
  String shortTimeString;
  CellModelIconType iconType;
  MessageScreenCellModel({
    required this.id,
    required this.lastMessage,
    required this.members,
    required this.modifiedAt,
    required this.topic,
    required this.shortTimeString,
    required this.iconType,
  });

  ///[MessagesDataItem] map the model from api response model.
  ///[MessageScreenCellModel] return type of factory method
  ///
  factory MessageScreenCellModel.fromDomain(MessagesDataItem dataItem) {
    return MessageScreenCellModel(
      members: dataItem.members?.toList() ?? [],
      topic: dataItem.topic ?? "",
      shortTimeString: DateTimeHelper.getBestDateTime(
        DateTime.fromMillisecondsSinceEpoch(
          dataItem.modifiedAt ?? 0,
        ),
      ),
      modifiedAt: DateTime.fromMillisecondsSinceEpoch(
        dataItem.modifiedAt ?? 0,
        isUtc: true,
      ),
      lastMessage: dataItem.lastMessage ?? "",
      id: dataItem.id ?? "",
      iconType: (dataItem.members ?? []).length > 1
          ? CellModelIconType.multi
          : CellModelIconType.single,
    );
  }
}

///[CellModelIconType] display cell with 2 images if there are 2 or more members
///display 1 image if there is 1 member.
enum CellModelIconType {
  single,
  multi,
}

///[MessageScreenState] display Screen state based on api cal;
///[intial] starting state
///[loading]api is still loading
///[failure]api call failed for some reason
///[success]api call success.
enum MessageScreenState {
  initial,
  loading,
  failure,
  success,
}

import 'package:flutter/material.dart';
import 'package:idttest/common/app_text_style.dart';
import 'package:idttest/common/i18n/app_localisation_strings.dart';
import 'package:idttest/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:idttest/common/widgets/custom_app_bar/custom_app_bar_actions.dart';
import 'package:idttest/common/widgets/error_screen/error_screen.dart';
import 'package:idttest/common/widgets/loading_screen/error_screen.dart';
import 'package:idttest/core/bloc/bloc_builder.dart';
import 'package:idttest/core/translation/localisation.dart';
import 'package:idttest/modules/chats/bloc/chat_screen_bloc.dart';
import 'package:idttest/modules/chats/view/widgets/chat_bottom_textfield.dart';
import 'package:idttest/modules/chats/view/widgets/chat_cell.dart';
import 'package:idttest/modules/chats/view_model/chat_screen_argument_model.dart';
import 'package:idttest/modules/chats/view_model/chat_screen_view_model.dart';

import 'widgets/chat_jumper_button.dart';

const EdgeInsets _kChatTopPadding = EdgeInsets.only(top: 18);

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ChatScreenArgumentModel argumentModel;
  final ChatScreenBloc chatScreenBloc = ChatScreenBloc();
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  final FocusNode focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      argumentModel =
          ModalRoute.of(context)?.settings.arguments as ChatScreenArgumentModel;
      chatScreenBloc.loadChatMessages(argumentModel);
    });
    scrollController.addListener(() {
      if (scrollController.offset >=
          scrollController.position.maxScrollExtent - 5) {
        chatScreenBloc.state.jumperController.jumpNoScroll();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          textWidget: BlocBuilder(
              bloc: chatScreenBloc,
              builder: () {
                if (chatScreenBloc.state.chatScreenViewModelState ==
                    ChatScreenViewModelState.initial) {
                  return Text(
                    getTranslated(AppLocalizationsStrings.chatAppBarTitle),
                    style: AppTextStyle.kAppBarHeader,
                  );
                }
                return Text(
                  argumentModel.topic,
                  style: AppTextStyle.kAppBarHeader,
                );
              }),
          leadingActions: const {
            LeadingAppBarActions.back,
          },
          trailingActions: const {
            TrailingAppBarActions.search,
          },
          onLeadingActionClicked: (item) {
            Navigator.pop(context);
          },
        ),
        body: Stack(
          children: [
            getMainWidget(),
            Positioned(
              bottom: 100,
              right: 20,
              child: BlocBuilder(
                  bloc: chatScreenBloc.state.jumperController,
                  builder: () {
                    if (!chatScreenBloc.state.jumperController.state) {
                      return const SizedBox();
                    }
                    return InkWell(
                      onTap: () => chatScreenBloc.state.jumperController
                          .jump(scrollController),
                      child: const ChatJumperButton(),
                    );
                  }),
            ),
          ],
        ));
  }

  Widget getMainWidget() {
    return BlocBuilder(
        bloc: chatScreenBloc,
        builder: () {
          switch (chatScreenBloc.state.chatScreenViewModelState) {
            case ChatScreenViewModelState.success:
              return getSuccessScreen();
            case ChatScreenViewModelState.failure:
              return getErrorScreen();
            case ChatScreenViewModelState.loading:
              return const LoadingScreen();
            case ChatScreenViewModelState.initial:
              return const SizedBox();
          }
        });
  }

  Widget getSuccessScreen() {
    return Column(
      children: [
        Expanded(
          child: getChatLister(),
        ),
        ChatBottomTextField(
            textEditingController: textEditingController,
            focusNode: focusNode,
            onSend: () {
              chatScreenBloc.addChatToCell(
                  textEditingController.text, scrollController);
              textEditingController.text = "";
            }),
      ],
    );
  }

  Widget getErrorScreen() {
    return RefreshIndicator(
        onRefresh: () async {
          chatScreenBloc.loadChatMessages(argumentModel);
        },
        child: ListView(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top -
                    50,
                child: const ErrorScreen()),
          ],
        ));
  }

  Widget getChatLister() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ListView.builder(
        controller: scrollController,
        padding: _kChatTopPadding,
        itemBuilder: (context, index) {
          return ChatCell(
            chatCellItem: chatScreenBloc.state.chatCell.elementAt(index),
          );
        },
        itemCount: chatScreenBloc.state.chatCell.length,
      ),
    );
  }
}

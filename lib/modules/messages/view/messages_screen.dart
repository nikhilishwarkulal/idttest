import 'package:flutter/material.dart';
import 'package:idttest/common/app_routes.dart';
import 'package:idttest/common/i18n/app_localisation_strings.dart';
import 'package:idttest/common/widgets/custom_app_bar/custom_app_bar.dart';
import 'package:idttest/common/widgets/custom_app_bar/custom_app_bar_actions.dart';
import 'package:idttest/common/widgets/error_screen/error_screen.dart';
import 'package:idttest/common/widgets/loading_screen/error_screen.dart';
import 'package:idttest/core/bloc/bloc_builder.dart';
import 'package:idttest/core/translation/localisation.dart';
import 'package:idttest/modules/chats/view_model/chat_screen_argument_model.dart';
import 'package:idttest/modules/messages/bloc/messages_bloc.dart';
import 'package:idttest/modules/messages/view/widgets/messages_cell.dart';
import 'package:idttest/modules/messages/view_model/message_screen_view_model.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({Key? key}) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final MessagesBloc messagesBloc = MessagesBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leadingActions: const {
          LeadingAppBarActions.menu,
        },
        title: getTranslated(AppLocalizationsStrings.messageScreenAppBarTitle),
        trailingActions: const {
          TrailingAppBarActions.search,
        },
      ),
      body: getMainWidget(),
    );
  }

  ///[getMainWidget]Main Handling Widget
  Widget getMainWidget() {
    return BlocBuilder(
        bloc: messagesBloc,
        builder: () {
          switch (messagesBloc.state.messageScreenState) {
            case MessageScreenState.success:
              return getListOfMessages();
            case MessageScreenState.failure:
              return getErrorScreen();
            case MessageScreenState.loading:
              return const LoadingScreen();
            case MessageScreenState.initial:
              return const SizedBox();
          }
        });
  }

  ///[getErrorScreen] error Screen Widget
  Widget getErrorScreen() {
    return RefreshIndicator(
        onRefresh: () async {
          messagesBloc.getAllMessages();
        },
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height -
                  MediaQuery.of(context).padding.top -
                  50,
              child: const ErrorScreen(),
            ),
          ],
        ));
  }

  ///[getListOfMessages] responsible for building
  ///The list of message items
  Widget getListOfMessages() {
    return ListView.builder(
      itemBuilder: (context, index) {
        return MessagesCell(
          item: messagesBloc.state.cellModel.elementAt(index),
          onTap: () {
            navigateToChatScreen(messagesBloc.state.cellModel.elementAt(index));
          },
        );
      },
      itemCount: messagesBloc.state.cellModel.length,
    );
  }

  ///[MessageScreenCellModel] navigate to next screen with clicked cell data
  void navigateToChatScreen(MessageScreenCellModel messageScreenCellModel) {
    Navigator.pushNamed(context, AppRoutes.chatScreen,
        arguments:
            ChatScreenArgumentModel.fromMessages(messageScreenCellModel));
  }

  @override
  void initState() {
    super.initState();
    messagesBloc.getAllMessages();
  }
}

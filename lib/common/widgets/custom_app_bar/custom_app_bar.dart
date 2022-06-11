import 'package:flutter/material.dart';
import 'package:idttest/common/app_colors.dart';
import 'package:idttest/common/app_text_style.dart';

import 'custom_app_bar_actions.dart';

///Screen constant declared here
const double _kIconSize = 28;
const EdgeInsets _kAppBardContentPadding = EdgeInsets.symmetric(horizontal: 18);
const double _kAppBarHeightAfterSafeArea = 50;

///[CustomAppBar] is the Appbar used in all the the screen
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.leadingActions = const {},
    this.trailingActions = const {},
    this.onLeadingActionClicked,
    this.onTrailingActionClicked,
    this.title = "",
    this.textWidget,
  })  : preferredSize = const Size.fromHeight(kToolbarHeight),
        super(key: key);
  final Set<LeadingAppBarActions> leadingActions;
  final Set<TrailingAppBarActions> trailingActions;
  final Function(LeadingAppBarActions)? onLeadingActionClicked;
  final Function(TrailingAppBarActions)? onTrailingActionClicked;
  final String title;
  final Widget? textWidget;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.kPrimary,

      ///appbar height and top padding needed to work on safe areas.
      height: MediaQuery.of(context).padding.top + _kAppBarHeightAfterSafeArea,
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Expanded(
            child: Padding(
              padding: _kAppBardContentPadding,
              child: Row(
                children: [
                  ...getLeadingActions(leadingActions.toList()),
                  Expanded(
                      child: Center(
                          child: textWidget ??
                              Text(
                                title,
                                style: AppTextStyle.kAppBarHeader,
                              ))),
                  ...getTrailingActions(trailingActions.toList()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  ///[List<LeadingAppBarActions>] all leading type Enums should be sent here.
  ///[List<Widget>] list of widgets for leading type is created here
  List<Widget> getLeadingActions(List<LeadingAppBarActions> actions) {
    return List<Widget>.generate(actions.length, (index) {
      switch (actions.elementAt(index)) {
        case LeadingAppBarActions.menu:
          return getIcons(
            Icons.menu,
            () {
              if (onLeadingActionClicked != null) {
                onLeadingActionClicked!(actions.elementAt(index));
              }
            },
          );
        case LeadingAppBarActions.back:
          return getIcons(
            Icons.arrow_back,
            () {
              if (onLeadingActionClicked != null) {
                onLeadingActionClicked!(actions.elementAt(index));
              }
            },
          );
      }
    });
  }

  ///[List<TrailingAppBarActions>] all trailing type Enums should be sent here.
  ///[List<Widget>] list of widgets for trailing type is created here
  List<Widget> getTrailingActions(List<TrailingAppBarActions> actions) {
    return List<Widget>.generate(actions.length, (index) {
      switch (actions.elementAt(index)) {
        case TrailingAppBarActions.search:
          return getIcons(
            Icons.search,
            () {
              if (onTrailingActionClicked != null) {
                onTrailingActionClicked!(actions.elementAt(index));
              }
            },
          );
      }
    });
  }

  ///[IconData] send any icon to be displayed in the App bars Action Item
  ///[Function] is a call back when any action is tapped.
  ///[Widget] is a return type that should be returned to display the action items
  Widget getIcons(IconData icon, Function() tapped) {
    return InkWell(
      onTap: tapped,
      child: Icon(
        icon,
        color: AppColors.kWhite,
        size: _kIconSize,
      ),
    );
  }

  @override
  final Size preferredSize;
}

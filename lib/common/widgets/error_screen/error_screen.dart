import 'package:flutter/material.dart';
import 'package:idttest/common/i18n/app_localisation_strings.dart';
import 'package:idttest/core/translation/localisation.dart';

///Screen constant declared here
const EdgeInsets _kErrorScreenPadding = EdgeInsets.symmetric(horizontal: 18);

///[ErrorScreen] is the is widget shown when there is network error
class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: _kErrorScreenPadding,
        child:
            Text(getTranslated(AppLocalizationsStrings.errorScreenDescription)),
      ),
    );
  }
}

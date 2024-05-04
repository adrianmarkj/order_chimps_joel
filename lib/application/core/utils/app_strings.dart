import 'package:base_project/application/core/utils/app_localizations.dart';
import 'package:flutter/cupertino.dart';

extension LocalizeString on String? {
  String? localize(BuildContext context) {
    return AppLocalizations.of(context)!.translate(this);
  }
}

class AppString {
  /// Headers
  static const String welcome = "welcome";
}
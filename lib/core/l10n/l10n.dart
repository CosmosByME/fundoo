import 'package:flutter/material.dart';
import 'package:fundoo/core/l10n/outputs/app_localizations.dart';

extension AppLoacaleExt on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

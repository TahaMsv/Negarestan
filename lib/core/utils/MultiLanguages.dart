import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../main.dart';

class MultiLanguages {
  final Locale locale;

  MultiLanguages({this.locale = const Locale.fromSubtags(languageCode: 'en')});

  static MultiLanguages? of(BuildContext context) {
    return Localizations.of<MultiLanguages>(context, MultiLanguages);
  }

  Future<String> readLocalKey() async {
    return "en";
  }

  // void setLocale(BuildContext context, Locale locale) {
  //   MyApp.setLocale(context, locale);
  // }

  static const LocalizationsDelegate<MultiLanguages> delegate = _MultiLanguagesDelegate();

  late Map<String, String> _localizedString;

  Future<bool> load() async {
    String jsonString = await rootBundle.loadString("assets/languages/${locale.languageCode}.json");
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedString = jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

 static String translate(BuildContext context, String key) {
    return MultiLanguages.of(context)!._localizedString[key]!;
  }
}

class _MultiLanguagesDelegate extends LocalizationsDelegate<MultiLanguages> {
  const _MultiLanguagesDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'fa'].contains(locale.languageCode);
  }

  @override
  Future<MultiLanguages> load(Locale locale) async {
    MultiLanguages localizations = MultiLanguages(locale: locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_MultiLanguagesDelegate old) => false;
}



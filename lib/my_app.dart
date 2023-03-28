import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/navigation/router.dart';
import 'core/utils/MultiLanguages.dart';
import 'core/utils/app_config.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    state?.changeLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale.fromSubtags(languageCode: 'en');

  void changeLocale(Locale locale) {
    print(_locale);
    setState(() {
      _locale = locale;
    });
    print(_locale);
  }

  // @override
  // void didChangeDependencies() {    // Read from sharedpreference
  //   super.didChangeDependencies();
  //   final multiLanguages = MultiLanguages();
  //   final localKey = multiLanguages.readLocalKey();
  //   if (localKey == "en") {
  //     _locale = const Locale("en", "US");
  //   } else {
  //     _locale = const Locale.fromSubtags(languageCode: 'fa');
  //   }
  //   setState(() {});
  // }

  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
    //     // statusBarColor: AppConfig.themeLight!.appBarTheme.backgroundColor, // Color for Android
    //     // statusBarColor: MyColors.white, // Color for Android
    //     statusBarBrightness: Brightness.dark // Dark == white status bar -- for IOS.
    //     ));

    return MaterialApp.router(
      // debugShowCheckedModeBanner: false,
      title: 'Online Check-in',

      supportedLocales: const [
        Locale("en", "US"),
        Locale.fromSubtags(languageCode: 'fa'),
      ],
      localizationsDelegates: const [
        MultiLanguages.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: _locale,
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale?.languageCode && supportedLocale.countryCode == locale?.countryCode) {
            return supportedLocale;
          }
        }
        return supportedLocales.first;
      },
      theme: AppConfig.themeLight,
      routeInformationParser: MyRouter.router.routeInformationParser,
      routeInformationProvider: MyRouter.router.routeInformationProvider,
      routerDelegate: MyRouter.router.routerDelegate,
    );
  }
}


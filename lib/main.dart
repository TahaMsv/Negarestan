import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/apis.dart';
import 'core/constants/ui.dart';
import 'core/dependency_injection.dart';
import 'core/utils/app_config.dart';
import 'my_app.dart';
import 'screens/login/login_state.dart';


void main() async {
  // initializeDateFormatting();
  AppConfig(
    flavor: Flavor.abomis,
    baseUrl: Apis.baseUrl,
    lightTheme: MyTheme.lightAbomis,
    darkTheme: MyTheme.dark,
    // logoAddress: AssetImages.artemis
  );
  WidgetsFlutterBinding.ensureInitialized();
   // MyRouter.initialize();
  await init();
  //
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => getIt<LoginState>()),
    ],
    child:  MyApp(),
  ));

  // runApp(MyApp(),);
}

import 'package:flutter/material.dart';
import 'package:negarestan/screens/People/people_state.dart';
import 'package:negarestan/screens/home/home_state.dart';
import 'package:negarestan/screens/profile/profile_state.dart';
import 'package:negarestan/screens/projects/projects_state.dart';
import 'package:negarestan/screens/search_screen/search_state.dart';
import 'package:negarestan/screens/user_details/user_details_state.dart';
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
      ChangeNotifierProvider(create: (_) => getIt<HomeState>()),
      ChangeNotifierProvider(create: (_) => getIt<SearchState>()),
      ChangeNotifierProvider(create: (_) => getIt<ProjectsState>()),
      ChangeNotifierProvider(create: (_) => getIt<PeopleState>()),
      ChangeNotifierProvider(create: (_) => getIt<ProfileState>()),
      ChangeNotifierProvider(create: (_) => getIt<UserDetailsState>()),
    ],
    child: MyApp(),
  ));

  // runApp(MyApp(),);
}

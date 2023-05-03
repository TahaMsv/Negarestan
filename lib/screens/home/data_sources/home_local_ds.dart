import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/home_data_source_interface.dart';

class HomeLocalDataSource implements HomeDataSourceInterface {
  final SharedPreferences sharedPreferences;

  HomeLocalDataSource({
    required this.sharedPreferences,
  });

}

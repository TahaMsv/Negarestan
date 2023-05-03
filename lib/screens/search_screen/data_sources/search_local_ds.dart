import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/search_data_source_interface.dart';

class SearchLocalDataSource implements SearchDataSourceInterface {
  final SharedPreferences sharedPreferences;

  SearchLocalDataSource({
    required this.sharedPreferences,
  });
}

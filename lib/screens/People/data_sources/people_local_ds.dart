import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/people_data_source_interface.dart';

class PeopleLocalDataSource implements PeopleDataSourceInterface {
  final SharedPreferences sharedPreferences;

  PeopleLocalDataSource({
    required this.sharedPreferences,
  });

}

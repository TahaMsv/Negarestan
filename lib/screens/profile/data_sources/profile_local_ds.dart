import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/profile_data_source_interface.dart';

class ProfileLocalDataSource implements ProfileDataSourceInterface {
  final SharedPreferences sharedPreferences;

  ProfileLocalDataSource({
    required this.sharedPreferences,
  });

}

import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/projects_data_source_interface.dart';

class ProjectsLocalDataSource implements ProjectsDataSourceInterface {
  final SharedPreferences sharedPreferences;

  ProjectsLocalDataSource({
    required this.sharedPreferences,
  });

}

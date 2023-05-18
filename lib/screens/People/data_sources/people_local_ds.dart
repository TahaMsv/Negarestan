import 'package:negarestan/screens/People/usecases/follow_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/people_data_source_interface.dart';

class PeopleLocalDataSource implements PeopleDataSourceInterface {
  final SharedPreferences sharedPreferences;

  PeopleLocalDataSource({
    required this.sharedPreferences,
  });

  @override
  Future<bool> follow(FollowRequest request) {
    throw UnimplementedError();
  }

}

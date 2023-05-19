import 'package:negarestan/screens/user_details/usecases/unfollow_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/user_details_data_source_interface.dart';
import '../usecases/follow_usecase.dart';

class UserDetailsLocalDataSource implements UserDetailsDataSourceInterface {
  final SharedPreferences sharedPreferences;

  UserDetailsLocalDataSource({
    required this.sharedPreferences,
  });

  @override
  Future<bool> follow(FollowRequest request) {
    throw UnimplementedError();
  }

  @override
  Future<bool> unfollow(UnFollowRequest request) {
    throw UnimplementedError();
  }

}

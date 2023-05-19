import 'package:negarestan/screens/profile/usecases/me_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/classes/user.dart';
import '../interfaces/profile_data_source_interface.dart';

class ProfileLocalDataSource implements ProfileDataSourceInterface {
  final SharedPreferences sharedPreferences;

  ProfileLocalDataSource({
    required this.sharedPreferences,
  });

  @override
  Future<User> me(MeRequest request) {
    throw UnimplementedError();
  }

}

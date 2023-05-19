
import '../../../core/classes/user.dart';
import '../usecases/me_usecase.dart';

abstract class ProfileDataSourceInterface {
  Future<User> me(MeRequest request);

}

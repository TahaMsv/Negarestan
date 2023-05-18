
import '../usecases/me_usecase.dart';

abstract class ProfileDataSourceInterface {
  Future<dynamic> me(MeRequest request);

}

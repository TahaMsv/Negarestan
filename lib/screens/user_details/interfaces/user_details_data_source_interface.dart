import 'package:negarestan/screens/user_details/usecases/user_details_usecase.dart';

import '../../../core/classes/user.dart';
import '../usecases/follow_usecase.dart';
import '../usecases/unfollow_usecase.dart';

abstract class UserDetailsDataSourceInterface {
  Future<bool> follow(FollowRequest request);
  Future<bool> unfollow(UnFollowRequest request);
  Future<User> userDetails(UserDetailsRequest request);

}

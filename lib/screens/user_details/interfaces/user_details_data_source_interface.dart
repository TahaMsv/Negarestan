import '../usecases/follow_usecase.dart';
import '../usecases/unfollow_usecase.dart';

abstract class UserDetailsDataSourceInterface {
  Future<bool> follow(FollowRequest request);
  Future<bool> unfollow(UnFollowRequest request);

}

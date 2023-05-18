
import 'package:negarestan/screens/People/usecases/follow_usecase.dart';

abstract class PeopleDataSourceInterface {
  Future<bool> follow(FollowRequest request);

}

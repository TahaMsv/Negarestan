
import 'package:negarestan/screens/People/usecases/follow_usecase.dart';

abstract class PeopleDataSourceInterface {
  Future<String> follow(FollowRequest request);

}

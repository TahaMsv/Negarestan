import 'package:negarestan/screens/People/people_repository.dart';
import 'package:negarestan/screens/People/people_state.dart';

import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';

class PeopleController extends MainController {

  final PeopleState peopleState = getIt<PeopleState>();
  final PeopleRepository peopleRepository = getIt<PeopleRepository>();

  @override
  void onCreate() {}
}

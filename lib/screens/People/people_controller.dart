import 'package:negarestan/core/constants/route_names.dart';
import 'package:negarestan/screens/People/people_repository.dart';
import 'package:negarestan/screens/People/people_state.dart';
import 'package:negarestan/screens/user_details/usecases/user_details_usecase.dart';
import 'package:negarestan/screens/user_details/user_details_state.dart';

import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';
import '../../core/utils/failure_handler.dart';

class PeopleController extends MainController {
  final PeopleState peopleState = getIt<PeopleState>();
  final PeopleRepository peopleRepository = getIt<PeopleRepository>();

  @override
  void onCreate() {}

// void goToUserDetails(String userId) async {
//   if (!peopleState.isLoading) {
//     peopleState.setIsLoading(true);
//     UserDetailsRequest uDRequest = UserDetailsRequest(userID: userId);
//     final fOrUD = await userDetailsUseCase(request: uDRequest);
//     fOrUD.fold((f) => FailureHandler.handle(f, retry: () => goToUserDetails(userId)), (user) async {
//       final UserDetailsState userDetailsState = getIt<UserDetailsState>();
//       userDetailsState.setUserDetails(user);
//       nav.pushNamed("userDetails");
//     });
//   }
//   peopleState.setIsLoading(false);
// }
}

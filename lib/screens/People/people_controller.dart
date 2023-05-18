import 'package:negarestan/screens/People/people_repository.dart';
import 'package:negarestan/screens/People/people_state.dart';
import 'package:negarestan/screens/People/usecases/follow_usecase.dart';

import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';
import '../../core/utils/failure_handler.dart';

class PeopleController extends MainController {
  final PeopleState peopleState = getIt<PeopleState>();
  final PeopleRepository peopleRepository = getIt<PeopleRepository>();

  late FollowUseCase followUseCase = FollowUseCase(repository: peopleRepository);


  void follow({required String userId}) async {
    if (!peopleState.isLoading) {
      peopleState.setIsLoading(true);
      FollowRequest followRequest = FollowRequest(userId: userId);
      final fOrToken = await followUseCase(request: followRequest);

      fOrToken.fold((f) => FailureHandler.handle(f, retry: () => follow(userId: userId)), (success) async {
        if(success){

        }
      });
      peopleState.setIsLoading(false);
    }
  }

  @override
  void onCreate() {}
}

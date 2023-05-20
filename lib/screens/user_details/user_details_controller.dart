import 'package:dio/dio.dart';
import 'package:negarestan/core/constants/route_names.dart';
import 'package:negarestan/screens/People/people_repository.dart';
import 'package:negarestan/screens/People/people_state.dart';
import 'package:negarestan/screens/login/login_state.dart';
import 'package:negarestan/screens/user_details/usecases/follow_usecase.dart';
import 'package:negarestan/screens/user_details/usecases/user_details_usecase.dart';
import 'package:negarestan/screens/user_details/user_details_repository.dart';
import 'package:negarestan/screens/user_details/user_details_state.dart';

import '../../core/classes/user.dart';
import '../../core/constants/apis.dart';
import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';
import '../../core/utils/failure_handler.dart';

class UserDetailsController extends MainController {
  final UserDetailsState userDetailsState = getIt<UserDetailsState>();
  final UserDetailsRepository userDetailsRepository = getIt<UserDetailsRepository>();

  late FollowUseCase followUseCase = FollowUseCase(repository: userDetailsRepository);
  late UserDetailsUseCase userDetailsUseCase = UserDetailsUseCase(repository: userDetailsRepository);

  void follow({required String userId}) async {
    if (!userDetailsState.isLoading) {
      userDetailsState.setIsLoading(true);
      FollowRequest followRequest = FollowRequest(userId: userId);
      final fOrToken = await followUseCase(request: followRequest);

      fOrToken.fold((f) => FailureHandler.handle(f, retry: () => follow(userId: userId)), (success) async {
        if (success) {}
      });
      userDetailsState.setIsLoading(false);
    }
  }

  // void getUserDetails({required String userID}) async {
  //   if (!userDetailsState.isLoading) {
  //     userDetailsState.setIsLoading(true);
  //     UserDetailsRequest userDetailsRequest = UserDetailsRequest(userID: userID);
  //     final fOrUD = await userDetailsUseCase(request: userDetailsRequest);
  //
  //     fOrUD.fold((f) => FailureHandler.handle(f, retry: () => getUserDetails(userID: userID)), (user) async {
  //       userDetailsState.setUserDetails(user);
  //       nav.pushNamed("userDetails");
  //     });
  //     userDetailsState.setIsLoading(false);
  //   }
  // }
  void getUserDetails({required String userID}) async {
    print("here51");
    userDetailsState.setIsLoading(false);
    if (!userDetailsState.isLoading) {
      nav.pushNamed("userDetails");
      print("here52");
      userDetailsState.setIsLoading(true);
      try {
        final dio = Dio();
        final LoginState loginState = getIt<LoginState>();

        String token = loginState.token;
        dio.options.headers["Authorization"] = "Token $token";
        final response = await dio.get(
          '${Apis.baseUrl}users/$userID/v0/',
        );
        if (response.statusCode == 200) {
          User user = User.fromJson(response.data);
          userDetailsState.setUserDetails(user);
        }
      } catch (e) {
        userDetailsState.setIsLoading(false);
      }
    }
    userDetailsState.setIsLoading(false);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print("here init");
    super.onInit();
  }

  @override
  void onCreate() {}
}

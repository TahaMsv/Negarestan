import 'package:negarestan/screens/profile/profile_repository.dart';
import 'package:negarestan/screens/profile/profile_state.dart';

import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';

class ProfileController extends MainController {

  final ProfileState profileState = getIt<ProfileState>();
  final ProfileRepository profileRepository = getIt<ProfileRepository>();

  @override
  void onCreate() {}
}

import 'package:negarestan/screens/post_details/post_details_repository.dart';
import 'package:negarestan/screens/post_details/post_details_state.dart';

import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';

class PostDetailsController extends MainController {

  final PostDetailsState postDetailsState = getIt<PostDetailsState>();
  final PostDetailsRepository postDetailsRepository = getIt<PostDetailsRepository>();

  @override
  void onCreate() {}
}

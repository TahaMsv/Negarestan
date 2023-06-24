import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';
import 'create_post__state.dart';
import 'create_post_repository.dart';

class CreatePostController extends MainController {

  final CreatePostState createPostState = getIt<CreatePostState>();
  final CreatePostRepository createPostRepository = getIt<CreatePostRepository>();

  @override
  void onCreate() {}
}

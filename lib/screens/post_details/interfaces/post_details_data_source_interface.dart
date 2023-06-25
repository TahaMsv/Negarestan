import 'package:negarestan/screens/user_details/usecases/user_details_usecase.dart';

import '../../../core/classes/post.dart';
import '../../../core/classes/user.dart';
import '../usecases/post_details_usecase.dart';

abstract class PostDetailsDataSourceInterface {
  Future<Post> postDetails(PostDetailsRequest request);
}

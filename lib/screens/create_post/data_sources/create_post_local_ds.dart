import 'package:negarestan/core/classes/post.dart';
import 'package:negarestan/core/classes/user.dart';
import 'package:negarestan/screens/user_details/usecases/unfollow_usecase.dart';
import 'package:negarestan/screens/user_details/usecases/user_details_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/create_post_data_source_interface.dart';
import '../usecases/create_post_usecase.dart';

class CreatePostLocalDataSource implements CreatePostDataSourceInterface {
  final SharedPreferences sharedPreferences;

  CreatePostLocalDataSource({
    required this.sharedPreferences,
  });

  @override
  Future<Post> createPost(CreatePostRequest request) {
    // TODO: implement postDetails
    throw UnimplementedError();
  }


}

import 'package:negarestan/core/classes/post.dart';
import 'package:negarestan/core/classes/user.dart';
import 'package:negarestan/screens/user_details/usecases/unfollow_usecase.dart';
import 'package:negarestan/screens/user_details/usecases/user_details_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../interfaces/post_details_data_source_interface.dart';
import '../usecases/post_details_usecase.dart';

class PostDetailsLocalDataSource implements PostDetailsDataSourceInterface {
  final SharedPreferences sharedPreferences;

  PostDetailsLocalDataSource({
    required this.sharedPreferences,
  });

  @override
  Future<Post> postDetails(PostDetailsRequest request) {
    // TODO: implement postDetails
    throw UnimplementedError();
  }


}

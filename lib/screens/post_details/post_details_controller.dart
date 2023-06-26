import 'package:dio/dio.dart';
import 'package:negarestan/screens/post_details/post_details_repository.dart';
import 'package:negarestan/screens/post_details/post_details_state.dart';

import '../../core/classes/Project.dart';
import '../../core/classes/user.dart';
import '../../core/constants/apis.dart';
import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';
import '../home/home_state.dart';

class PostDetailsController extends MainController {
  final PostDetailsState postDetailsState = getIt<PostDetailsState>();
  final PostDetailsRepository postDetailsRepository = getIt<PostDetailsRepository>();

  Future<void> getUserDetails({required String userID}) async {
    try {
      print("20 p d");
      final dio = Dio();
      final HomeState homeState = getIt<HomeState>();
      String token = homeState.user.token!;
      dio.options.headers["Authorization"] = "Token $token";
      print("25 p d");
      final response = await dio.get(
        '${Apis.baseUrl}users/$userID/v0/',
      );
      print("29 p d");
      if (response.statusCode == 200) {
        print("31 p d");
        User user = User.fromJson(response.data);
        postDetailsState.setUserDetails(user);
        print("34 p d");
        postDetailsState.setIsFollowBtnNeeded(homeState.user != user);
        postDetailsState.setIsFollowed(homeState.user.followings!.contains(user));
        postDetailsState.setIsLiked(postDetailsState.projectDetails!.likes.contains(homeState.user.username));
        postDetailsState.setComments(postDetailsState.projectDetails!.comments);
      }
    } catch (e) {}
  }

  void fetchProjectDetails({required String projectID}) async {
    if (!postDetailsState.loading) {
      postDetailsState.setLoading(true);
      try {
        print("44 p d");
        final dio = Dio();
        final HomeState homeState = getIt<HomeState>();
        String token = homeState.user.token!;
        dio.options.headers["Authorization"] = "Token $token";
        final response = await dio.get(
          '${Apis.baseUrl}projects/$projectID/v0/',
        );
        print("52 p d");
        if (response.statusCode == 200) {
          Project project = Project.fromJson(response.data);
          postDetailsState.setProjectDetails(project);
          print("56 p d");
          await getUserDetails(userID: project.user.toString());
        }
      } catch (e) {
        postDetailsState.setLoading(false);
      }
    }
    postDetailsState.setLoading(false);
  }

  void changeLikeStateOfProject(String projectId) async {
    try {
      print("44 p d");
      final dio = Dio();
      final HomeState homeState = getIt<HomeState>();
      String token = homeState.user.token!;
      dio.options.headers["Authorization"] = "Token $token";
      final response = await dio.post(
        '${Apis.baseUrl}projects/$projectId/like/v0/',
      );
      print("52 p d");
      if (response.statusCode == 200) {
        postDetailsState.setIsLiked(!postDetailsState.isLiked);
      }
    } catch (e) {}
  }

  void changeBookmarkStateOfProject(String projectId) async {
    // if (!postDetailsState.loading) {
    // postDetailsState.setLoading(true);
    // try {
    //   print("44 p d");
    //   final dio = Dio();
    //   final HomeState homeState = getIt<HomeState>();
    //   String token = homeState.user.token!;
    //   dio.options.headers["Authorization"] = "Token $token";
    //   final response = await dio.post(
    //     '${Apis.baseUrl}projects/$projectId/like/v0/',
    //   );
    //   print("52 p d");
    //   if (response.statusCode == 200) {
    postDetailsState.setIsBookmarked(!postDetailsState.isBookmarked);
    //     }
    //   } catch (e) {
    //     postDetailsState.setLoading(false);
    //   }
    // }
    // postDetailsState.setLoading(false);
  }

  void addComment() async {
    String content = "";
    content = postDetailsState.commentC.text.trim();
    if (content == "") return;
    try {
      final dio = Dio();
      final HomeState homeState = getIt<HomeState>();
      String token = homeState.user.token!;
      dio.options.headers["Authorization"] = "Token $token";
      final response = await dio.post(
        '${Apis.baseUrl}projects/${postDetailsState.projectDetails!.id}/comment/v0/',
        data: {"comment": content},
      );
      if (response.statusCode == 200) {
        Comment comment = Comment.fromJson(response.data);
        postDetailsState.addComment(comment);
        postDetailsState.commentC.clear();
      }
    } catch (e) {}
  }

  Future<void> deleteComment(int commentID) async {
    try {
      print("144 rm");
      final dio = Dio();
      final HomeState homeState = getIt<HomeState>();
      String token = homeState.user.token!;
      dio.options.headers["Authorization"] = "Token $token";
      final response = await dio.delete(
        '${Apis.baseUrl}projects/${postDetailsState.projectDetails!.id}/comment/$commentID/v0/',
      );
      print("152 rm");
      if (response.statusCode == 200) {
        print("154 rm");
        postDetailsState.removeComment(commentID);
        print("157 rm");
      }
    } catch (e) {}
  }

  @override
  void onCreate() {}
}

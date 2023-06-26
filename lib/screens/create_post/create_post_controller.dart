import 'dart:io';

// import 'package:image_picker/image_picker.dart';

import 'package:dio/dio.dart';

import '../../core/constants/apis.dart';
import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';
import '../home/home_state.dart';
import 'create_post__state.dart';
import 'create_post_repository.dart';

class CreatePostController extends MainController {
  final CreatePostState createPostState = getIt<CreatePostState>();
  final CreatePostRepository createPostRepository = getIt<CreatePostRepository>();

  // final picker = ImagePicker();
  //
  // Future getImages() async {
  //   final pickedFile = await picker.pickMultiImage(
  //       imageQuality: 100, // To set quality of images
  //       maxHeight: 1000, // To set maxheight of images that you want in your app
  //       maxWidth: 1000); // To set maxheight of images that you want in your app
  //   List<XFile> xfilePick = pickedFile;
  //
  //   // if atleast 1 images is selected it will add
  //   // all images in selectedImages
  //   // variable so that we can easily show them in UI
  //   if (xfilePick.isNotEmpty) {
  //     for (var i = 0; i < xfilePick.length; i++) {
  //       createPostState.selectedImages.add(File(xfilePick[i].path));
  //     }
  //     createPostState.setState();
  //   }
  // }

  void createProject() async {
    if (!createPostState.loading) {
      createPostState.setLoading(true);
      try {
        final dio = Dio();
        final HomeState homeState = getIt<HomeState>();
        String token = homeState.user.token!;
        dio.options.headers["Authorization"] = "Token $token";
        dio.options.headers['Content-Type'] = 'application/json';

        final response = await dio.post(
          Apis.baseUrl + Apis.createProject,
          data: {
            "title": createPostState.postNameC.text,
            "description": createPostState.postDescriptionC.text,
            "awards": "",
            "labels": createPostState.selectedLabels,
            "tools": [],
            "institutions": [],
          },
        );
        print(response.statusCode);
        if (response.statusCode == 200) {
          print("62 cr pro");
          createPostState.postNameC.clear();
          createPostState.postDescriptionC.clear();
          createPostState.setSelectedLabels([]);
        }
      } catch (e) {
        print(e.toString());
        createPostState.setLoading(false);
      }
    }
    createPostState.setLoading(false);
  }

  @override
  void onCreate() {}
}

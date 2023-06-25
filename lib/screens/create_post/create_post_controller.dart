import 'dart:io';

// import 'package:image_picker/image_picker.dart';

import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';
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

  @override
  void onCreate() {}
}

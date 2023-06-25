import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/widgets/UserTextInput.dart';
// import 'package:image_picker/image_picker.dart';
import '../../core/constants/ui.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';
import 'create_post__state.dart';
import 'create_post_controller.dart';

class CreatePostView extends StatelessWidget {
  CreatePostView({Key? key}) : super(key: key);
  final CreatePostController createPostController = getIt<CreatePostController>();
  // final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    CreatePostState createPostState = context.watch<CreatePostState>();
    return Scaffold(
      backgroundColor: MyColors.black,
      body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Create New Post',
                    // textAlign: TextAlign.center,
                    style: const TextStyle(color: MyColors.white, fontSize: 19),
                  ),
                ],
              ),
              SizedBox(height: 40),
              UserTextInput(
                height: 40,
                hint: 'Post name',
                hintColor: Colors.white,
                controller: createPostState.postNameC,
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50.0),
                child: ElevatedButton(
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(MyColors.myBlue)),
                  // TO change button color
                  child: const Text('Select Image from Gallery'),
                  onPressed: () {
                    // getImages();
                  },
                ),
              ),
              Expanded(
                child: SizedBox(
                  width: 300.0, // To show images in particular area only
                  child: createPostState.selectedImages.isEmpty // If no images is selected
                      ? const Center(child: Text('Nothing selected!!'))
                      : GridView.builder(
                          itemCount: createPostState.selectedImages.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3
                              // Horizontally only 3 images will show
                              ),
                          itemBuilder: (BuildContext context, int index) {
                            // TO show selected file
                            return Center(child: Image.file(createPostState.selectedImages[index]));
                            // If you are making the web app then you have to
                            // use image provider as network image or in
                            // android or iOS it will as file only
                          },
                        ),
                ),
              ),
            ],
          )),
    );
  }
}

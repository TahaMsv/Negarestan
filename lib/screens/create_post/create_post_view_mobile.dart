import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/widgets/UserTextInput.dart';

// import 'package:image_picker/image_picker.dart';
import '../../core/constants/ui.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';
import '../../widgets/MyElevatedButton.dart';
import 'create_post__state.dart';
import 'create_post_controller.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

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
                hint: 'Title',
                hintColor: Colors.white,
                textColor: Colors.white,
                controller: createPostState.postNameC,
              ),
              SizedBox(height: 40),
              UserTextInput(
                height: 40,
                hint: 'Description',
                hintColor: Colors.white,
                textColor: Colors.white,
                controller: createPostState.postDescriptionC,
              ),
              SizedBox(height: 40),
              MultiSelectDialogField(
                items: ["Web design", 'Logo Design', 'Motion Graphics', 'Poster Design', 'Social Media Graphics', 'App Design'].map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                buttonText: Text("Select labels"),
                selectedColor: Colors.green,
                selectedItemsTextStyle: TextStyle(color: Colors.white),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: MyColors.white,
                ),
                onConfirm: (values) {
                  createPostState.setSelectedLabels(values);
                },
              ),
              SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
                child: MyElevatedButton(
                  height: 40,
                  width: 20,
                  buttonText: "Create project",
                  fontSize: 19,
                  borderRadius: 20,
                  bgColor: MyColors.myBlue,
                  textColor: MyColors.white,
                  fgColor: MyColors.white,
                  isLoading: createPostState.loading,
                  function: () {
                    createPostController.createProject();
                  },
                ),
              )
            ],
          )),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';

import 'create_post__state.dart';
import 'create_post_controller.dart';

class CreatePostView extends StatelessWidget {
  CreatePostView({Key? key}) : super(key: key);
  final CreatePostController createPostController = getIt<CreatePostController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    CreatePostState createPostState = context.watch<CreatePostState>();
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Container(),
    );
  }
}
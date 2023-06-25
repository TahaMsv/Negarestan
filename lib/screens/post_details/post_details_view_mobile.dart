import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/screens/post_details/post_details_controller.dart';
import 'package:negarestan/screens/post_details/post_details_state.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';

class PostDetailsView extends StatelessWidget {
  PostDetailsView({Key? key}) : super(key: key);
  final PostDetailsController postDetailsController = getIt<PostDetailsController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    PostDetailsState postDetailsState = context.watch<PostDetailsState>();
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Container(),
    );
  }
}
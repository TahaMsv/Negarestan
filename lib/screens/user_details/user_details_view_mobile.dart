
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/screens/user_details/user_details_controller.dart';
import 'package:negarestan/screens/user_details/user_details_state.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';

class UserDetailsView extends StatelessWidget {
  UserDetailsView({Key? key}) : super(key: key);
  final UserDetailsController userDetailsController = getIt<UserDetailsController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    UserDetailsState userDetailsState = context.watch<UserDetailsState>();
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Container(),
    );
  }
}
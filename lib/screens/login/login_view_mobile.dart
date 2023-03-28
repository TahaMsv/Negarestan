import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/core/constants/ui.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';

import 'login_controller.dart';
import 'login_state.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final LoginController loginController = getIt<LoginController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    LoginState loginState = context.watch<LoginState>();
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: const Center(
        child: Text(
          "Negarestan",
          style: MyTextTheme.black25W700,
        ),
      ),
    );
  }
}

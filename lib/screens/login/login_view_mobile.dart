import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/core/constants/assets.dart';
import 'package:negarestan/core/constants/ui.dart';
import 'package:negarestan/widgets/MyElevatedButton.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'login_controller.dart';
import 'login_state.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  final LoginController loginController = getIt<LoginController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    LoginState loginState = context.watch<LoginState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double loginBoxWidth = (width * 0.9 > 300) ? width * 0.9 : 300;
    Color formBGColor = Colors.white;
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(AssetImages.loginBG2),
          fit: BoxFit.cover,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 80),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              width: loginBoxWidth,
              height: 510,
              decoration:  BoxDecoration(color: formBGColor, borderRadius: BorderRadius.all(Radius.circular(20.0))),
              child: ListView(
                children: [
                  Center(
                    child: ToggleSwitch(
                      initialLabelIndex: 0,
                      totalSwitches: 2,
                      fontSize: 17,
                      minWidth: 90,
                      activeBgColor: [Colors.white],
                      activeFgColor: Colors.black,
                      inactiveBgColor: Colors.white,
                      inactiveFgColor: Colors.black45,
                      labels: const ['Sign In', 'Sign Up'],
                      // borderColor: [Colors.black12],
                      activeBorders: [Border.all(color: MyColors.blueAccent, width: 2)],

                      onToggle: (index) {
                        print('switched to: $index');
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  const Text("LOGIN TO YOUR ACCOUNT", style: MyTextTheme.boldDarkGray24, textAlign: TextAlign.center),
                  const SizedBox(height: 2),
                  const Text("via", style: MyTextTheme.darkGreyW40020, textAlign: TextAlign.center),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GoogleLogo(),
                      GoogleLogo(),
                      GoogleLogo(),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(

                    children: [
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.black45,
                      )),
                      Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                      child: const Text("or", style: MyTextTheme.darkGreyW50017, textAlign: TextAlign.center)),
                      Expanded(
                          child: Container(
                        height: 1,
                        color: Colors.black45,
                      ))
                    ],
                  ),
                  const SizedBox(height: 2),
                  const Text("Login with your email", style: MyTextTheme.darkGreyW70020, textAlign: TextAlign.center),
                  const SizedBox(height: 15),
                  MyTextField(
                    hintText: 'Email Address',
                  ),
                  const SizedBox(height: 10),
                  MyTextField(
                    hintText: "Password",
                  ),
                  const SizedBox(height: 3),
                  TextButton(
                    child: Text('Forgot password?'),
                    onPressed: () {
                      print('Pressed');
                    },
                  ),
                  const SizedBox(height: 5),
                  MyElevatedButton(
                    height: 50,
                    width: 20,
                    buttonText: "Submit",
                    fontSize: 19,
                    bgColor: MyColors.myBlue,
                    textColor: MyColors.white,
                    fgColor: MyColors.white,
                    function: () {},
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 16),
      textAlign: TextAlign.center,
      decoration: InputDecoration(contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10), border: OutlineInputBorder(), hintText: hintText),
    );
  }
}

class GoogleLogo extends StatelessWidget {
  const GoogleLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: EdgeInsets.all(8.0),
      // set padding around the image
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black26,
          width: 1.0,
        ),
      ),
      child: CircleAvatar(
        radius: 50.0, // set the radius of the circular border
        backgroundImage: AssetImage(AssetImages.google_logo),
      ),
    );
  }
}

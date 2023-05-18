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
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 1000),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(
                  opacity: animation,
                  child: child,
                );

                //   SlideTransition(
                //   position: Tween<Offset>(
                //     begin: Offset(0.0, -1.0),
                //     end: Offset.zero,
                //   ).animate(animation),
                //   child: child,
                // );
              },
              child: loginState.isLoginMode ? const LoginForm() : const SignUp(),
            ),

            // LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double loginBoxWidth = (width * 0.9 > 300) ? width * 0.9 : 300;

    return Container(
      margin: const EdgeInsets.only(top: 80),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: loginBoxWidth,
      height: 480,
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: ListView(
        children: [
          const CommonSections(),
          const MyTextField(
            hintText: 'Email Address',
          ),
          const SizedBox(height: 10),
          const MyTextField(
            hintText: "Password",
          ),
          const SizedBox(height: 3),
          TextButton(
            child: const Text('Forgot password?'),
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
            function: () {
              final LoginController loginController = getIt<LoginController>();
              loginController.login(username: "ali", password: "Mamad123");
              // final LoginController loginController = getIt<LoginController>();
              // loginController.goToHome();
            },
          )
        ],
      ),
    );
  }
}

class CommonSections extends StatelessWidget {
  const CommonSections({super.key});

  @override
  Widget build(BuildContext context) {
    LoginState loginState = context.watch<LoginState>();
    return Column(
      children: [
        Center(
          child: ToggleSwitch(
            initialLabelIndex: loginState.isLoginMode ? 0 : 1,
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
              index == 1 ? loginState.setIsLoginMode(false) : loginState.setIsLoginMode(true);
            },
          ),
        ),
        const SizedBox(height: 15),
        Text(loginState.isLoginMode ? "LOGIN TO YOUR ACCOUNT" : "CREATE YOUR ACCOUNT", style: MyTextTheme.boldDarkGray24, textAlign: TextAlign.center),
        const SizedBox(height: 2),
        const Text("via", style: MyTextTheme.darkGreyW40020, textAlign: TextAlign.center),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            GoogleLogo(),
            GoogleLogo(),
            GoogleLogo(),
          ],
        ),
        const SizedBox(height: 15),
        Row(
          children: [
            Expanded(child: Container(height: 1, color: Colors.black45)),
            const Padding(padding: EdgeInsets.symmetric(horizontal: 10), child: Text("or", style: MyTextTheme.darkGreyW50017, textAlign: TextAlign.center)),
            Expanded(child: Container(height: 1, color: Colors.black45))
          ],
        ),
        const SizedBox(height: 2),
        Text(loginState.isLoginMode ? "Login with your email" : "Sign up with an email", style: MyTextTheme.darkGreyW70020, textAlign: TextAlign.center),
        const SizedBox(height: 15),
      ],
    );
  }
}

class SignUp extends StatelessWidget {
  const SignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double loginBoxWidth = (width * 0.9 > 300) ? width * 0.9 : 300;
    LoginState loginState = context.watch<LoginState>();
    return Container(
      margin: const EdgeInsets.only(top: 80),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      width: loginBoxWidth,
      height: 570,
      decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: ListView(
        children: [
          const CommonSections(),
          const MyTextField(
            hintText: 'Email Address',
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                child: MyTextField(
                  hintText: "First name",
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: MyTextField(
                  hintText: "Last name",
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const MyTextField(
            hintText: 'Password',
          ),
          const SizedBox(height: 10),
          BirthdayInput(),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {},
              ),
              // SizedBox(width: 5,),
              Text("I accept the Terms of Use and Privacy Policy", style: MyTextTheme.darkGrey12w500, textAlign: TextAlign.center),
            ],
          ),
          MyElevatedButton(
            height: 50,
            width: 20,
            buttonText: "Submit",
            fontSize: 19,
            bgColor: MyColors.myBlue,
            textColor: MyColors.white,
            fgColor: MyColors.white,
            function: () async {
              final LoginController loginController = getIt<LoginController>();
              // loginController.signUp(username: "ali", password: "Mamad123");
            },
          )
        ],
      ),
    );
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.hintText,
    this.height = 35,
  });

  final String hintText;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: TextField(
        style: const TextStyle(fontSize: 16),
        textAlign: TextAlign.center,
        decoration: InputDecoration(contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 10), border: const OutlineInputBorder(), hintText: hintText),
      ),
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
      width: 40,
      height: 40,
      padding: const EdgeInsets.all(8.0),
      // set padding around the image
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black26,
          width: 1.0,
        ),
      ),
      child: const CircleAvatar(
        radius: 50.0, // set the radius of the circular border
        backgroundImage: AssetImage(AssetImages.google_logo),
      ),
    );
  }
}

class BirthdayInput extends StatefulWidget {
  @override
  _BirthdayInputState createState() => _BirthdayInputState();
}

class _BirthdayInputState extends State<BirthdayInput> {
  final _formKey = GlobalKey<FormState>();

  late int _day;
  late int _month;
  late int _year;

  void _submitForm() {
    // if (_formKey.currentState.validate()) {
    //   print('Valid birthday: $_day/$_month/$_year');
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text("date of birth:", style: MyTextTheme.darkGrey12, textAlign: TextAlign.center),
          SizedBox(
            width: 70,
            height: 40,
            child: TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 4,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
              decoration: const InputDecoration(
                hintText: 'Year',
                counterText: "",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              ),
              validator: (value) {
                // if (value.isEmpty) {
                //   return 'Please enter a year';
                // } else {
                //   int year = int.tryParse(value);
                //   if (year == null || year < 1900 || year > DateTime.now().year) {
                //     return 'Please enter a valid year';
                //   }
                //   _year = year;
                // }
                // return null;
              },
            ),
          ),
          SizedBox(
            width: 70,
            height: 40,
            child: TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
              decoration: const InputDecoration(
                hintText: 'Month',
                counterText: "",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              ),
              validator: (value) {
                // if (value.isEmpty) {
                //   return 'Please enter a year';
                // } else {
                //   int year = int.tryParse(value);
                //   if (year == null || year < 1900 || year > DateTime.now().year) {
                //     return 'Please enter a valid year';
                //   }
                //   _year = year;
                // }
                // return null;
              },
            ),
          ),
          SizedBox(
            width: 70,
            height: 40,
            child: TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 2,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 15),
              decoration: const InputDecoration(
                hintText: 'Day',
                counterText: "",
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              ),
              validator: (value) {
                // if (value.isEmpty) {
                //   return 'Please enter a year';
                // } else {
                //   int year = int.tryParse(value);
                //   if (year == null || year < 1900 || year > DateTime.now().year) {
                //     return 'Please enter a valid year';
                //   }
                //   _year = year;
                // }
                // return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}

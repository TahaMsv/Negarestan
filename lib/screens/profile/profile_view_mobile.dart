import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/core/constants/ui.dart';
import 'package:negarestan/screens/home/home_state.dart';
import 'package:negarestan/screens/profile/profile_controller.dart';
import 'package:negarestan/screens/profile/profile_state.dart';
import 'package:negarestan/widgets/MyElevatedButton.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../core/classes/user.dart';
import '../../core/constants/assets.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';

import '../../widgets/UserStats.dart';
import '../../widgets/image_circle_avatar.dart';

class ProfileView extends StatelessWidget {
  ProfileView({Key? key}) : super(key: key);
  final ProfileController profileController = getIt<ProfileController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ProfileState profileState = context.watch<ProfileState>();
    HomeState homeState = context.watch<HomeState>();
    User user = homeState.user;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double galleryWidth = width - 26;
    List posts = [
      AssetImages.loginBG1,
      AssetImages.loginBG2,
      AssetImages.loginBG3,
      AssetImages.loginBG4,
      AssetImages.loginBG5,
      AssetImages.loginBG6,
      AssetImages.loginBG7,
    ];
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 7),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            const ImageCircleAvatar(radius: 70),
            const SizedBox(height: 10),
            Center(
              child: Column(
                children: [
                  Text(
                    user.username ?? "",
                    style: MyTextTheme.whiteW50022,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    user.bio ?? "",
                    style: MyTextTheme.whiteW40015,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  MyElevatedButton(
                    height: 35,
                    width: 130,
                    buttonText: "Edit Profile",
                    bgColor: MyColors.darkBlue,
                    function: () {},
                    textColor: Colors.white,
                    fgColor: Colors.white,
                    borderRadius: 20,
                    // borderColor: Colors.white,
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            UserStats(user: user),
            const SizedBox(height: 10),
            Center(
              child: ToggleSwitch(
                initialLabelIndex: 0,
                totalSwitches: 2,
                fontSize: 17,
                minWidth: 90,
                activeBgColor: [Colors.blueAccent],
                activeFgColor: Colors.white,
                inactiveBgColor: MyColors.customGrey,
                inactiveFgColor: MyColors.white,
                icons: [Icons.photo_library_outlined, Icons.favorite],
                customWidths: [width / 2.1, width / 2.1],
                cornerRadius: 5.0,
                // labels: const ['All Posts', 'Saved'],
                // borderColor: [Colors.black12],
                // activeBorders: [Border.all(color: MyColors.blueAccent, width: 2)],

                onToggle: (index) {
                  // index == 1 ? loginState.setIsLoginMode(false) : loginState.setIsLoginMode(true);
                },
              ),
            ),
            Wrap(
              children: List.generate(
                50,
                (index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  height: galleryWidth / 3,
                  width: galleryWidth / 3,
                  // color: MyColors.blueAccent,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    // color: MyColors.white,
                    border: Border.all(
                      // color: Colors.black26,
                      width: 1.0,
                    ),
                  ),
                  child: Image(
                    height: galleryWidth / 3,
                    width: galleryWidth / 3,
                    image: AssetImage(posts[index % 7]),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

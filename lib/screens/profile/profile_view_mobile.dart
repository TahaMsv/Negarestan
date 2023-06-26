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
import '../../widgets/UserTextInput.dart';
import '../../widgets/image_circle_avatar.dart';
import '../post_details/post_details_controller.dart';

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
      body: profileState.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
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
                          function: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const EditUser()),
                            );
                          },
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
                      totalSwitches: 1,
                      fontSize: 17,
                      minWidth: 90,
                      activeBgColor: [Colors.blueAccent],
                      activeFgColor: Colors.white,
                      inactiveBgColor: MyColors.customGrey,
                      inactiveFgColor: MyColors.white,
                      icons: [Icons.photo_library_outlined],
                      customWidths: [width / 1.1],
                      cornerRadius: 5.0,
                      // labels: const ['All Posts', 'Saved'],
                      // borderColor: [Colors.black12],
                      // activeBorders: [Border.all(color: MyColors.blueAccent, width: 2)],

                      onToggle: (index) {
                        // index == 1 ? loginState.setIsLoginMode(false) : loginState.setIsLoginMode(true);
                      },
                    ),
                  ),
                  // Wrap(
                  //   children: List.generate(
                  //     50,
                  //     (index) => Container(
                  //       margin: const EdgeInsets.symmetric(horizontal: 2),
                  //       height: galleryWidth / 3,
                  //       width: galleryWidth / 3,
                  //       // color: MyColors.blueAccent,
                  //       decoration: BoxDecoration(
                  //         borderRadius: BorderRadius.circular(2),
                  //         // color: MyColors.white,
                  //         border: Border.all(
                  //           // color: Colors.black26,
                  //           width: 1.0,
                  //         ),
                  //       ),
                  //       child: Image(
                  //         height: galleryWidth / 3,
                  //         width: galleryWidth / 3,
                  //         image: AssetImage(posts[index % 7]),
                  //         fit: BoxFit.cover,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: profileState.projects.isEmpty
                        ? const Text(
                            'No project',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: MyColors.white, fontSize: 17),
                          )
                        : Container(
                            child: Wrap(
                              children: List.generate(
                                profileState.projects.length,
                                (index) => GestureDetector(
                                  onTap: () {
                                    final PostDetailsController postDetailsController = getIt<PostDetailsController>();
                                    postDetailsController.fetchProjectDetails(projectID: profileState.projects[index].id.toString());
                                    profileController.nav.pushNamed('postDetails');
                                  },
                                  child: Card(
                                    color: MyColors.customGrey,
                                    margin: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      margin: const EdgeInsets.all(5),
                                      height: 350,
                                      width: 350,
                                      // color: MyColors.blueAccent,
                                      child: Container(
                                        padding: const EdgeInsets.all(5),
                                        child: Column(
                                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              height: 300,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(8),
                                                color: MyColors.lightGrey2,
                                              ),
                                              child: Image(
                                                image: AssetImage(AssetImages.loginBG7),
                                              ),
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Row(
                                                  children: const [
                                                    Text(
                                                      '10 k',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(color: MyColors.white),
                                                    ),
                                                    SizedBox(width: 3),
                                                    Icon(Icons.remove_red_eye, color: MyColors.blueAccent, size: 20)
                                                  ],
                                                ),
                                                Text(
                                                  profileState.projects[index].title,
                                                  overflow: TextOverflow.ellipsis,
                                                  textAlign: TextAlign.center,
                                                  style: const TextStyle(color: MyColors.white, fontSize: 17),
                                                ),
                                                Row(
                                                  children: [
                                                    Icon(Icons.favorite, color: MyColors.red, size: 20),
                                                    SizedBox(width: 3),
                                                    Text(
                                                      '${profileState.projects[index].likes.length}',
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(color: MyColors.white),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                  )
                ],
              ),
            ),
    );
  }
}

class EditUser extends StatefulWidget {
  const EditUser({super.key});

  @override
  State<EditUser> createState() => _EditUserState();
}

class _EditUserState extends State<EditUser> {
  @override
  void initState() {
    final HomeState homeState = getIt<HomeState>();
    User user = homeState.user;
    final ProfileState profileState = getIt<ProfileState>();
    profileState.lastNameC.text = user.lastname!;
    profileState.firstNameC.text = user.firstname!;
    profileState.emailC.text = user.email!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    ProfileState profileState = context.watch<ProfileState>();

    return Container(
      color: MyColors.black,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Email: ', textAlign: TextAlign.center, style: MyTextTheme.white20),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          UserTextInput(
            height: 40,
            hint: 'Email',
            hintColor: Colors.white.withOpacity(0.5),
            textColor: Colors.white,
            controller: profileState.emailC,
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('First Name: ', textAlign: TextAlign.center, style: MyTextTheme.white20),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          UserTextInput(
            height: 40,
            hint: 'First name',
            hintColor: Colors.white.withOpacity(0.5),
            textColor: Colors.white,
            controller: profileState.firstNameC,
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Last Name: ', textAlign: TextAlign.center, style: MyTextTheme.white20),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          UserTextInput(
            height: 40,
            hint: 'Last name',
            hintColor: Colors.white.withOpacity(0.5),
            textColor: Colors.white,
            controller: profileState.lastNameC,
          ),
          SizedBox(
            height: 20,
          ),
          MyElevatedButton(
            height: 50,
            width: 20,
            buttonText: "Submit",
            fontSize: 19,
            bgColor: MyColors.myBlue,
            textColor: MyColors.white,
            fgColor: MyColors.white,
            isLoading: profileState.isLoading,
            function: () async {
              final ProfileController profileController = getIt<ProfileController>();
              await profileController.editUser();
              // final LoginController loginController = getIt<LoginController>();
              // loginController.goToHome();
            },
          )
        ],
      ),
    );
  }
}

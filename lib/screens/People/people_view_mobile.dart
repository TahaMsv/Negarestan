import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/screens/People/people_controller.dart';
import 'package:negarestan/screens/People/people_state.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/ui.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';

class PeopleView extends StatelessWidget {
  PeopleView({Key? key}) : super(key: key);
  final PeopleController peopleController = getIt<PeopleController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    PeopleState peopleState = context.watch<PeopleState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: theme.primaryColor,
      // appBar: AppBar(
      //
      // ),
      body: SizedBox(
        height: height,
        child: ListView(
          children: [
            // SizedBox(height: 10,),
            // Center(
            //   child: Container(
            //     height: 40,
            //     width: 150,
            //     decoration: const BoxDecoration(
            //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
            //       color: MyColors.darkBlue,
            //     ),
            //     child: const Center(child: Text("People", style: MyTextTheme.white22)),
            //   ),
            // ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Wrap(
                children: List.generate(
                  10,
                  (index) => Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    height: 300,
                    width: 350,
                    // color: MyColors.blueAccent,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: MyColors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: MyColors.lightGrey2,
                          blurRadius: 1,
                          offset: Offset(0, 4), // Shadow position
                        ),
                      ],
                    ),
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      child: Stack(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 350,
                            height: 285,
                            child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20.0)),
                            child: Image(
                              image: AssetImage(AssetImages.loginBG3),
                              fit: BoxFit.cover,
                            )),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 150),
                            height: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: MyColors.white,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(Icons.email, color: MyColors.darkBlue, size: 25),
                                      Icon(Icons.add, color: MyColors.green, size: 28),
                                    ],
                                  ),
                                  margin: EdgeInsets.only(top: 10),
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                ),
                                SizedBox(height: 10),
                                Text('Person name $index', textAlign: TextAlign.center, style: MyTextTheme.darkGreyW50022),
                                SizedBox(height: 5),
                                Text('Graphic design', textAlign: TextAlign.center, style: MyTextTheme.darkGreyW40015),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: const [
                                        Text(
                                          '10 k',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: MyColors.darkGrey),
                                        ),
                                        SizedBox(width: 3),
                                        Icon(Icons.person, color: MyColors.darkGrey, size: 20),
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    Row(
                                      children: const [
                                        Text(
                                          '10 k',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: MyColors.darkGrey),
                                        ),
                                        SizedBox(width: 3),
                                        Icon(Icons.remove_red_eye, color: MyColors.blueAccent, size: 20)
                                      ],
                                    ),
                                    SizedBox(width: 10),
                                    Row(
                                      children: const [
                                        Text(
                                          '10 k',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: MyColors.darkGrey),
                                        ),
                                        SizedBox(width: 3),
                                        Icon(Icons.favorite, color: MyColors.red, size: 20),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Center(
                            child: CircleAvatar(
                              radius: 50.0, // adjust the radius as needed
                              backgroundImage: AssetImage(AssetImages.admin_image), // or use AssetImage for local images
                            ),
                          ),
                        ],
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

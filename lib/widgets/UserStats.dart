import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/classes/user.dart';
import '../core/constants/ui.dart';
import '../screens/home/home_state.dart';

class UserStats extends StatelessWidget {
  const UserStats({
    super.key, required this.user,
  });

  final User user;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: const BoxDecoration(
          // border: Border.all(color: borderColor, width: 2),
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: MyColors.customGrey,
          // borderRadius: borderRadius,
        ),
        height: 70,
        child: Container(
          // color: Colors.yellow,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              StatDetail(users: user.followings!, text: "Following"),
              Container(
                margin: const EdgeInsets.only(left: 10),
                child: StatDetail(users: user.followers!, text: "Followers"),
              ),
              SizedBox(
                width: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "60",
                      style: MyTextTheme.boldWhite24,
                    ),
                    Text(
                      "Post",
                      style: MyTextTheme.white14,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class StatDetail extends StatelessWidget {
  const StatDetail({
    super.key,
    required this.users,
    required this.text,
  });

  final List<User> users;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            users.length.toString(),
            style: MyTextTheme.boldWhite24,
          ),
          Text(
            text,
            style: MyTextTheme.white14,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/core/classes/user.dart';
import 'package:negarestan/core/constants/route_names.dart';

import '../core/constants/ui.dart';
import '../core/dependency_injection.dart';
import '../screens/home/home_controller.dart';

class SearchUser extends SearchDelegate {
  final _userList = [];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<List<String>>(
        // future: _userList.getuserList(query: query),
        future: Future.value(["Taha", "Amin", "Kiana", "Hasan"]),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          // List<User>? data = snapshot.data;
          List<String>? data = ["Taha", "Amin", "Kiana", "Hasan"];
          return Container(
            margin: EdgeInsets.only(top: 20),
            child: ListView.builder(
                itemCount: data?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      final HomeController homeController = getIt<HomeController>();

                      // Navigator.pushNamed(context, RouteNames.people);
                      Navigator.pop(context);
                      homeController.nav.pushNamed(RouteNames.userDetails);
                    },
                    title: Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(width: 20),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            '${data[index]}',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '{data?[index].email}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ])
                      ],
                    ),
                  );
                }),
          );
        });
  }

  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Search ..."),
    );
  }
}

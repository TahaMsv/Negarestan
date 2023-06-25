import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:negarestan/core/constants/ui.dart';
import 'package:negarestan/screens/login/login_controller.dart';
import 'package:negarestan/screens/user_details/user_details_controller.dart';
import '../../core/classes/user.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/route_names.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import '../../widgets/image_circle_avatar.dart';
import 'home_controller.dart';
import 'home_state.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key, required this.childWidget}) : super(key: key);
  final Widget childWidget;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController homeController = getIt<HomeController>();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    HomeState homeState = context.watch<HomeState>();
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: MyColors.darkBlue),
        backgroundColor: Colors.black,
        actions: [
          _currentIndex == 1 || _currentIndex == 2
              ? IconButton(
                  onPressed: () {
                    _currentIndex == 1 ? showSearch(context: context, delegate: SearchUser()) : showSearch(context: context, delegate: SearchPost());
                  },
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                )
              : const ImageCircleAvatar(),
        ],
        // title: const Image(
        //   height: 50,
        //   width: 100,
        //   image: AssetImage(AssetImages.app_logo),
        // ),
        centerTitle: true,
        leading: _currentIndex == 3
            ? Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    icon: const Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  );
                },
              )
            : null,
      ),
      drawer: _currentIndex == 3
          ? Drawer(
              width: 250,
              backgroundColor: MyColors.white,
              child: ListView(
                // Important: Remove any padding from the ListView.
                padding: EdgeInsets.zero,
                children: <Widget>[
                  SizedBox(
                    height: 280,
                    child: DrawerHeader(
                      decoration: const BoxDecoration(
                        color: MyColors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 40.0, // adjust the radius as needed
                            backgroundImage: AssetImage(AssetImages.admin_image), // or use AssetImage for local images
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            homeState.user.username!,
                            style: MyTextTheme.darkGreyW70020,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(
                                homeState.user.firstname!,
                                style: MyTextTheme.darkGreyW70015,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                homeState.user.lastname!,
                                style: MyTextTheme.darkGreyW70015,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            homeState.user.email!,
                            style: MyTextTheme.darkGreyW70015,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  ListTile(
                    minLeadingWidth: 0,
                    horizontalTitleGap: 10,
                    leading: const Icon(Icons.settings),
                    title: const Text('Settings'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    minLeadingWidth: 0,
                    horizontalTitleGap: 10,
                    leading: const Icon(Icons.timeline),
                    title: const Text('Time Line'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    minLeadingWidth: 0,
                    horizontalTitleGap: 10,
                    leading: const Icon(Icons.work),
                    title: const Text('Jobs'),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    minLeadingWidth: 0,
                    horizontalTitleGap: 10,
                    leading: const Icon(Icons.logout),
                    title: const Text('Log Out'),
                    onTap: () {
                      final LoginController loginController = getIt<LoginController>();
                      loginController.logout();
                      // Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          : null,
      body: Container(
        child: widget.childWidget,
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(width: 1.5, color: Colors.white)),
          color: Colors.white,
        ),
        child: SalomonBottomBar(
          backgroundColor: Colors.black,
          unselectedItemColor: Colors.white,
          currentIndex: _currentIndex,
          onTap: (i) {
            setState(() => _currentIndex = i);
            homeController.goToPage(_currentIndex);
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: const Icon(Icons.home),
              title: const Text("Projects"),
              selectedColor: Colors.purple,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: const Icon(Icons.people),
              title: const Text("People"),
              selectedColor: Colors.pink,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: const Icon(Icons.search),
              title: const Text("Search"),
              selectedColor: Colors.orange,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: const Icon(Icons.person),
              title: const Text("Profile"),
              selectedColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}

class SearchPost extends SearchDelegate {
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

class SearchUser extends SearchDelegate {
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
    final HomeController homeController = getIt<HomeController>();
    return FutureBuilder<List<User>>(
        future: homeController.fetchSuggestedUsers(query),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<User>? users = snapshot.data;
          return Container(
            margin: EdgeInsets.only(top: 20),
            child: ListView.builder(
                itemCount: users?.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onTap: () {
                      final UserDetailsController userDetailsController = getIt<UserDetailsController>();
                      Navigator.pop(context);
                      userDetailsController.getUserDetails(userID: users[index].id.toString());
                    },
                    title: Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(width: 20),
                        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                          Text(
                            '${users![index].username}',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10),
                          Text(
                            '${users![index].firstname} ${users![index].lastname}',
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

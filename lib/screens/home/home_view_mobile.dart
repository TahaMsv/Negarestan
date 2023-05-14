import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/core/constants/ui.dart';
import '../../core/constants/assets.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';

import 'home_controller.dart';
import 'home_state.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key, required this.childWidget}) : super(key: key);
  final HomeController homeController = getIt<HomeController>();
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    HomeState homeState = context.watch<HomeState>();
    return Scaffold(
      backgroundColor: theme.primaryColor,
      appBar: AppBar(
        iconTheme: IconThemeData(color: MyColors.darkBlue),
        backgroundColor: theme.primaryColor,
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Center(
              child: CircleAvatar(
                radius: 22.0, // adjust the radius as needed
                backgroundImage: AssetImage(AssetImages.admin_image), // or use AssetImage for local images
              ),
            ),
          ),
        ],
        title: Image(
          height: 50,
          width: 100,
          image: AssetImage(AssetImages.app_logo),
        ),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: Drawer(
        width: 250,
        backgroundColor: MyColors.white,
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            SizedBox(
              height: 180,
              child: DrawerHeader(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: CircleAvatar(
                        radius: 40.0, // adjust the radius as needed
                        backgroundImage: AssetImage(AssetImages.admin_image), // or use AssetImage for local images
                      ),
                    ),
                    SizedBox(height: 15,),
                    Text('Username', style: MyTextTheme.darkGreyW70020,),
                  ],
                ),
                decoration: BoxDecoration(
                  color: MyColors.white,
                ),
              ),
            ),
            ListTile(
              minLeadingWidth: 0,
              horizontalTitleGap: 10,
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              minLeadingWidth: 0,
              horizontalTitleGap: 10,
              leading: Icon(Icons.person),
              title: Text('Profile'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Container(
        child: childWidget,
      ),
    );
  }
}

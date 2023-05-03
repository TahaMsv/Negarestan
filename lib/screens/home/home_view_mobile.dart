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
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: MyColors.darkBlue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
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

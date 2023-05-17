import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/screens/search_screen/search_controller.dart';
import 'package:negarestan/screens/search_screen/search_state.dart';
import 'package:negarestan/widgets/image_circle_avatar.dart';
import 'package:scroll_navigation/misc/navigation_helpers.dart';
import 'package:scroll_navigation/navigation/title_scroll_navigation.dart';
import '../../core/constants/assets.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key}) : super(key: key);
  final SearchController searchController = getIt<SearchController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    SearchState searchState = context.watch<SearchState>();
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
      backgroundColor: theme.primaryColor,
      body: Container(
        height: height,
        child: Stack(
          children: [
            Center(child: SearchBar()),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 70),
                child: Wrap(
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    double width = Get.width;
    double height = Get.height;
    return Container(
      width: double.infinity,
      // color: Colors.red,
      child: Center(
        child: FloatingSearchBar(
          hint: 'Search...',
          scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
          transitionDuration: const Duration(milliseconds: 500),
          transitionCurve: Curves.easeInOut,
          physics: const BouncingScrollPhysics(),
          // axisAlignment: isPortrait ? 0.0 : -1.0,
          openAxisAlignment: 0.0,
          // width: isPortrait ? 600 : 500,
          debounceDelay: const Duration(milliseconds: 500),
          backdropColor: Colors.transparent,
          onQueryChanged: (query) {
            // Call your model, bloc, controller here.
          },
          transition: CircularFloatingSearchBarTransition(),

          builder: (context, transition) {

            return     ListView(
              // mainAxisSize: MainAxisSize.min,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(5, (index) => index).map((item) {
                return SearchAccountItem();
              }).toList(),
            );
            // return ClipRRect(
            //   borderRadius: BorderRadius.circular(8),
            //   child: Material(
            //     // color: Colors.white,
            //     elevation: 4.0,
            //     child: Column(
            //       mainAxisSize: MainAxisSize.min,
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         TitleScrollNavigation(
            //
            //           barStyle: TitleNavigationBarStyle(
            //               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //
            //               // padding: EdgeInsets.symmetric(horizontal: 40.0),
            //               spaceBetween: 100,
            //               background: Colors.transparent
            //
            //           ),
            //           titles: [
            //             "Accounts",
            //             "Posts",
            //           ],
            //           pages: [
            //             ListView(
            //               // mainAxisSize: MainAxisSize.min,
            //               // crossAxisAlignment: CrossAxisAlignment.start,
            //               children: List.generate(5, (index) => index).map((item) {
            //                 return SearchAccountItem();
            //               }).toList(),
            //             ),
            //             ListView(
            //               // mainAxisSize: MainAxisSize.min,
            //               // crossAxisAlignment: CrossAxisAlignment.start,
            //               children: ["item 1", "item 2", "item 3", "item 4", "item 5"].map((item) {
            //                 return SearchAccountItem();
            //               }).toList(),
            //             ),
            //           ],
            //         ),
            //       ],
            //
            //       // ["item 1", "item 2", "item 3", "item 4", "item 5"].map((item) {
            //       //   return SearchAccountItem();
            //       // }).toList(),
            //     ),
            //   ),
            // );
          },
        ),
      ),
    );
  }
}

class SearchAccountItem extends StatelessWidget {
  const SearchAccountItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 40,
      // padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
      margin: EdgeInsets.only(top: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color(0xffe0e0e0),
            offset: Offset(1, 1),
            blurRadius: 20,
            spreadRadius: 0.5,
          )
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageCircleAvatar(radius: 15,),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            height: 40,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Taha Mousavi",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xff8d8b8b)),
                ),
                // Text(
                //   "Subtitle",
                //   style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: Color(0xff8d8b8b)),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/screens/post_details/post_details_controller.dart';
import 'package:negarestan/screens/post_details/post_details_state.dart';
import 'package:negarestan/screens/user_details/user_details_controller.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/ui.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../widgets/MyElevatedButton.dart';
import '../../widgets/trens_post.dart';

class PostDetailsView extends StatelessWidget {
  PostDetailsView({Key? key}) : super(key: key);
  final PostDetailsController postDetailsController = getIt<PostDetailsController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    PostDetailsState postDetailsState = context.watch<PostDetailsState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    List trendsPost = [
      AssetImages.loginBG1,
      AssetImages.loginBG2,
      AssetImages.loginBG3,
      AssetImages.loginBG4,
      AssetImages.loginBG5,
      AssetImages.loginBG6,
      AssetImages.loginBG7,
    ];
    double galleryWidth = width - 26;
    return Scaffold(
      backgroundColor: MyColors.black,
      body: Container(
        // height: height,
        color: MyColors.black,
        child: postDetailsState.userDetails == null || postDetailsState.loading
            ? Center(child: CircularProgressIndicator())
            : ListView(
                children: [
                  Container(
                    color: MyColors.black,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    child: ListView(
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      postDetailsState.projectDetails!.title,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(color: MyColors.white, fontSize: 27),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      postDetailsState.projectDetails!.description,
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: MyColors.white, fontSize: 20),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      postDetailsState.userDetails!.username!,
                                      // textAlign: TextAlign.center,
                                      style: TextStyle(color: MyColors.white, fontSize: 16),
                                    ),
                                  ],
                                ),
                                // postDetailsState.isFollowBtnNeeded
                                //     ? MyElevatedButton(
                                //         height: 35,
                                //         width: 100,
                                //         buttonText: postDetailsState.isFollowed ? "Unfollow" : "Follow",
                                //         bgColor: postDetailsState.isFollowed ? MyColors.darkGrey : MyColors.darkBlue,
                                //         function: () {
                                //           final UserDetailsController userDetailsController = getIt<UserDetailsController>();
                                //           userDetailsController.changeStateOfFollow(postDetailsState.isFollowed, postDetailsState.userDetails!.id.toString());
                                //         },
                                //         textColor: Colors.white,
                                //         fgColor: Colors.white,
                                //         borderRadius: 20,
                                //         // borderColor: Colors.white,
                                //       )
                                //     : Container(),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    postDetailsController.changeLikeStateOfProject(postDetailsState.projectDetails!.id.toString());
                                  },
                                  icon: Icon(Icons.favorite, color: postDetailsState.isLiked ? MyColors.red : MyColors.white, size: 25),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.bookmark_border, color: MyColors.white, size: 25),
                                )
                              ],
                            )
                          ],
                        ),
                        Container(
                            // width: width,
                            // color: Colors.red,
                            height: 300,
                            child: PrefetchImageDemo()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: Text(
                      'More like this',
                      // textAlign: TextAlign.center,
                      style: const TextStyle(color: MyColors.white, fontSize: 19),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: MyColors.black,
                    alignment: Alignment.topCenter,
                    child: TrendPostsList(
                      galleryWidth: galleryWidth,
                      posts: trendsPost,
                      numberOfPosts: 6,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}

class PrefetchImageDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PrefetchImageDemoState();
  }
}

class _PrefetchImageDemoState extends State<PrefetchImageDemo> {
  List images = [
    AssetImages.loginBG1,
    AssetImages.loginBG2,
    AssetImages.loginBG3,
    AssetImages.loginBG4,
    AssetImages.loginBG5,
    AssetImages.loginBG6,
    AssetImages.loginBG7,
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
        child: CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
        autoPlay: false,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, index, realIdx) {
        return Container(
          child: Center(
            child: Image(image: AssetImage(images[index]), fit: BoxFit.cover, width: width),
          ),
        );
      },
    ));
  }
}

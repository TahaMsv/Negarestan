import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/screens/home/home_state.dart';
import 'package:negarestan/screens/post_details/post_details_controller.dart';
import 'package:negarestan/screens/post_details/post_details_state.dart';
import 'package:negarestan/screens/user_details/user_details_controller.dart';
import '../../core/constants/assets.dart';
import '../../core/constants/ui.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../widgets/MyElevatedButton.dart';
import '../../widgets/UserTextInput.dart';
import '../../widgets/trens_post.dart';

class PostDetailsView extends StatelessWidget {
  PostDetailsView({Key? key}) : super(key: key);
  final PostDetailsController postDetailsController = getIt<PostDetailsController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    PostDetailsState postDetailsState = context.watch<PostDetailsState>();
    HomeState homeState = context.watch<HomeState>();
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
                                  onPressed: () {
                                    postDetailsController.changeBookmarkStateOfProject("projectId");
                                  },
                                  icon: Icon(postDetailsState.isBookmarked ? Icons.bookmark : Icons.bookmark_border, color: MyColors.white, size: 25),
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
                      'Comments',
                      // textAlign: TextAlign.center,
                      style: const TextStyle(color: MyColors.white, fontSize: 19),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Wrap(
                      children: List.generate(
                        postDetailsState.comments.length,
                        (index) => Container(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          margin: const EdgeInsets.symmetric(vertical: 5.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                color: MyColors.white,
                                // margin: const EdgeInsets.only(bottom: 20),
                                child: Container(
                                  margin: const EdgeInsets.all(5),
                                  padding: const EdgeInsets.all(5),
                                  // height: 30,
                                  width: 300,
                                  // color: MyColors.blueAccent,
                                  child: Text(postDetailsState.comments[index].content),
                                ),
                              ),
                              if (postDetailsState.comments[index].user == homeState.user.id)
                                IconButton(
                                    onPressed: () {
                                      _asyncConfirmDialog(context, postDetailsState.comments[index].id);
                                    },
                                    icon: Icon(
                                      Icons.close,
                                      color: Colors.red,
                                    ))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          UserTextInput(
                            height: 70,
                            hint: 'Comment',
                            hintColor: Colors.white,
                            textColor: Colors.white,
                            controller: postDetailsState.commentC,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          MyElevatedButton(
                            height: 50,
                            width: 150,
                            buttonText: "Add comment",
                            fontSize: 15,
                            bgColor: MyColors.myBlue,
                            textColor: MyColors.white,
                            fgColor: MyColors.white,
                            // isLoading: loginState.loginLoading,
                            function: () {
                              postDetailsController.addComment();
                            },
                          ),
                        ],
                      )
                    ],
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

enum ConfirmAction { Cancel, Accept }

Future<Future<ConfirmAction?>> _asyncConfirmDialog(BuildContext context, int commentID) async {
  return showDialog<ConfirmAction>(
    context: context,
    barrierDismissible: false, // user must tap button for close dialog!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Delete comment'),
        content: const Text('Are you sure?'),
        actions: <Widget>[
          MyElevatedButton(
            height: 30,
            width: 80,
            buttonText: "No",
            textColor: Colors.black,
            bgColor: Colors.blueAccent,
            function: () {
              Navigator.of(context).pop(ConfirmAction.Cancel);
            },
          ),
          MyElevatedButton(
            height: 30,
            width: 80,
            buttonText: "Yes",
            textColor: Colors.black,
            bgColor: Colors.blueAccent,
            function: () async {
              final PostDetailsController postDetailsController = getIt<PostDetailsController>();
              await postDetailsController.deleteComment(commentID);
              Navigator.of(context).pop(ConfirmAction.Accept);
            },
          ),
        ],
      );
    },
  );
}

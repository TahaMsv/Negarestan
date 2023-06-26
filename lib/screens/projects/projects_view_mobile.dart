import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/core/constants/route_names.dart';
import 'package:negarestan/core/constants/ui.dart';
import 'package:negarestan/screens/projects/projects_controller.dart';
import 'package:negarestan/screens/projects/projects_state.dart';
import 'package:responsive_grid_list/responsive_grid_list.dart';
import '../../core/constants/assets.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';

class ProjectsView extends StatelessWidget {
  ProjectsView({Key? key}) : super(key: key);
  final ProjectsController projectsController = getIt<ProjectsController>();

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ProjectsState projectsState = context.watch<ProjectsState>();
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black87,
      body: SizedBox(
        height: height,
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            Center(
              child: projectsState.projects.isEmpty
                  ? const Text(
                      'Loading projects',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: MyColors.white, fontSize: 17),
                    )
                  : Container(
                      child: Wrap(
                        children: List.generate(
                          projectsState.projects.length,
                          (index) => GestureDetector(
                            onTap: () {
                              projectsController.nav.pushNamed('postDetails');
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
                                                '0',
                                                textAlign: TextAlign.center,
                                                style: TextStyle(color: MyColors.white),
                                              ),
                                              SizedBox(width: 3),
                                              Icon(Icons.remove_red_eye, color: MyColors.blueAccent, size: 20)
                                            ],
                                          ),
                                          Text(
                                            projectsState.projects[index].title,
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(color: MyColors.white, fontSize: 17),
                                          ),
                                          Row(
                                            children: [
                                              Icon(Icons.favorite, color: MyColors.red, size: 20),
                                              SizedBox(width: 3),
                                              Text(
                                                '${projectsState.projects[index].likes.length}',
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          projectsController.nav.pushNamed('createPost');
        },
        backgroundColor: MyColors.myBlue,
        child: const Icon(Icons.add_circle),
      ),
    );
  }
}

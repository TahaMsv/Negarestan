import 'package:dio/dio.dart';
import 'package:negarestan/screens/projects/projects_repository.dart';
import 'package:negarestan/screens/projects/projects_state.dart';

import '../../core/classes/Project.dart';
import '../../core/constants/apis.dart';
import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';
import '../home/home_state.dart';

class ProjectsController extends MainController {
  final ProjectsState projectsState = getIt<ProjectsState>();
  final ProjectsRepository projectsRepository = getIt<ProjectsRepository>();

  void fetchSuggestedProjects() async {
    if (!projectsState.loading) {
      projectsState.setLoading(true);
      try {
        final dio = Dio();
        final HomeState homeState = getIt<HomeState>();
        String token = homeState.user.token!;
        dio.options.headers["Authorization"] = "Token $token";
        final response = await dio.get(Apis.baseUrl + Apis.suggestProjects);
        if (response.statusCode == 200) {
          print(response.data);
          projectsState.setProjects(List<Project>.from(response.data.map((x) => Project.fromJson(x))));
          print(projectsState.projects);
        }
      } catch (e) {
        projectsState.setLoading(false);
      }
    }
    projectsState.setLoading(false);
  }


  @override
  void onCreate() {}
}

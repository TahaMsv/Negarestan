import 'package:negarestan/screens/projects/projects_repository.dart';
import 'package:negarestan/screens/projects/projects_state.dart';

import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';

class ProjectsController extends MainController {

  final ProjectsState projectsState = getIt<ProjectsState>();
  final ProjectsRepository projectsRepository = getIt<ProjectsRepository>();

  @override
  void onCreate() {}
}

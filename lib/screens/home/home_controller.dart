import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';
import 'home_repository.dart';
import 'home_state.dart';

class HomeController extends MainController {

  final HomeState homeState = getIt<HomeState>();
  final HomeRepository homeRepository = getIt<HomeRepository>();

  @override
  void onCreate() {}
}

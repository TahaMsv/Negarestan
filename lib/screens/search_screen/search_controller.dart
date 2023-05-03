import 'package:negarestan/screens/search_screen/search_repository.dart';
import 'package:negarestan/screens/search_screen/search_state.dart';

import '../../core/dependency_injection.dart';
import '../../core/interfaces/controller.dart';

class SearchController extends MainController {

  final SearchState searchState = getIt<SearchState>();
  final SearchRepository searchRepository = getIt<SearchRepository>();

  @override
  void onCreate() {}
}

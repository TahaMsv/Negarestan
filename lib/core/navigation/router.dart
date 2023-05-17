import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:negarestan/screens/People/people_view_mobile.dart';
import '../../screens/home/home_view_mobile.dart';
import '../../screens/login/login_state.dart';
import '../../screens/login/login_view_mobile.dart';
import '../../screens/profile/profile_view_mobile.dart';
import '../../screens/projects/projects_view_mobile.dart';
import '../../screens/search_screen/search_view_mobile.dart';
import '../constants/route_names.dart';
import '../dependency_injection.dart';

class MyRouter {
  MyRouter._();

  static final MyRouter _instance = MyRouter._();

  factory MyRouter() => _instance;
  static late GoRouter _router;
  static late List<RouteBase> _routes;

  static void initialize() {
    final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
    final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
    _routes = <RouteBase>[
      MyRoute(
          showInMainRoute: false,
          name: RouteNames.login,
          path: RouteNames.login,
          title: 'Login',
          builder: (BuildContext context, GoRouterState state) {
            return LoginView();
          }),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (BuildContext context, GoRouterState state, Widget child) {
          return HomeView(
            childWidget: child,
          );
          // }
        },
        routes: <RouteBase>[
          GoRoute(
            path: RouteNames.projects,
            name: RouteNames.projects,
            builder: (BuildContext context, GoRouterState state) {
              return ProjectsView();
              // }
            },
          ),
          GoRoute(
            path: RouteNames.people,
            name: RouteNames.people,
            builder: (BuildContext context, GoRouterState state) {
              return PeopleView();
              // }
            },
          ),
          GoRoute(
            path: RouteNames.search,
            name: RouteNames.search,
            builder: (BuildContext context, GoRouterState state) {
              return SearchView();
              // }
            },
          ),
          GoRoute(
            path: RouteNames.profile,
            name: RouteNames.profile,
            builder: (BuildContext context, GoRouterState state) {
              return ProfileView();
              // }
            },
          ),
        ],
      ),
    ];
    _router = GoRouter(
      initialLocation: RouteNames.search,
      refreshListenable: getIt<LoginState>(),
      routes: _routes,
      redirect: (state) {
        // LoginState loginState = getIt<LoginState>();
        // // if the user is not logged in, they need to login
        // final loggedIn = loginState.user != null;
        // final loggingIn = state.subloc == '/login';
        // if (!loggedIn) return loggingIn ? null : '/login';
        //
        // // if the user is logged in but still on the login page, send them to
        // // the home page
        // if (loggingIn) return '/';

        // no need to redirect at all
        return null;
      },
    );
  }


  static GoRouter get router => _router;

  // static List<MyRoute> get routes => _routes;

  static BuildContext get context => _router.navigator!.context;
}

class MyRoute extends GoRoute {
  final String title;
  final String name;
  final Widget Function(BuildContext, GoRouterState) builder;
  final List<MyRoute> routes;
  final bool showInMainRoute;

  MyRoute({required String path, required this.title, required this.name, required this.builder, this.routes = const [], this.showInMainRoute = true})
      : super(
          path: path,
          name: name,
          builder: builder,
          routes: routes,
          pageBuilder: (context, state) => NoTransitionPage<void>(key: state.pageKey, child: builder(context, state)),
        );

  Map<String, MyRoute> get getAllSubs {
    Map<String, MyRoute> matches = {title: this};
    for (var rr in routes) {
      String match = (path + '/' + rr.path).split(":")[0];
      matches.putIfAbsent(match, () => rr);
      for (var rrr in rr.routes) {
        String match2 = (path + '/' + rr.path + "/" + rrr.path).split(":")[0];
        matches.putIfAbsent(match2, () => rrr);
      }
      // print(match);
    }
    return matches;
  }
}

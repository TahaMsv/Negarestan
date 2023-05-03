import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:negarestan/screens/search_screen/search_controller.dart';
import 'package:negarestan/screens/search_screen/search_state.dart';
import '../../core/dependency_injection.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  SearchView({Key? key, required this.childWidget}) : super(key: key);
  final SearchController searchController = getIt<SearchController>();
  final Widget childWidget;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    SearchState searchState = context.watch<SearchState>();
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(10),
          child:
              // Column(
              //   children: [
              Text("Search"),
          //   SizedBox(
          //     height: 50,
          //   ),
          //   childWidget
          // ],
          // ),
        ),
      ),
    );
  }
}

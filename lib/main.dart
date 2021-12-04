import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:students_launcher/all_apps_screen.dart';
import 'package:students_launcher/favorite_apps_screen.dart';
import 'package:students_launcher/widgets_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final PageController controller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme:
            ThemeData(primarySwatch: Colors.blue, brightness: Brightness.dark),
        home: PageView(
          scrollDirection: Axis.horizontal,
          controller: controller,
          children: const <Widget>[
            WidgetsScreen(),
            FavoriteAppsScreen(),
            AllAppsScreen(),
          ],
        ));
  }
}

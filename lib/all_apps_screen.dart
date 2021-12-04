import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:students_launcher/appTile.dart';
import 'package:students_launcher/helper.dart';

class AllAppsScreen extends StatefulWidget {
  const AllAppsScreen({Key? key}) : super(key: key);

  @override
  _AllAppsScreenState createState() => _AllAppsScreenState();
}

class _AllAppsScreenState extends State<AllAppsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All apps"),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: Helper.getAllApps(),
        builder: ((context, snapshot) {
          if (snapshot.hasData) {
            var apps = snapshot.data as List<AppInfo>;
            return ListView.builder(
                itemCount: apps.length,
                itemBuilder: (context, index) {
                  return AppTile(
                    isNeedShowStar: true,
                    appInfo: apps.elementAt(index),
                  );
                });
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        }),
      ),
    );
  }
}

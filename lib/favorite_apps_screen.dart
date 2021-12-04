import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:quds_ui_kit/viewers/quds_digital_clock_viewer.dart';
import 'package:students_launcher/appTile.dart';

import 'helper.dart';

class FavoriteAppsScreen extends StatefulWidget {
  const FavoriteAppsScreen({Key? key}) : super(key: key);

  @override
  _FavoriteAppsScreenState createState() => _FavoriteAppsScreenState();
}

class _FavoriteAppsScreenState extends State<FavoriteAppsScreen> {
  List<AppInfo> _apps = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 64),
            const QudsDigitalClockViewer(
              backgroundColor: Colors.transparent,
              showTimePeriod: false,
              showSeconds: false,
              style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
            ),
            Expanded(child: Container(),),
            Expanded(
              child: FutureBuilder(
                future: Helper.getFavoriteApps(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    try {
                      _apps = snapshot.data as List<AppInfo>;
                    } catch (ex) {
                      _apps = <AppInfo>[];
                    }

                    if (_apps.isNotEmpty) {
                      return ListView.builder(
                          itemCount: _apps.length,
                          itemBuilder: (context, index) {
                            return AppTile(
                              isNeedShowStar: false,
                              appInfo: _apps.elementAt(index),
                            );
                          });
                    } else {
                      return const Center(
                        child: Text("no favorite"),
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

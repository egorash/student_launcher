import 'package:flutter/material.dart';
import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:students_launcher/helper.dart';

class AppTile extends StatefulWidget {
  final AppInfo appInfo;
  final bool isNeedShowStar;
  const AppTile({Key? key, required this.appInfo, required this.isNeedShowStar})
      : super(key: key);

  @override
  _AppTileState createState() => _AppTileState();
}

class _AppTileState extends State<AppTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: (() {
          InstalledApps.startApp(widget.appInfo.packageName!);
        }),
        title: Text(widget.appInfo.name!),
        leading: Image.memory(
          widget.appInfo.icon!,
          width: 32,
        ),
        trailing: widget.isNeedShowStar
            ? IconButton(
                icon: Icon(
                    Helper.isFavorite(widget.appInfo)
                        ? Icons.star
                        : Icons.star_border,
                    color: Helper.isFavorite(widget.appInfo)
                        ? Colors.amber
                        : Colors.grey),
                onPressed: () {
                  setState(() {
                    if (Helper.isFavorite(widget.appInfo)) {
                      Helper.removeFromFavorite(widget.appInfo);
                    } else {
                      Helper.addToFavorite(widget.appInfo);
                    }
                  });
                },
              )
            : SizedBox(
                width: 1,
                height: 1,
              ));
  }
}

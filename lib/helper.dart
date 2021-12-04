import 'dart:convert';

import 'package:installed_apps/app_info.dart';
import 'package:installed_apps/installed_apps.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Helper {
  static List<String> _favorite = [];

  static addToFavorite(AppInfo app) {
    if (!_favorite.contains(app.packageName!)) {
      _favorite.add(app.packageName!);
      saveFavorite();
    }
  }

  static removeFromFavorite(AppInfo app) {
    if (_favorite.contains(app.packageName!)) {
      _favorite.remove(app.packageName!);
      saveFavorite();
    }
  }

  static isFavorite(AppInfo app) {
    return _favorite.contains(app.packageName!);
  }

  static Future<List<AppInfo>> getFavoriteApps() async {
    await loadFavorite();
    List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true, "");
    var favoriteApps = apps
        .where((element) => _favorite.contains(element.packageName))
        .toList();
    return favoriteApps;
  }

  static Future<List<AppInfo>> getAllApps() async {
    List<AppInfo> apps = await InstalledApps.getInstalledApps(true, true, "");
    return apps;
  }

  static saveFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    print("@@@!" + _favorite.toString());
    await prefs.setStringList("favorite", _favorite);
  }

  static loadFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getStringList("favorite");
    print("@@@" + data.toString());
    _favorite = data!;
  }
}

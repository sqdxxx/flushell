library flushell;

import 'package:cool_alert/cool_alert.dart';
import 'package:flushell/analytics.dart';
import 'package:flushell/ui/alert.dart';
import 'package:flushell/ui/color.dart';
import 'package:flushell/ui/toast.dart';
import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sh = Shell();

extension ThemeExt on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
}

class Shell {

  late SharedPreferences pref;
  late PackageInfo packageInfo;
  Alert alert = Alert();
  Toast toast = Toast();
  ColorUtil colors = ColorUtil();
  late Env env;
  late Analytics analytics;

  initialize({required Env env}) async {
    this.env = env;

    pref = await SharedPreferences.getInstance();
    packageInfo = await PackageInfo.fromPlatform();
    analytics = Analytics();
  }

  show() {
    print("shell ok");
  }
}


class Env {
  String icp;
  String agreementUrl;
  String privateUrl;
  String? analyticsKeyAndroid;
  String? analyticsKeyIOS;
  Env({required this.icp, required this.agreementUrl, required this.privateUrl, this.analyticsKeyAndroid, this.analyticsKeyIOS});
}
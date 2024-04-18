
import 'package:flutter/foundation.dart';
import 'package:umeng_common_sdk/umeng_common_sdk.dart';

import 'flushell.dart';


class Analytics {

  Analytics() {
    if (kReleaseMode) {
      UmengCommonSdk.initCommon(sh.env.analyticsKeyAndroid??"", sh.env.analyticsKeyIOS??"", "AppStore");
    }
  }


  /// 日志
  void event(String name, [Map<String, dynamic>? params]) async{

    if (kDebugMode) {
      return;
    }

    try {

      final map = params ?? {};
      UmengCommonSdk.onEvent(name, map);;
    } catch (e) {
      //
      print(e);
    }
  }
}
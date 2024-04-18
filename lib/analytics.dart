
import 'package:umeng_common_sdk/umeng_common_sdk.dart';

import 'flushell.dart';


class Analytics {

  Analytics() {
    UmengCommonSdk.initCommon(sh.env.analyticsKeyAndroid??"", sh.env.analyticsKeyIOS??"", "AppStore");
  }


  /// 日志
  void event(String name, [Map<String, dynamic>? params]) async{

    try {

      final map = params ?? {};
      UmengCommonSdk.onEvent(name, map);;
    } catch (e) {
      //
      print(e);
    }
  }
}
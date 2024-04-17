library flushell;

import 'package:cool_alert/cool_alert.dart';
import 'package:flushell/ui/alert.dart';
import 'package:shared_preferences/shared_preferences.dart';


final sh = Shell();

class Shell {

  late SharedPreferences pref;
  Alert alert = Alert();

  initialize() async {
    pref = await SharedPreferences.getInstance();
  }

  show() {
    print("shell ok");
  }
}
library flushell;

import 'package:flushell/database/shared_preferences_table.dart';

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}


final sh = Shell();

class Shell {

  Shell () {

  }


  show() {
    print("shell ok");
  }
}
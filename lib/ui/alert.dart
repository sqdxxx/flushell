import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/cupertino.dart';



class Alert {

  show(BuildContext context, String title, String content, {CoolAlertType type = CoolAlertType.confirm, VoidCallback? onConfirmBtnTap}) {
    CoolAlert.show(
      context: context,
      type: type,
      title: title,
      text: content,
      confirmBtnText: "确定",
      cancelBtnText: "取消",
      onConfirmBtnTap: onConfirmBtnTap
    );
  }
}
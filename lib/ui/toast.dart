


import 'package:flutter/cupertino.dart';
import 'package:flutter_svprogresshud/flutter_svprogresshud.dart';
import 'package:toastification/toastification.dart';

class Toast {

  loading() {
    SVProgressHUD.show();
  }
  dismiss() {
    SVProgressHUD.dismiss();
    toastification.dismissAll();
  }

  success(BuildContext context, String message) {

    toastification.show(
      context: context,
      type: ToastificationType.success,
      style: ToastificationStyle.fillColored,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  error(BuildContext context, String message) {

    toastification.show(
      context: context,
      type: ToastificationType.error,
      style: ToastificationStyle.fillColored,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  info(BuildContext context, String message) {

    toastification.show(
      context: context,
      type: ToastificationType.info,
      style: ToastificationStyle.fillColored,
      title: Text(message),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }




}

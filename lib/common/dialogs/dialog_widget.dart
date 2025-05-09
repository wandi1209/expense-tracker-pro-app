import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expense_tracker_pro/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

AwesomeDialog successDialog(BuildContext context, String desc) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.rightSlide,
    title: 'Success',
    desc: desc,
    btnOkOnPress: () {},
    btnOkColor: AppColors.primary,
    dismissOnTouchOutside: false,
  );
}

AwesomeDialog warningDialog(
  BuildContext context,
  String desc,
  VoidCallback onPressOk,
) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    headerAnimationLoop: false,
    animType: AnimType.topSlide,
    showCloseIcon: true,
    closeIcon: const Icon(Icons.close_fullscreen_outlined),
    title: 'Warning',
    desc: desc,
    btnCancelOnPress: () {},
    onDismissCallback: (type) {
      debugPrint('Dialog Dismiss from callback $type');
    },
    btnOkOnPress: onPressOk,
  );
}

AwesomeDialog errorDialog(BuildContext context, String desc) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.error,
    animType: AnimType.rightSlide,
    headerAnimationLoop: false,
    title: 'Error',
    desc: desc,
    btnOkOnPress: () {},
    btnOkIcon: Icons.cancel,
    btnOkColor: Colors.red,
  );
}

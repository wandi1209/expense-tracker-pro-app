import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:expense_tracker_pro/core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

AwesomeDialog successDialog(BuildContext context, String title, String desc) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.success,
    animType: AnimType.rightSlide,
    title: 'Success',
    desc: 'Dialog will close in 2 seconds',
    btnOkOnPress: () {},
    btnOkColor: AppColors.primary,
    dismissOnTouchOutside: false,
  );
}

Future warningDialog(BuildContext context, String title, String desc) {
  return AwesomeDialog(
    context: context,
    dialogType: DialogType.warning,
    headerAnimationLoop: false,
    animType: AnimType.topSlide,
    showCloseIcon: true,
    closeIcon: const Icon(Icons.close_fullscreen_outlined),
    title: 'Warning',
    desc:
        'Dialog description here..................................................',
    btnCancelOnPress: () {},
    onDismissCallback: (type) {
      debugPrint('Dialog Dismiss from callback $type');
    },
    btnOkOnPress: () {},
  ).show();
}

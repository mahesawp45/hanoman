// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ModalDialog {
  final Widget? title;
  final Widget? content;

  ModalDialog({
    this.title,
    this.content,
  });

  showAnimatedDialog(BuildContext context) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) => const SizedBox(),
      barrierDismissible: true,
      barrierLabel: 'dialog',
      transitionDuration: const Duration(milliseconds: 300),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeInOutCubicEmphasized,
            ),
          ),
          child: AlertDialog(
            title: title,
            content: content,
            contentPadding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
          ),
        );
      },
    );
  }
}

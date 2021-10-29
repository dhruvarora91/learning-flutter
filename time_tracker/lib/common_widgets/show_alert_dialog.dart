import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future showAlertDialog({
  required BuildContext context,
  required String title,
  required String content,
  required String defaultActionText,
}) {
  return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text(defaultActionText),
            )
          ],
        );
      });
}

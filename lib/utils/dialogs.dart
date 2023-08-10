import 'package:flutter/material.dart';

showmessage(BuildContext context, String headline, String message) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(headline),
      content: Text(message),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("OK"),
        ),
      ],
    ),
  );
}

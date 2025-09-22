import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final IconData icon;
  final String title;
  final String message;
  final String textButton;
  final TextEditingController controller;

  const CustomDialog({
    super.key,
    required this.icon,
    required this.title,
    required this.message,
    required this.textButton,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actionsAlignment: MainAxisAlignment.center,
      icon: Icon(icon, size: 80),
      title: Text(title),
      content: Text(message),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            controller.clear();
          },
          child: Text(textButton),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final String title;
  final IconData icon;
  final String subtitle;

  const CustomTitle({
    super.key,
    required this.title,
    required this.icon,
    required this.subtitle,
  });

  //this aponta o parametro da classe

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(icon),
            SizedBox(width: 8),
            Text(
              title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        Text(subtitle),
      ],
    );
  }
}

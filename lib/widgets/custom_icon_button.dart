import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  IconData icon;
  String title;
  VoidCallback onTap;
  CustomIconButton(
      {Key? key, required this.icon, required this.title, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}

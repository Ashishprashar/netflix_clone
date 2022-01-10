import 'package:flutter/material.dart';

class TextIconButton extends StatelessWidget {
  IconData icon;
  String title;
  VoidCallback onTap;
  double height;
  double width;
  Color color;
  Color textColor;

  TextIconButton(
      {Key? key,
      required this.icon,
      required this.title,
      required this.onTap,
      required this.height,
      required this.color,
      required this.textColor,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        decoration:
            BoxDecoration(color: color, borderRadius: BorderRadius.circular(5)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: textColor,
            ),
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  ?.copyWith(color: textColor),
            )
          ],
        ),
      ),
    );
  }
}

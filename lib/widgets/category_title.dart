import 'package:flutter/material.dart';

class CategoryTitle extends StatelessWidget {
  String title;
  CategoryTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 12),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: Theme.of(context)
            .textTheme
            .headline6!
            .copyWith(color: Theme.of(context).primaryColorLight),
      ),
    );
  }
}

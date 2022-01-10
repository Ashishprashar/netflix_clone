import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/screen/main_home.dart';

class NavigatorServices {
  navigatrToHome(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (ctx) => const MainHome()));
  }
}

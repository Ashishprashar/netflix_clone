import 'package:flutter/material.dart';
import 'package:netflix_clone/services/navigator_services.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2))
        .then((value) => NavigatorServices().navigatrToHome(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: Text("NETFLIX",
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Theme.of(context).primaryColor)),
        ));
  }
}

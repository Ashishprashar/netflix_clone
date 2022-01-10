import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    var sizeData = MediaQuery.of(context);
    return SizedBox(
      height: sizeData.size.height * .2,
      width: sizeData.size.width,
      child: Column(
        children: [
          SizedBox(
              height: sizeData.size.height * .1,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      "assets/logo.jpg",
                      height: 60,
                    ),
                    SizedBox(
                      width: sizeData.size.width * .2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Icon(Icons.search),
                          Icon(Icons.account_box_outlined)
                        ],
                      ),
                    )
                  ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Tv Shows",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "Movies",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Text(
                "Categories",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ],
          )
        ],
      ),
    );
  }
}

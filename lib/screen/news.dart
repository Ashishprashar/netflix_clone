import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/widgets/side_icon_button.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    var sizeData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        // leading: Container(),
        // titleSpacing: 0,
        title: Text("News & Hot",
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(color: Theme.of(context).primaryColorLight)),
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          const Icon(Icons.notifications),
          Container(
              margin: const EdgeInsets.all(8),
              child: const Icon(Icons.account_box_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 55,
              width: sizeData.size.width,
              child: Row(
                children: [
                  Container(
                    height: 35,
                    width: sizeData.size.width / 2.5,
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Theme.of(context).cardColor),
                    child: Center(
                        child: Text("Coming Soon",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(fontWeight: FontWeight.bold))),
                  ),
                  Container(
                    height: 35,
                    width: sizeData.size.width / 2.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      // color: Theme.of(context).cardColor
                    ),
                    child: Center(
                        child: Text("Everyone's Watching",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Theme.of(context).cardColor))),
                  ),
                ],
              ),
            ),
            Container(
              height: sizeData.size.height * .4,
              padding: const EdgeInsets.all(10),
              // color: Colors.white,
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "JAN",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        "21",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 30),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: sizeData.size.height * .5 * .4,
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          width: sizeData.size.width * .8,
                          child: Image.network(
                            Movies().movies2[1].image,
                            fit: BoxFit.cover,
                          )),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        width: sizeData.size.width * .8,
                        // height: sizeData.size.height * .5 * .4,
                        child: Text("New movie update",
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(Movies().movies2[1].description,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                      fontSize: 14,
                                      color:
                                          Theme.of(context).primaryColorDark)))
                    ],
                  ))
                ],
              ),
            ),
            Container(
              height: sizeData.size.height * .4,
              padding: const EdgeInsets.all(10),
              // color: Colors.white,
              child: Row(
                children: [
                  Column(
                    children: [
                      Text(
                        "JAN",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                      Text(
                        "14",
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            ?.copyWith(fontSize: 30),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          height: sizeData.size.height * .5 * .4,
                          padding: const EdgeInsets.only(left: 10, top: 10),
                          width: sizeData.size.width * .8,
                          child: Image.network(
                            Movies().movies2[0].image,
                            fit: BoxFit.cover,
                          )),
                      Container(
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 10, top: 10),
                        width: sizeData.size.width * .8,
                        // height: sizeData.size.height * .5 * .4,
                        child: Text("New movie update",
                            style: Theme.of(context).textTheme.bodyText1),
                      ),
                      Container(
                          padding: const EdgeInsets.all(10),
                          child: Text(Movies().movies2[0].description,
                              style: Theme.of(context)
                                  .textTheme
                                  .caption
                                  ?.copyWith(
                                      fontSize: 14,
                                      color:
                                          Theme.of(context).primaryColorDark)))
                    ],
                  ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

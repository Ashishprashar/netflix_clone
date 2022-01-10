import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/screen/movie_details.dart';
import 'package:netflix_clone/screen/movie_play.dart';
import 'package:netflix_clone/widgets/bottom_movie_detail_sheet.dart';
import 'package:netflix_clone/widgets/category_widget.dart';
import 'package:netflix_clone/widgets/custom_app_bar.dart';
import 'package:netflix_clone/widgets/custom_elevated_button.dart';
import 'package:netflix_clone/widgets/custom_icon_button.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  onPressed() {}
  @override
  Widget build(BuildContext context) {
    var sizeData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColorLight,
          onPressed: () {},
          child: Icon(
            Icons.shuffle,
            color: Theme.of(context).errorColor,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          barrierColor:
                              Theme.of(context).backgroundColor.withOpacity(0),
                          context: context,
                          builder: (ctx) => BottomMovieDetailSheet(
                              movie: Movies().movies[0]));
                    },
                    child: SizedBox(
                        width: sizeData.size.width,
                        height: sizeData.size.height * .6,
                        child: Image.network(
                            "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/images%20(1).jfif?alt=media&token=d85b4b4f-c7ff-4be0-8ef4-c9bb2be52b29",
                            fit: BoxFit.fill)),
                  ),
                  Positioned(
                    // left: 0,
                    // top: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: sizeData.padding.top),
                      child: const CustomAppBar(),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: sizeData.size.height * .08,
                        decoration: BoxDecoration(
                            color: Theme.of(context)
                                .backgroundColor
                                .withOpacity(.7)),
                        padding: EdgeInsets.symmetric(
                            vertical: 12, horizontal: sizeData.size.width * .1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomIconButton(
                                icon: Icons.add,
                                title: "My List",
                                onTap: () {}),
                            TextIconButton(
                              color: Theme.of(context).primaryColorLight,
                              icon: Icons.play_arrow,
                              textColor: Theme.of(context).backgroundColor,
                              title: "Play",
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    barrierColor: Theme.of(context)
                                        .backgroundColor
                                        .withOpacity(0),
                                    context: context,
                                    builder: (ctx) => BottomMovieDetailSheet(
                                        movie: Movies().movies[0]));
                              },
                              height: sizeData.size.height * .05,
                              width: sizeData.size.width * .25,
                            ),
                            CustomIconButton(
                              icon: Icons.info,
                              title: "Info",
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (ctx) => MovieDetails(
                                        movie: Movies().movies[0])));
                              },
                            )
                          ],
                        ),
                      ))
                ],
              ),
              CategoryWidget(
                categoryTitle: "Category 1",
                movies: Movies().movies,
              ),
              CategoryWidget(
                categoryTitle: "Category 2",
                movies: Movies().movies2,
              ),
              CategoryWidget(
                categoryTitle: "Category 3",
                movies: Movies().movies,
              ),
              CategoryWidget(
                categoryTitle: "Category 4",
                movies: Movies().movies2,
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/screen/movie_details.dart';
import 'package:netflix_clone/screen/movie_play.dart';
import 'package:netflix_clone/widgets/custom_elevated_button.dart';

import 'custom_icon_button.dart';

class BottomMovieDetailSheet extends StatefulWidget {
  Movie movie;
  BottomMovieDetailSheet({Key? key, required this.movie}) : super(key: key);

  @override
  _BottomMovieDetailSheetState createState() => _BottomMovieDetailSheetState();
}

class _BottomMovieDetailSheetState extends State<BottomMovieDetailSheet> {
  @override
  Widget build(BuildContext context) {
    var sizeData = MediaQuery.of(context);
    return Container(
      height: 290,
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                  height: 130,
                  width: sizeData.size.width * .25,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                    widget.movie.image,
                    fit: BoxFit.cover,
                  )),
              Container(
                margin: const EdgeInsets.all(10),
                height: 150,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: sizeData.size.width * .6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            widget.movie.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                ?.copyWith(fontSize: 20),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).primaryColorDark,
                              radius: 15,
                              child: Icon(
                                Icons.close,
                                color: Theme.of(context).primaryColorLight,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: sizeData.size.width * .4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "2021",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    color: Theme.of(context).primaryColorDark),
                          ),
                          Text(
                            "7+",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    color: Theme.of(context).primaryColorDark),
                          ),
                          Text(
                            "1h 40m",
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(
                                    color: Theme.of(context).primaryColorDark),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      width: sizeData.size.width * .6,
                      child: Text(
                        widget.movie.description,
                        maxLines: 6,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextIconButton(
                  textColor: Theme.of(context).backgroundColor,
                  icon: Icons.play_arrow,
                  title: "Play",
                  color: Theme.of(context).primaryColorLight,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (ctx) => MoviePlayScreen(
                            title: widget.movie.title,
                            video: widget.movie.video)));
                  },
                  height: sizeData.size.height * .05,
                  width: sizeData.size.width * .25,
                ),
                CustomIconButton(
                  icon: Icons.download,
                  onTap: () {},
                  title: 'Download',
                ),
                CustomIconButton(
                  icon: Icons.play_arrow_outlined,
                  onTap: () {},
                  title: 'Preview',
                ),
              ],
            ),
          ),
          Divider(
            color: Theme.of(context).primaryColorLight,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (ctx) => MovieDetails(movie: widget.movie)));
            },
            child: Container(
              width: sizeData.size.width,
              padding: const EdgeInsets.only(
                  left: 10.0, right: 10, bottom: 15, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // SizedBox(
                  //   width: sizeData.size.width * .4,
                  //   child: Row(
                  //     children: [
                  const Icon(Icons.info_outline_rounded),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        "Details & More",
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  //   ],
                  // ),
                  // ),
                  const Icon(Icons.chevron_right),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

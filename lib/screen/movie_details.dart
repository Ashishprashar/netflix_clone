import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/screen/movie_play.dart';
import 'package:netflix_clone/widgets/custom_elevated_button.dart';
import 'package:netflix_clone/widgets/custom_icon_button.dart';
import 'package:video_player/video_player.dart';

class MovieDetails extends StatefulWidget {
  Movie movie;
  MovieDetails({Key? key, required this.movie}) : super(key: key);

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  bool isHide = false;
  late VideoPlayerController videoPlayerController;
  double width = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    videoPlayerController = VideoPlayerController.network(widget.movie.video)
      ..initialize().then((value) {
        setState(() {
          width += 1;
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.dispose();
  }
  // buildPlayButton(){
  //   return
  // }

  // initializeVideoPlayer() {}
  @override
  Widget build(BuildContext context) {
    var sizeData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        actions: [
          const Icon(Icons.search),
          Container(
              margin: const EdgeInsets.all(8),
              child: const Icon(Icons.account_box_outlined)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                if (videoPlayerController.value.isPlaying) {
                  setState(() {
                    isHide = !isHide;
                  });
                }
              },
              child: Stack(
                children: [
                  Container(
                      height: sizeData.size.height * .25,
                      child: videoPlayerController.value.isInitialized
                          ? AspectRatio(
                              aspectRatio:
                                  videoPlayerController.value.aspectRatio,
                              child: VideoPlayer(videoPlayerController),
                            )
                          : const Center(child: CircularProgressIndicator())),
                  if (!isHide)
                    Positioned(
                      bottom: (sizeData.size.height * .25) / 2 - 20,
                      right: sizeData.size.width / 2 - 20,
                      child: GestureDetector(
                        onTap: () async {
                          if (videoPlayerController.value.isPlaying) {
                            setState(() {
                              videoPlayerController.pause();
                            });
                          } else {
                            setState(() {
                              videoPlayerController.play();
                            });
                            Future.delayed(const Duration(seconds: 2))
                                .then((value) {
                              setState(() {
                                isHide = true;
                              });
                            });
                          }
                        },
                        child: CircleAvatar(
                            radius: 20,
                            backgroundColor: Theme.of(context)
                                .backgroundColor
                                .withOpacity(0.5),
                            child: Icon(videoPlayerController.value.isPlaying
                                ? Icons.pause
                                : Icons.play_arrow)),
                      ),
                    ),
                  // Positioned(
                  //   bottom: 10,
                  //   child: Container(
                  //     height: 2,
                  //     color: Theme.of(context).primaryColorDark,
                  //     width: sizeData.size.width,
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: 10,
                  //   child: Container(
                  //     height: 2,
                  //     color: Theme.of(context).primaryColor,
                  //     width: width,
                  //   ),
                  // ),
                  if (!isHide)
                    Positioned(
                      bottom: 10,
                      child: Container(
                        width: sizeData.size.width,
                        child: VideoProgressIndicator(videoPlayerController,
                            allowScrubbing: true),
                      ),
                    )
                ],
              ),
            ),
            Container(
              height: 30,
              margin: const EdgeInsets.all(8),
              child: Row(
                children: [
                  Image.asset("assets/logo.jpg"),
                  Text(
                    "FILM",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        ?.copyWith(letterSpacing: 5),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              alignment: Alignment.centerLeft,
              child: Text(widget.movie.title,
                  style: Theme.of(context).textTheme.headline5?.copyWith(
                      color: Theme.of(context).primaryColorLight,
                      fontWeight: FontWeight.bold)),
            ),
            Container(
              width: sizeData.size.width * .35,
              margin: const EdgeInsets.only(left: 8),
              alignment: Alignment.centerLeft,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "2021",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: Theme.of(context).primaryColorDark),
                  ),
                  Text(
                    "7+",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: Theme.of(context).primaryColorDark),
                  ),
                  Text(
                    "1h 40m",
                    style: Theme.of(context)
                        .textTheme
                        .caption
                        ?.copyWith(color: Theme.of(context).primaryColorDark),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextIconButton(
                color: Theme.of(context).primaryColorLight,
                icon: Icons.play_arrow,
                textColor: Theme.of(context).backgroundColor,
                title: "Play",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => MoviePlayScreen(
                          title: widget.movie.title,
                          video: widget.movie.video)));
                },
                height: 35,
                width: sizeData.size.width,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: TextIconButton(
                color: Theme.of(context).highlightColor,
                icon: Icons.download,
                textColor: Theme.of(context).cardColor,
                title: "Download",
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => MoviePlayScreen(
                          title: widget.movie.title,
                          video: widget.movie.video)));
                },
                height: 35,
                width: sizeData.size.width,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Text(
                widget.movie.description,
                textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: Theme.of(context).primaryColorLight,
                    ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomIconButton(
                      icon: Icons.add, title: "My List", onTap: () {}),
                  CustomIconButton(
                      icon: Icons.thumb_up_outlined,
                      title: "Rate",
                      onTap: () {}),
                  CustomIconButton(
                      icon: Icons.share, title: "Share", onTap: () {}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

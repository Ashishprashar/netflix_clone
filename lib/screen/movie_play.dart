import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:netflix_clone/widgets/side_icon_button.dart';
import 'package:video_player/video_player.dart';

class MoviePlayScreen extends StatefulWidget {
  String video;
  String title;

  MoviePlayScreen({Key? key, required this.title, required this.video})
      : super(key: key);

  @override
  _MoviePlayScreenState createState() => _MoviePlayScreenState();
}

class _MoviePlayScreenState extends State<MoviePlayScreen> {
  late VideoPlayerController videoPlayerController;
  String position = "00:00";
  bool isHide = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setLandScape();
    videoPlayerController = VideoPlayerController.network(widget.video)
      ..initialize().then((value) {
        videoPlayerController.play();
        setState(() {});
      });
    videoPlayerController.addListener(() {
      var sec = videoPlayerController.value.position.inSeconds;
      var min = videoPlayerController.value.position.inMinutes;

      setState(() {
        position = (min < 10 ? "0" + min.toString() : min.toString()) +
            ":" +
            (sec < 10 ? "0" + sec.toString() : sec.toString());
      });
    });
  }

  setLandScape() async {
    await SystemChrome.setEnabledSystemUIOverlays([]);
    await SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController.pause();
    videoPlayerController.dispose();
    removeLandscape();
  }

  removeLandscape() async {
    await SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    await SystemChrome.setPreferredOrientations(DeviceOrientation.values);
  }

  @override
  Widget build(BuildContext context) {
    var sizeData = MediaQuery.of(context);
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Container(
          width: sizeData.size.width,
          height: sizeData.size.height,
          child: Stack(
            children: [
              videoPlayerController.value.isInitialized
                  ? GestureDetector(
                      onTap: () {
                        if (videoPlayerController.value.isPlaying) {
                          setState(() {
                            isHide = !isHide;
                          });
                          if (!isHide) {
                            Future.delayed(const Duration(seconds: 3))
                                .then((value) {
                              setState(() {
                                isHide = true;
                              });
                            });
                          }
                        } else {
                          setState(() {
                            isHide = !isHide;
                          });
                        }
                      },
                      child: AspectRatio(
                        aspectRatio: (sizeData.size.width
                            // +
                            // sizeData.padding.left +
                            // sizeData.padding.right
                            ) /
                            (sizeData.size.height),
                        child: VideoPlayer(videoPlayerController),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()),
              if (!isHide) ...[
                Positioned(
                    child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 20),
                      child: const Icon(Icons.arrow_back)),
                )),
                Positioned(
                    bottom: sizeData.size.height / 2 - 17.5,
                    child: Container(
                        width: sizeData.size.width,
                        height: 50,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onDoubleTap: () {
                                setState(() {
                                  videoPlayerController.seekTo(
                                      videoPlayerController.value.position -
                                          const Duration(seconds: 5));
                                });
                              },
                              child: const Icon(
                                Icons.fast_rewind,
                                size: 50,
                              ),
                            ),
                            videoPlayerController.value.isBuffering
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      if (videoPlayerController
                                          .value.isPlaying) {
                                        setState(() {
                                          videoPlayerController.pause();
                                        });
                                      } else {
                                        setState(() {
                                          videoPlayerController.play();
                                        });
                                        Future.delayed(
                                                const Duration(seconds: 2))
                                            .then((value) {
                                          setState(() {
                                            isHide = true;
                                          });
                                        });
                                      }
                                    },
                                    child: Icon(
                                        videoPlayerController.value.isPlaying
                                            ? Icons.pause
                                            : Icons.play_arrow,
                                        size: 50)),
                            GestureDetector(
                                onDoubleTap: () {
                                  setState(() {
                                    videoPlayerController.seekTo(
                                        videoPlayerController.value.position +
                                            const Duration(seconds: 5));
                                  });
                                },
                                child:
                                    const Icon(Icons.fast_forward, size: 50)),
                          ],
                        ))),
                Positioned(
                    bottom: (sizeData.size.height / 2 - 17.5) / 2,
                    left: 0,
                    right: 0,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 10),
                            width: sizeData.size.width - 90,
                            child: VideoProgressIndicator(
                              videoPlayerController,
                              allowScrubbing: true,
                            ),
                          ),
                          Text(
                            position,
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ])),
                Positioned(
                    bottom: ((sizeData.size.height / 2 - 17.5) / 2 - 20) / 2,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 40,
                      width: sizeData.size.width,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SideIconButton(
                              icon: Icons.speed,
                              title: "Speed(1X)",
                              onTap: () {},
                              height: 30,
                              textColor: Theme.of(context).primaryColorLight,
                              width: 100),
                          SideIconButton(
                              icon: Icons.lock_open_sharp,
                              title: "Lock",
                              onTap: () {},
                              height: 30,
                              textColor: Theme.of(context).primaryColorLight,
                              width: 100),
                          SideIconButton(
                              icon: Icons.subtitles_sharp,
                              title: "Audio & Subtitles",
                              onTap: () {},
                              height: 30,
                              textColor: Theme.of(context).primaryColorLight,
                              width: 150),
                        ],
                      ),
                    ))
              ]
            ],
          ),
        ));
  }
}

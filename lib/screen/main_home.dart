import 'package:flutter/material.dart';
import 'package:netflix_clone/screen/downloads.dart';
import 'package:netflix_clone/screen/fast_laughs.dart';
import 'package:netflix_clone/screen/games.dart';
import 'package:netflix_clone/screen/home.dart';
import 'package:netflix_clone/screen/news.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  _MainHomeState createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int _selectedTab = 0;
  getScreen() {
    switch (_selectedTab) {
      case 0:
        return const Home();
      // return const GamesScreen();
      case 1:
        return const NewsScreen();
      case 2:
        return const FastLaughsScreen();
      case 3:
        return const DownloadScreen();
      // case 4:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).backgroundColor,
        unselectedItemColor: Theme.of(context).primaryColorDark,
        selectedItemColor: Theme.of(context).primaryColorLight,
        currentIndex: _selectedTab,
        selectedLabelStyle: Theme.of(context).textTheme.caption,
        unselectedLabelStyle:
            Theme.of(context).textTheme.caption?.copyWith(fontSize: 10),
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.gamepad_outlined),
          //   label: "Games",
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_outlined),
            label: "News & Hot",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_emotions_outlined),
            label: "Fast Laughs",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.download_for_offline_outlined),
            label: "Downloads",
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedTab = index;
          });
        },
      ),
      body: getScreen(),
    );
  }
}

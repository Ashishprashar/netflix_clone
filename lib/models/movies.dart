class Movie {
  late String title;
  late String category;
  late String image;
  late String video;
  String description =
      "In a world where monsters are tame and monster wrestling is a popular sport, Winnie seeks to follow in her father's footsteps as a manager by turning an inexperienced monster into a contender.";

  Movie(this.title, this.image, this.category, this.video);
}

class Movies {
  List<Movie> movies = [
    Movie(
        "Rumble",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/images%20(1).jfif?alt=media&token=d85b4b4f-c7ff-4be0-8ef4-c9bb2be52b29",
        "c1",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/y2meta.com%20-%20RUMBLE%20Trailer%202%20(2021)(720p).mp4?alt=media&token=39edb2c4-8fc4-40c3-afd7-cc3b67de18e4"),
    Movie(
        "A Quite Place",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/images%20(2).jfif?alt=media&token=940b5517-af39-476f-919b-590553e75feb",
        "c1",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/y2meta.com%20-%20A%20Quiet%20Place%20Part%20II%20(2021)%20-%20Final%20Trailer%20-%20Paramount%20Pictures.mp4?alt=media&token=e6fc194d-858a-4e67-ad6d-bb9e5929e5b6"),
    Movie(
        "2 Lava",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/images%20(3).jfif?alt=media&token=440f453a-4811-45b7-b91f-d21634fcc461",
        "c1",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/y2meta.com%20-%202%20Lava%202%20Lantula!%20-%20Official%20Trailer%20by%20Film.mp4?alt=media&token=1f0ee324-cb44-4eda-860f-ccbbd1f23b9a"),
    Movie(
        "F&F",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/images%20(4).jfif?alt=media&token=23734965-084e-479d-9d41-6b3f26dc6cea",
        "c1",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/y2meta.com%20-%20Fast%20.mp4?alt=media&token=e37a6994-fd32-4291-bd83-a49bdb84a657"),
    Movie(
        "Dolittle",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/images.jfif?alt=media&token=49cc9a45-fa8f-4437-ad0e-6d7ad26656de",
        "c1",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/y2meta.com%20-%20Dolittle%20-%20Official%20Trailer.mp4?alt=media&token=1b3202d6-4e85-4d3a-b2be-c15f474448c6"),
  ];
  late List<Movie> movies2 = [
    Movie(
        "A Quite Place",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/images%20(2).jfif?alt=media&token=940b5517-af39-476f-919b-590553e75feb",
        "c1",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/y2meta.com%20-%20A%20Quiet%20Place%20Part%20II%20(2021)%20-%20Final%20Trailer%20-%20Paramount%20Pictures.mp4?alt=media&token=e6fc194d-858a-4e67-ad6d-bb9e5929e5b6"),
    Movie(
        "Dolittle",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/images.jfif?alt=media&token=49cc9a45-fa8f-4437-ad0e-6d7ad26656de",
        "c1",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/y2meta.com%20-%20Dolittle%20-%20Official%20Trailer.mp4?alt=media&token=1b3202d6-4e85-4d3a-b2be-c15f474448c6"),
    Movie(
        "2 Lava",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/images%20(3).jfif?alt=media&token=440f453a-4811-45b7-b91f-d21634fcc461",
        "c1",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/y2meta.com%20-%202%20Lava%202%20Lantula!%20-%20Official%20Trailer%20by%20Film.mp4?alt=media&token=1f0ee324-cb44-4eda-860f-ccbbd1f23b9a"),
    Movie(
        "F&F",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/images%20(4).jfif?alt=media&token=23734965-084e-479d-9d41-6b3f26dc6cea",
        "c1",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/y2meta.com%20-%20Fast%20.mp4?alt=media&token=e37a6994-fd32-4291-bd83-a49bdb84a657"),
    Movie(
        "Rumble",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/images%20(1).jfif?alt=media&token=d85b4b4f-c7ff-4be0-8ef4-c9bb2be52b29",
        "c1",
        "https://firebasestorage.googleapis.com/v0/b/flutter-project-ec6aa.appspot.com/o/y2meta.com%20-%20RUMBLE%20Trailer%202%20(2021)(720p).mp4?alt=media&token=39edb2c4-8fc4-40c3-afd7-cc3b67de18e4"),
  ];
}

import 'package:flutter/material.dart';
import 'package:netflix_clone/models/movies.dart';
import 'package:netflix_clone/widgets/bottom_movie_detail_sheet.dart';
import 'package:netflix_clone/widgets/category_title.dart';

class CategoryWidget extends StatelessWidget {
  List<Movie> movies;
  String categoryTitle;
  CategoryWidget({Key? key, required this.categoryTitle, required this.movies})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var sizeData = MediaQuery.of(context);

    return Container(
      height: sizeData.size.height * .3,
      child: Column(
        children: [
          CategoryTitle(
            title: categoryTitle,
          ),
          Container(
            // height: sizeData.size.height * .3,
            padding: const EdgeInsets.only(top: 12),
            height: sizeData.size.height * .23,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: movies.length,
                itemBuilder: (ctx, i) {
                  return GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          barrierColor:
                              Theme.of(context).backgroundColor.withOpacity(0),
                          context: context,
                          builder: (ctx) =>
                              BottomMovieDetailSheet(movie: movies[i]));
                    },
                    child: Container(
                      width: sizeData.size.width * .3,
                      padding: const EdgeInsets.only(left: 12),
                      child: Image.network(
                        movies[i].image,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

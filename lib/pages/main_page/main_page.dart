import 'package:flutter/material.dart';
import 'package:imdb_test_app/pages/main_page/widgets/title_carousel.dart';
import 'package:imdb_test_app/pages/main_page/widgets/latest_movies/latest_movies.dart';
import 'package:imdb_test_app/pages/main_page/widgets/popular_movies/popular_movies.dart';
import 'package:imdb_test_app/pages/main_page/widgets/top_rated_movies/top_rated_movies.dart';
import 'package:imdb_test_app/pages/main_page/widgets/upcoming_movies/upcoming_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff2b2d31),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleCarousel(),
              LatestMovieList(),
              PopularMovieList(),
              TopRatedMoviesList(),
              UpcomingMoviesList()
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:imdb_test_app/pages/main_page/widgets/latest_movies/latest_movies.dart';
import 'package:imdb_test_app/pages/main_page/widgets/movie_component.dart';
import 'package:imdb_test_app/pages/main_page/widgets/popular_movies/bloc/popular_movies_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_test_app/pages/main_page/widgets/popular_movies/popular_movies.dart';
import 'package:imdb_test_app/pages/main_page/widgets/top_rated_movies/top_rated_movies.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMDB Test App'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            LatestMovieList(),
            PopularMovieList(),
            TopRatedMoviesList(),
          ],
        ),
      ),
    );
  }
}

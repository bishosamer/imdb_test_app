import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_test_app/pages/main_page/main_page.dart';
import 'package:imdb_test_app/pages/main_page/widgets/latest_movies/bloc/latest_movies_bloc.dart';
import 'package:imdb_test_app/pages/main_page/widgets/popular_movies/bloc/popular_movies_bloc.dart';
import 'package:imdb_test_app/pages/main_page/widgets/top_rated_movies/bloc/top_rated_movies_bloc.dart';
import 'package:imdb_test_app/pages/main_page/widgets/upcoming_movies/bloc/upcoming_movies_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PopularMoviesBloc()),
        BlocProvider(create: (context) => LatestMoviesBloc()),
        BlocProvider(create: (context) => TopRatedMoviesBloc()),
        BlocProvider(create: (context) => UpcomingMoviesBloc()),
      ],
      child: SafeArea(
        child: MaterialApp(
          title: 'TMDB',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_test_app/pages/main_page/widgets/latest_movies/bloc/latest_movies_bloc.dart';
import 'package:imdb_test_app/pages/main_page/widgets/movie_component.dart';
import 'package:imdb_test_app/pages/main_page/widgets/top_rated_movies/bloc/top_rated_movies_bloc.dart';

class TopRatedMoviesList extends StatelessWidget {
  const TopRatedMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: false,
      title: const Text('Top Rated Movies'),
      children: [
        BlocBuilder<TopRatedMoviesBloc, TopRatedMoviesState>(
          builder: (context, state) {
            if (state is TopRatedMoviesInitial) {
              context.read<TopRatedMoviesBloc>().add(TopRatedMoviesLoad());
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is TopRatedMoviesLoaded) {
              return SizedBox(
                height: 250,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.movies.length,
                  itemBuilder: (context, index) {
                    return MovieCompnonent(movie: state.movies[index]);
                  },
                ),
              );
            } else {
              return const Center(
                child: Text('Something went wrong'),
              );
            }
          },
        ),
      ],
    );
  }
}

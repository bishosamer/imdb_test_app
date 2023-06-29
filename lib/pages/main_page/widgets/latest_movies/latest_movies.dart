import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_test_app/pages/main_page/widgets/latest_movies/bloc/latest_movies_bloc.dart';
import 'package:imdb_test_app/pages/main_page/widgets/movie_component.dart';

class LatestMovieList extends StatelessWidget {
  const LatestMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      initiallyExpanded: true,
      title: const Text('Latest Movies'),
      children: [
        BlocBuilder<LatestMoviesBloc, LatestMoviesState>(
          builder: (context, state) {
            if (state is LatestMoviesInitial) {
              context.read<LatestMoviesBloc>().add(LatestMoviesLoad());
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is LatestMoviesLoaded) {
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_test_app/pages/main_page/widgets/list_expansion_tile.dart';
import 'package:imdb_test_app/pages/main_page/widgets/movie_component.dart';
import 'package:imdb_test_app/pages/main_page/widgets/popular_movies/bloc/popular_movies_bloc.dart';

class PopularMovieList extends StatelessWidget {
  const PopularMovieList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListExpansionTile(
      initiallyExpanded: true,
      title: 'Popular Movies',
      child: BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
        builder: (context, state) {
          if (state is PopularMoviesInitial) {
            context.read<PopularMoviesBloc>().add(PopularMoviesLoad());
          }
          if (state is PopularMoviesError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("error occured")));
          }
          if (state is PopularMoviesLoaded) {
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
          } else if (state is PopularMoviesLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return const Center(
              child: Text('Something went wrong'),
            );
          }
        },
      ),
    );
  }
}

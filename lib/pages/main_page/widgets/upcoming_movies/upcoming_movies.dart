import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_test_app/pages/main_page/widgets/list_expansion_tile.dart';
import 'package:imdb_test_app/pages/main_page/widgets/movie_component.dart';
import 'package:imdb_test_app/pages/main_page/widgets/upcoming_movies/bloc/upcoming_movies_bloc.dart';

class UpcomingMoviesList extends StatelessWidget {
  const UpcomingMoviesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListExpansionTile(
      title: 'Upcoming Movies',
      onExpansionChanged: (value) {
        if (value) {
          context.read<UpcomingMoviesBloc>().add(UpcomingMoviesLoad());
        }
      },
      initiallyExpanded: false,
      child: BlocBuilder<UpcomingMoviesBloc, UpcomingMoviesState>(
        builder: (context, state) {
          if (state is UpcomingMoviesError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("error occured")));
          }

          if (state is UpcomingMoviesLoaded) {
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
          } else if (state is UpcomingMoviesLoading) {
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

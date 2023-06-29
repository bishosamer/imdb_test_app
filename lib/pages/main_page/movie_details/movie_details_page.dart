import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_test_app/models/movie.dart';
import 'package:imdb_test_app/pages/main_page/movie_details/bloc/movie_details_bloc.dart';
import 'package:intl/intl.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;
  const MovieDetailsPage({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MovieDetailsBloc(),
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
        builder: (context, state) {
          if (state is MovieDetailsInitial) {
            context
                .read<MovieDetailsBloc>()
                .add(MovieDetailsLoad(movie: movie));
          }
          if (state is MovieDetailsError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("error occured")));
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Hero(
                      tag: movie.id,
                      child: SizedBox(
                        height: 150,
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      movie.title,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  state is MovieDetailsLoaded
                      ? Center(
                          child: Text(state.movieDetails.tagline.toString()))
                      : Container(),
                  Text('released on ${movie.releaseDate}'),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Overview:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Text(movie.overview),
                  const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Rating:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                  Row(
                    children: [
                      const Spacer(),
                      Text(movie.voteAverage.toString()),
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      const Spacer(),
                      Text('vote count: ${movie.voteCount.toString()}'),
                      const Spacer()
                    ],
                  ),
                  Text('Popularity: ${movie.popularity.toString()}'),
                  Text('Original Language: ${movie.originalLanguage}'),
                  Text('Original Title: ${movie.originalTitle}'),
                  state is MovieDetailsLoaded
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.movieDetails.collection ??
                                'No collection'),
                            Text(// seperate budget with commas and add $ sign

                                'Budget: ${state.movieDetails.budget == 0 ? 'No data' : NumberFormat.currency(locale: 'en_US', symbol: '\$').format(state.movieDetails.budget)}'),
                            Text(
                                'Revenue: ${state.movieDetails.revenue == 0 ? 'No data' : NumberFormat.currency(locale: 'en_US', symbol: '\$').format(state.movieDetails.revenue)}'),
                            Text(
                                'Runtime: ${state.movieDetails.runtime.toString()}mins'),
                            Text(
                                'Genres: ${state.movieDetails.genres.toString()}'),
                            Text(
                                'Production Companies: ${state.movieDetails.productionCompanies.toString()}'),
                            Text(
                                'Production Countries: ${state.movieDetails.productionCountries.toString()}'),
                          ],
                        )
                      : const Center(
                          child: CircularProgressIndicator(),
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

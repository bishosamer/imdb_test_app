part of 'top_rated_movies_bloc.dart';

@immutable
abstract class TopRatedMoviesState {}

class TopRatedMoviesInitial extends TopRatedMoviesState {}

class TopRatedMoviesLoaded extends TopRatedMoviesState {
  final List<Movie> movies;
  TopRatedMoviesLoaded({required this.movies});
}

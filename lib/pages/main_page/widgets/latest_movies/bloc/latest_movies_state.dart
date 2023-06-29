part of 'latest_movies_bloc.dart';

@immutable
abstract class LatestMoviesState {}

class LatestMoviesInitial extends LatestMoviesState {}

class LatestMoviesLoaded extends LatestMoviesState {
  final List<Movie> movies;
  LatestMoviesLoaded({required this.movies});
}

class LatestMoviesLoading extends LatestMoviesState {}

part of 'upcoming_movies_bloc.dart';

@immutable
abstract class UpcomingMoviesState {}

class UpcomingMoviesInitial extends UpcomingMoviesState {}

class UpcomingMoviesLoading extends UpcomingMoviesState {}

class UpcomingMoviesLoaded extends UpcomingMoviesState {
  final List<Movie> movies;

  UpcomingMoviesLoaded({required this.movies});
}

class UpcomingMoviesError extends UpcomingMoviesState {}

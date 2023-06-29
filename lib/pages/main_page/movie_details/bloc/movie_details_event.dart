part of 'movie_details_bloc.dart';

@immutable
abstract class MovieDetailsEvent {}

class MovieDetailsLoad extends MovieDetailsEvent {
  final Movie movie;

  MovieDetailsLoad({required this.movie});
}

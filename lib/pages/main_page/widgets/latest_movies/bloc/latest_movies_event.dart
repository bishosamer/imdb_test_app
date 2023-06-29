part of 'latest_movies_bloc.dart';

@immutable
abstract class LatestMoviesEvent {}

class LatestMoviesLoad extends LatestMoviesEvent {}

class LatestMoviesRefresh extends LatestMoviesEvent {}

class LatestMoviesClose extends LatestMoviesEvent {}

class LatestMoviesOpen extends LatestMoviesEvent {}

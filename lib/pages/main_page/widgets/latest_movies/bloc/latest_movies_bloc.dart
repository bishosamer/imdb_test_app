import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:imdb_test_app/models/movie.dart';
import 'package:imdb_test_app/repository/repository.dart';
import 'package:meta/meta.dart';
part 'latest_movies_event.dart';
part 'latest_movies_state.dart';

class LatestMoviesBloc extends Bloc<LatestMoviesEvent, LatestMoviesState> {
  final Duration interval = const Duration(seconds: 30);
  late Timer timer;
  LatestMoviesBloc() : super(LatestMoviesInitial()) {
    timer = Timer.periodic(interval, (Timer timer) {
      add((LatestMoviesRefresh()));
    });
    on<LatestMoviesLoad>((event, emit) async {
      emit(LatestMoviesLoading());
      try {
        final movies = await Repository.getMovies(MovieType.latest);
        emit(LatestMoviesLoaded(movies: movies));
      } catch (e) {
        emit(LatestMoviesError());
      }
    });
    on<LatestMoviesRefresh>((event, emit) async {
      try {
        final movies = await Repository.getMovies(MovieType.latest);
        print("refreshed");
        emit(LatestMoviesLoaded(movies: movies));
      } catch (e) {
        emit(LatestMoviesError());
      }
    });
    on<LatestMoviesClose>((event, emit) {
      timer.cancel();
    });
    on<LatestMoviesOpen>((event, emit) {
      timer = Timer.periodic(interval, (Timer timer) {
        add((LatestMoviesRefresh()));
      });
    });
  }
}

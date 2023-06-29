import 'package:bloc/bloc.dart';
import 'package:imdb_test_app/models/movie.dart';
import 'package:imdb_test_app/repository/repository.dart';
import 'package:meta/meta.dart';

part 'upcoming_movies_event.dart';
part 'upcoming_movies_state.dart';

class UpcomingMoviesBloc
    extends Bloc<UpcomingMoviesEvent, UpcomingMoviesState> {
  UpcomingMoviesBloc() : super(UpcomingMoviesInitial()) {
    on<UpcomingMoviesLoad>((event, emit) async {
      try {
        emit(UpcomingMoviesLoading());
        final movies = await Repository.getMovies(MovieType.upcoming);
        emit(UpcomingMoviesLoaded(movies: movies));
      } catch (e) {
        emit(UpcomingMoviesError());
      }
    });
    on<UpcomingMoviesEvent>((event, emit) {});
  }
}

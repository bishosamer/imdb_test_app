import 'package:bloc/bloc.dart';
import 'package:imdb_test_app/models/movie.dart';
import 'package:imdb_test_app/repository/repository.dart';
import 'package:meta/meta.dart';

part 'popular_movies_event.dart';
part 'popular_movies_state.dart';

class PopularMoviesBloc extends Bloc<PopularMoviesEvent, PopularMoviesState> {
  PopularMoviesBloc() : super(PopularMoviesInitial()) {
    on<PopularMoviesLoad>((event, emit) async {
      emit(PopularMoviesInitial());
      final movies = await Repository.getMovies(MovieType.popular);
      emit(PopularMoviesLoaded(movies: movies));
    });
    on<PopularMoviesEvent>((event, emit) {});
  }
}

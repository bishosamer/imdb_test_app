import 'package:bloc/bloc.dart';
import 'package:imdb_test_app/models/movie.dart';
import 'package:imdb_test_app/repository/repository.dart';
import 'package:meta/meta.dart';

part 'top_rated_movies_event.dart';
part 'top_rated_movies_state.dart';

class TopRatedMoviesBloc
    extends Bloc<TopRatedMoviesEvent, TopRatedMoviesState> {
  TopRatedMoviesBloc() : super(TopRatedMoviesInitial()) {
    on<TopRatedMoviesLoad>((event, emit) async {
      emit(TopRatedMoviesLoading());
      final movies = await Repository.getMovies(MovieType.topRated);
      emit(TopRatedMoviesLoaded(movies: movies));
    });
    on<TopRatedMoviesEvent>((event, emit) {});
  }
}

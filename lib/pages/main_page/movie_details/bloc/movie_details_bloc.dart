import 'package:bloc/bloc.dart';
import 'package:imdb_test_app/models/movie.dart';
import 'package:imdb_test_app/models/movie_details.dart';
import 'package:imdb_test_app/repository/repository.dart';
import 'package:meta/meta.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  MovieDetailsBloc() : super(MovieDetailsInitial()) {
    on<MovieDetailsLoad>((event, emit) async {
      try {
        emit(MovieDetailsLoading());
        await Repository.getMovieDetails(event.movie).then((movieDetails) {
          emit(MovieDetailsLoaded(movieDetails: movieDetails));
        });
      } catch (e) {
        emit(MovieDetailsError());
      }
    });
  }
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imdb_test_app/pages/main_page/movie_details/movie_details_page.dart';
import 'package:imdb_test_app/pages/main_page/widgets/popular_movies/bloc/popular_movies_bloc.dart';

class TitleCarousel extends StatelessWidget {
  const TitleCarousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularMoviesBloc, PopularMoviesState>(
      builder: (context, state) {
        if (state is PopularMoviesLoaded) {
          // map movie images to widgets
          final List<Widget> movieImages = state.movies
              .map((movie) => InkWell(
                    onTap: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => MovieDetailsPage(
                                movie: movie,
                              ));
                    },
                    child: SizedBox(
                      height: 10,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movie.backdropPath}',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ))
              .toList();
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CarouselSlider(
              items: movieImages,
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 5),
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                enlargeCenterPage: true,
                scrollDirection: Axis.horizontal,
              ),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}

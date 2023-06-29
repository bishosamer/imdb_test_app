import 'package:flutter/material.dart';
import 'package:imdb_test_app/models/movie.dart';
import 'package:imdb_test_app/pages/main_page/movie_details/movie_details_page.dart';

class MovieCompnonent extends StatelessWidget {
  final Movie movie;
  const MovieCompnonent({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: MaterialButton(
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => MovieDetailsPage(
                    movie: movie,
                  ));
        },
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 150,
                child: Hero(
                  tag: movie.id,
                  child: Image.network(
                    'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              width: 110,
              child: Text(
                movie.title,
                textAlign: TextAlign.center,
              ),
            ),
            const Spacer(
              flex: 3,
            ),
          ],
        ),
      ),
    );
  }
}

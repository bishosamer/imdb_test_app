import 'package:flutter/material.dart';
import 'package:imdb_test_app/models/movie.dart';

class MovieCompnonent extends StatelessWidget {
  final Movie movie;
  const MovieCompnonent({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: SizedBox(
              height: 150,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Column(
              children: [
                Text(
                  movie.title,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

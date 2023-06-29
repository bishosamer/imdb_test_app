import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:http/http.dart' as http;
import 'package:imdb_test_app/models/movie.dart';

enum MovieType {
  popular,
  latest,
  topRated,
  upcoming,
}

extension MovieTypeExtension on MovieType {
  String get name {
    switch (this) {
      case MovieType.popular:
        return 'popular';
      case MovieType.latest:
        return 'now_playing';
      case MovieType.topRated:
        return 'top_rated';
      case MovieType.upcoming:
        return 'upcoming';
      default:
        return 'popular';
    }
  }
}

class Repository {
// read key from environment variable
  static const String apiKey = String.fromEnvironment("API_KEY");
  static const String baseUrl = 'https://api.themoviedb.org/3/';

  static Future<List<Movie>> getMovies(MovieType type) async {
    var headers = {
      "accept": "application/json",
      'Authorization': 'Bearer $apiKey'
    };

    var response = await http.get(
        Uri.parse('${baseUrl}movie/${type.name}?language=en-US&page=1'),
        headers: headers);
    if (response.statusCode == 200) {
      List<Movie> movies = [];
      var json = jsonDecode(response.body)['results'];
      for (var movie in json) {
        movies.add(Movie.fromJson(movie));
      }
      return movies;
    } else {
      throw Exception('Failed to load movies');
    }
  }
}

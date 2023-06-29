class MovieDetails {
  final int id;
  final int? revenue;
  final int? runtime;
  final String? collection;
  final String? tagline;
  final double? popularity;
  final List<String>? productionCompanies;
  final List<String>? productionCountries;
  final List<String>? spokenLanguages;
  final List<String>? genres;
  final int? budget;
  final String? homepage;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;

  MovieDetails(
      {required this.id,
      this.revenue,
      this.runtime,
      this.collection,
      this.tagline,
      this.popularity,
      this.productionCompanies,
      this.productionCountries,
      this.spokenLanguages,
      this.genres,
      this.budget,
      this.homepage,
      this.imdbId,
      this.originalLanguage,
      this.originalTitle});

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
        id: json['id'],
        revenue: json['revenue'],
        runtime: json['runtime'],
        collection: json['belongs_to_collection'] != null
            ? json['belongs_to_collection']['name']
            : null,
        tagline: json['tagline'],
        popularity: json['popularity'],
        productionCompanies: json['production_companies'] != null
            ? List<String>.from(
                json['production_companies'].map((company) => company['name']))
            : null,
        productionCountries: json['production_countries'] != null
            ? List<String>.from(
                json['production_countries'].map((company) => company['name']))
            : null,
        spokenLanguages: json['spoken_languages'] != null
            ? List<String>.from(
                json['spoken_languages'].map((company) => company['name']))
            : null,
        genres: json['genres'] != null
            ? List<String>.from(
                json['genres'].map((company) => company['name']))
            : null,
        budget: json['budget'],
        homepage: json['homepage'],
        imdbId: json['imdb_id'],
        originalLanguage: json['original_language'],
        originalTitle: json['original_title']);
  }
}

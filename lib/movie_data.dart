class Movie {
  final String title;
  final String backdropPath;
  final String releaseDate;
  final int runtime;
  final String language;
  final String tagline;
  final String overview;
  final List<String> genres;
  final List<Cast> cast;
  final List<RecommendedMovie> recommendations;
  final List<WatchProvider> watchProviders;

  Movie({
    required this.title,
    required this.backdropPath,
    required this.releaseDate,
    required this.runtime,
    required this.language,
    //required this.trailerUrl,
    required this.tagline,   
    required this.overview,
    required this.genres,
    required this.cast,
    required this.recommendations,
    required this.watchProviders,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'] ?? 'No Title',
      backdropPath: json['backdrop_path'] ?? '',
      releaseDate: json['release_date'] ?? 'N/A',
      runtime: json['runtime'] ?? 0,
      language: json['original_language'] ?? 'N/A',
      tagline: json['tagline'] ?? 'No Tagline available',
      overview: json['overview'] ?? 'No Overview available',
      genres: (json['genres'] as List<dynamic>?)?.map((genre) => genre['name'].toString()).toList() ?? [],
      cast: (json['credits']['cast'] as List<dynamic>?)?.map((castMember) {
        return Cast(
          name: castMember['name'],
          profilePath: castMember['profile_path'] ?? '',
        );
      }).toList() ?? [],
      recommendations: (json['recommendations']['results'] as List<dynamic>?)?.map((rec) {
        return RecommendedMovie(
          id: rec['id'],
          title: rec['title'],
          backdropPath: rec['poster_path'] ?? '',
        );
      }).toList() ?? [],
      watchProviders: (json['watch/providers']['results']['US']['flatrate'] as List<dynamic>?)?.map((provider) {
        return WatchProvider(
          name: provider['provider_name'],
          logoPath: provider['logo_path'] ?? '',
        );
      }).toList() ?? [],
    );
  }
}


class RecommendedMovie {
  final int id;
  final String title;
  final String backdropPath;

  RecommendedMovie({
    required this.id,
    required this.title,
    required this.backdropPath,
  });
}


class Cast {
  final String name;
  final String profilePath;

  Cast({
    required this.name,
    required this.profilePath,
  });
}


class WatchProvider {
  final String name;
  final String logoPath;

  WatchProvider({
    required this.name,
    required this.logoPath,
  });
}

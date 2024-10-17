class TV {
  final String title;
  final String backdropPath;
  final String releaseDate;
  final int numberOfSeasons;
  final String language;
  final String tagline;
  final String overview;
  final List<String> genres;
  final List<Cast> cast;
  final List<RecommendedMovie> recommendations;
  final List<WatchProvider> watchProviders;

  TV({
    required this.title,
    required this.backdropPath,
    required this.releaseDate,
    required this.numberOfSeasons,
    required this.language,
    required this.tagline,
    required this.overview,
    required this.genres,
    required this.cast,
    required this.recommendations,
    required this.watchProviders,
  });
}

class Cast {
  final int id;
  final String name;
  final String profilePath;

  Cast({
    required this.id,
    required this.name,
    required this.profilePath,
  });
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

class WatchProvider {
  final String name;
  final String logoPath;

  WatchProvider({
    required this.name,
    required this.logoPath,
  });
}

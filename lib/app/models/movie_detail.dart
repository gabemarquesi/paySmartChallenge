class Movie {
  late String posterPath;
  late bool adult;
  late String overview;
  late String releaseDate;
  late List<int> genreIds;
  late String title;
  late String backdropPath;

  Movie({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.title,
    required this.backdropPath,
  });

  Movie.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    adult = json['adult'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    title = json['title'];
    backdropPath = json['backdrop_path'];
  }
}

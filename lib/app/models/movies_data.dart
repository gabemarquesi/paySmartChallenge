import 'package:app/app/models/movie_details.dart';

class MoviesData {
  late int page;
  late int totalPages;
  late int totalResults;
  late List<Movie> movieList;

  MoviesData({
    required this.page,
    required this.totalPages,
    required this.totalResults,
    required this.movieList,
  });

  MoviesData.init() {
    page = 0;
    totalPages = 0;
    totalResults = 0;
    movieList = [];
  }

  MoviesData.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
    movieList =
        List.from(json['results'].map((e) => Movie.fromJson(e)).toList());
  }
}

import 'package:app/models/movie_card_model.dart';
import 'package:app/models/movie_info_model.dart';

abstract class IMovieRepository {
  Future<List<MovieCard>> getUpcomingMovies();
}

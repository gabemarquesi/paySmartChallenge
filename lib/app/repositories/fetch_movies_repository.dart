import 'package:app/app/models/movies_data.dart';

abstract class FetchMoviesRepository {
  Future<MoviesData?> getMoviesData();
}

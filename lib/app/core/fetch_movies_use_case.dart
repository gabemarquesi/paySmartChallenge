import 'package:app/app/models/movies_data.dart';

abstract class FetchMoviesUseCase {
  Future<MoviesData?> getMoviesData();
}

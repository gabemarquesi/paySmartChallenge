import 'package:app/app/apis/fetch_movies_api.dart';
import 'package:app/app/models/movies_data.dart';
import 'package:app/app/repositories/fetch_movies/fetch_movies_repository.dart';

class FetchMoviesRepositoryImpl extends FetchMoviesRepository {
  final FetchMoviesApi api;
  FetchMoviesRepositoryImpl(this.api);

  @override
  Future<MoviesData?> getMoviesData(int page) async {
    try {
      var response = await api.getMovies(page);

      if (response.statusCode == 200) {
        return MoviesData.fromJson(response.data);
      }
      throw Exception('Failed to load movies');
    } catch (e) {
      throw Exception('Failed to load movies');
    }
  }
}

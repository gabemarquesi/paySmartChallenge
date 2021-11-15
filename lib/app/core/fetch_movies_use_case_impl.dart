import 'package:app/app/core/fetch_movies_use_case.dart';
import 'package:app/app/models/movies_data.dart';
import 'package:app/app/repositories/fetch_movies_repository.dart';

class FetchMoviesUseCaseImpl extends FetchMoviesUseCase {
  final FetchMoviesRepository repository;

  FetchMoviesUseCaseImpl(this.repository);

  @override
  Future<MoviesData> getMoviesData() async {
    //fitas
    try {
      var response = await repository.getMoviesData();

      //fitas

      return response as MoviesData;
    } catch (e) {
      rethrow;
    }
  }
}

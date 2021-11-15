import 'package:app/app/core/fetch_movies_use_case.dart';
import 'package:app/app/models/movies_data.dart';
import 'package:mobx/mobx.dart';

part 'movies_controller.g.dart';

class MoviesController = _MoviesBaseController with _$MoviesController;

abstract class _MoviesBaseController with Store {
  final FetchMoviesUseCase fetchMovies;

  _MoviesBaseController(this.fetchMovies);

  @observable
  MoviesData? moviesData = MoviesData.init();

  void loadMovieData() async {
    try {
      var response = await fetchMovies.getMoviesData();

      if (response != null) moviesData = response;
    } catch (ex) {
      print(ex);
    }
  }

  void onRefresh() {
    if (moviesData != null) {
      loadMovieData();
    }
  }
}

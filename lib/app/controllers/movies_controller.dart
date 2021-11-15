import 'package:app/app/core/fetch_movies_use_case.dart';
import 'package:app/app/models/movie_details.dart';
import 'package:mobx/mobx.dart';

part 'movies_controller.g.dart';

class MoviesController = _MoviesBaseController with _$MoviesController;

abstract class _MoviesBaseController with Store {
  final FetchMoviesUseCase fetchMovies;

  _MoviesBaseController(this.fetchMovies);

  @observable
  List<Movie?> movies = [];

  @observable
  int page = 1;

  @observable
  bool isLastPage = false;

  @observable
  bool isLoading = false;

  Future<void> loadMovieData() async {
    if (isLoading || isLastPage) return;
    try {
      var response = await fetchMovies.getMoviesData(page++);

      if (response != null) {
        addList(response.movieList);
      } else {
        isLastPage = true;
      }
    } catch (ex) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  @action
  void getMoviesData() {
    loadMovieData();
  }

  void addList(List<Movie> list) {
    movies.addAll(list);
  }

  void clearData() {
    movies.clear();
    page = 1;
  }
}

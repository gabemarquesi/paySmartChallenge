import 'package:app/models/movie_card_model.dart';
import 'package:app/models/movie_info_model.dart';
import 'package:app/repositories/movie_repository.dart';
import 'package:mobx/mobx.dart';

part 'movies_controller.g.dart';

class MoviesController = _MoviesController with _$MoviesController;

abstract class _MoviesController with Store {
  MovieRepository _movieRepository = MovieRepository();

  _MoviesController() {
    _movieRepository = MovieRepository();
  }

  @observable
  ObservableList<MovieCard> listMovies = ObservableList<MovieCard>();

  @action
  loadMovies() async {
    listMovies = ObservableList<MovieCard>.of(
        await _movieRepository.getUpcomingMovies());
  }
}

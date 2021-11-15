import 'package:app/app/repositories/fetch_genres/fetch_genres_repository.dart';
import 'package:mobx/mobx.dart';

part 'genres_controller.g.dart';

class GenresController = _GenresControllerBase with _$GenresController;

abstract class _GenresControllerBase with Store {
  FetchGenresRepository fetchGenres;

  _GenresControllerBase(this.fetchGenres);

  @observable
  Map<int, String> genres = {};

  @action
  Future<void> getGenres() async {
    try {
      var response = await fetchGenres.getGenres();
      response!.genresList.forEach((e) => genres[e.id] = e.name);
    } catch (e) {
      rethrow;
    }
  }
}

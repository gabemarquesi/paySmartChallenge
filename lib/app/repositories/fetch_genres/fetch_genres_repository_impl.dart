import 'package:app/app/apis/fetch_genres_api.dart';
import 'package:app/app/models/genres_data.dart';
import 'package:app/app/repositories/fetch_genres/fetch_genres_repository.dart';

class FetchGenresRepositoryImpl extends FetchGenresRepository {
  final FetchGenresApi api;

  FetchGenresRepositoryImpl(this.api);

  @override
  Future<GenresData?> getGenres() async {
    try {
      var response = await api.getGenres();

      if (response.statusCode == 200) {
        return GenresData.fromJson(response.data);
      }
      throw Exception('Failed to load movies');
    } catch (e) {
      throw Exception('Failed to load movies');
    }
  }
}

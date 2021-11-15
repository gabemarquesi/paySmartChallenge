import 'package:app/app/models/genres_data.dart';

abstract class FetchGenresRepository {
  Future<GenresData?> getGenres();
}

import 'package:dio/dio.dart';

class FetchGenresApi {
  Future<Response> getGenres() async => await Dio().get(
      'https://api.themoviedb.org/3/genre/movie/list?api_key=11a3717151745e4fba8ae1afc91b48fa&language=en-US');
}

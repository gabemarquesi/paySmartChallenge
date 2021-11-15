import 'package:dio/dio.dart';

class FetchMoviesApi {
  Future<Response> getMovies(int page) async => await Dio().get(
      'https://api.themoviedb.org/3/movie/upcoming?api_key=11a3717151745e4fba8ae1afc91b48fa&language=en-US&page=$page');
}

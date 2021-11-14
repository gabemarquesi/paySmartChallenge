import 'dart:convert';
import 'dart:developer';
import 'dart:html';
import 'dart:io';
import 'package:app/interfaces/movie_repository_interface.dart';
import 'package:app/models/movie_card_model.dart';
import 'package:app/models/movie_info_model.dart';
import 'package:app/shared/constants_api.dart';
import 'package:dio/dio.dart';

class MovieRepository implements IMovieRepository {
  @override
  Future<List<MovieCard>> getUpcomingMovies() async {
    final response =
        await Dio().get(ConstantsApi.baseUrl + ConstantsApi.moviesToListUrl);
    final json = jsonDecode(response.toString());
    final movies = json['results'] as List;
    return movies.map((data) => MovieCard.fromJson(data)).toList();
  }
}

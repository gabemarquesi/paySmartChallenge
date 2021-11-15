import 'package:app/app/apis/fetch_genres_api.dart';
import 'package:app/app/apis/fetch_movies_api.dart';
import 'package:app/app/controllers/genres_controller.dart';
import 'package:app/app/controllers/movies_controller.dart';
import 'package:app/app/core/fetch_movies_use_case_impl.dart';
import 'package:app/app/repositories/fetch_genres/fetch_genres_repository_impl.dart';
import 'package:app/app/repositories/fetch_movies/fetch_movies_repository_impl.dart';
import 'package:app/app/ui/pages/home_page.dart';
import 'package:app/app/ui/pages/movie_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => FetchMoviesApi()),
        Bind((i) => FetchMoviesRepositoryImpl(i.get())),
        Bind((i) => FetchMoviesUseCaseImpl(i.get())),
        Bind((i) => MoviesController(i.get())),
        Bind((i) => FetchGenresApi()),
        Bind((i) => FetchGenresRepositoryImpl(i.get())),
        Bind((i) => GenresController(i.get())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => HomePage()),
        ChildRoute('/movie',
            child: (context, args) => MoviePage(movie: args.data)),
      ];
}

import 'package:app/app/controllers/genres_controller.dart';
import 'package:app/app/controllers/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ScrollController _scrollController = ScrollController();
  final GenresController _genresController = Modular.get();
  final MoviesController _movieController = Modular.get();

  @override
  void initState() {
    super.initState();

    _genresController.getGenres();
    _movieController.getMoviesData();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
              (_scrollController.position.maxScrollExtent * .8) &&
          !_movieController.isLastPage) {
        _movieController.getMoviesData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Movies'),
      ),
      body: FutureBuilder(
        future: _movieController.loadMovieData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            }
            return Observer(
              builder: (context) {
                var list = _movieController.movies;
                return list != null
                    ? GridView.builder(
                        controller: _scrollController,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .8,
                        ),
                        itemCount: _movieController.movies.length,
                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              Modular.to
                                  .pushNamed('/movie', arguments: list[index]);
                            },
                            child: Card(
                                elevation: 3,
                                child: Column(
                                  children: [
                                    SizedBox(height: 4),
                                    Image.network(
                                      'https://image.tmdb.org/t/p/w200/' +
                                          list[index]!.posterPath,
                                      height: 120,
                                    ),
                                    SizedBox(height: 4),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      child: Text(
                                        list[index]!.title,
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      list[index]!
                                          .releaseDate
                                          .split('-')
                                          .reversed
                                          .join('/'),
                                      style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                        vertical: 2,
                                      ),
                                      child: Text(
                                        list[index]!
                                            .genreIds
                                            .map((e) =>
                                                _genresController.genres[e])
                                            .join(', '),
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                      )
                    : const Center(
                        child: CircularProgressIndicator(),
                      );
              },
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

import 'package:app/app/controllers/genres_controller.dart';
import 'package:app/app/models/movie_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MoviePage extends StatefulWidget {
  final Movie movie;
  const MoviePage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  State<MoviePage> createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  final GenresController _genresController = Modular.get();

  @override
  void initState() {
    super.initState();

    _genresController.getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w400/' + widget.movie.backdropPath,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w200/' +
                        widget.movie.posterPath,
                    width: 80,
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                              text: 'Title: \n',
                              style: TextStyle(fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: widget.movie.title,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                                text: 'Release date: \n',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            TextSpan(
                                text: widget.movie.releaseDate
                                    .split('-')
                                    .reversed
                                    .join('/')),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Colors.black),
                          children: [
                            TextSpan(
                                text: 'Genres: \n',
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            TextSpan(
                              text: widget.movie.genreIds
                                  .map((e) => _genresController.genres[e])
                                  .join(', '),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16),
              child: RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.black),
                  children: [
                    TextSpan(
                        text: 'Overview: \n',
                        style: TextStyle(fontWeight: FontWeight.w500)),
                    TextSpan(text: widget.movie.overview),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

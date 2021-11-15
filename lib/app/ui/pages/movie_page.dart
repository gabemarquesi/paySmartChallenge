// ignore_for_file: prefer_const_constructors

import 'package:app/app/models/movie_detail.dart';
import 'package:flutter/material.dart';

class MoviePage extends StatelessWidget {
  final Movie movie;
  const MoviePage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movie.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              'https://image.tmdb.org/t/p/w400/' + movie.backdropPath,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w200/' + movie.posterPath,
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
                                style: TextStyle(fontWeight: FontWeight.w500)),
                            TextSpan(text: movie.title),
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
                                text: movie.releaseDate
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
                            TextSpan(text: movie.genreIds.join(', ')),
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
                    TextSpan(text: movie.overview),
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

// ignore_for_file: prefer_const_constructors

import 'package:app/app/controllers/movies_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, MoviesController> {
  @override
  void initState() {
    super.initState();
    controller.loadMovieData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Upcoming Movies'),
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                controller.onRefresh();
              })
        ],
      ),
      body: Observer(builder: (context) {
        final list = controller.moviesData!.movieList;
        return list != null
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: .8,
                ),
                itemCount: list.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed('/movie',
                          arguments: controller.moviesData!.movieList[index]);
                    },
                    child: Card(
                        elevation: 3,
                        child: Column(
                          children: [
                            SizedBox(height: 4),
                            Image.network(
                              'https://image.tmdb.org/t/p/w200/' +
                                  controller
                                      .moviesData!.movieList[index].posterPath,
                              height: 120,
                            ),
                            SizedBox(height: 4),
                            Text(
                              list[index].title,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 4),
                            Text(
                              list[index]
                                  .releaseDate
                                  .split('-')
                                  .reversed
                                  .join('/'),
                              style: TextStyle(
                                  fontSize: 11, color: Colors.black87),
                            ),
                            SizedBox(height: 4),
                            Text(list[index].genreIds.toString()),
                          ],
                        )),
                  ),
                ),
              )
            : const Center(
                child: CircularProgressIndicator(),
              );
      }),
    );
  }
}

// ListTile(
//                       onTap: () {
//                         Modular.to.navigate('/movie',
//                             arguments: controller.moviesData!.movieList[index]);
//                       },
//                       leading: Image.network(
//                         'https://image.tmdb.org/t/p/w500/' +
//                             controller.moviesData!.movieList[index].posterPath,
//                       ),
//                       title: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           list[index].title,
//                         ),
//                       ),
//                       subtitle: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Text(
//                           list[index].overview,
//                         ),
//                       ),
//                     ),

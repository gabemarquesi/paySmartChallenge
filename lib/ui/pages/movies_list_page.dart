import 'package:flutter/material.dart';
import 'package:app/controllers/movies_controller.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

class MovieListPage extends StatefulWidget {
  const MovieListPage({Key? key}) : super(key: key);

  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  MoviesController _movieController = MoviesController();

  @override
  void initState() {
    super.initState();
    _movieController = MoviesController();
    _movieController.loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _movieController.loadMovies();
            },
          )
        ],
        title: Text('Movie List'),
      ),
      body: Observer(
        builder: (context) {
          final list = _movieController.listMovies;
          return ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, '/movie',
                          arguments: list[index].id);
                    },
                    title: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        list[index].title,
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        list[index].id.toString(),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

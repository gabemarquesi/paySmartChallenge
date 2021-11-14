import 'package:app/ui/pages/movie_page.dart';
import 'package:app/ui/pages/movies_list_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Upcoming Movies',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      routes: {
        '/': (context) => MovieListPage(),
        '/movie': (context) => MoviePage(idMovie: ModalRoute.of(context)!.settings.arguments as int),
      },
      initialRoute: '/',
    );
  }
}

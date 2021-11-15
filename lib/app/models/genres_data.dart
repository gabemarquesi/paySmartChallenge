class GenresData {
  late List<Genres> genresList;

  GenresData({
    required this.genresList,
  });

  GenresData.fromJson(Map<String, dynamic> json) {
    genresList =
        List.from(json['genres'].map((e) => Genres.fromJson(e)).toList());
  }
}

class Genres {
  late int id;
  late String name;

  Genres({
    required this.id,
    required this.name,
  });

  Genres.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }
}

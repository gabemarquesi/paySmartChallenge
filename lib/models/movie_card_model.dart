// including movie name, poster or backdrop image, genre and release date
class MovieCard {
  int id;
  String title;
  String? poster;

  MovieCard({required this.id, required this.title, this.poster});

  factory MovieCard.fromJson(Map<String, dynamic> json) {
    return MovieCard(
      id: json['id'],
      title: json['title'],
      poster: json['poster_path'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['poster_path'] = this.poster;
    return data;
  }

}
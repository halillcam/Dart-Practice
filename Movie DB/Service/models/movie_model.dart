class MovieModel {
  String? movieName;
  double? imdbRating;
  int? releaseYear;
  String? genre;
  String? director;

  MovieModel({this.movieName, this.imdbRating, this.releaseYear, this.genre, this.director});

  MovieModel.fromJson(Map<String, dynamic> json) {
    movieName = json['movieName'];
    imdbRating = json['imdbRating'];
    releaseYear = json['releaseYear'];
    genre = json['genre'];
    director = json['director'];
  }
}

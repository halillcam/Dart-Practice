import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:movie_db/Service/models/movie_model.dart';

class MovieService {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: "https://raw.githubusercontent.com/halillcam/Dart-Practice/main/Movie%20DB",
    ),
  );

  Future<List<MovieModel>> fetchMovies() async {
    final response = await dio.get("/movies.json");

    if (response.statusCode == HttpStatus.ok) {
      List<dynamic> data = jsonDecode(response.data);

      return data.map((e) => MovieModel.fromJson(e)).toList();
    }
    print("Veri çekilemedi, durum kodu: ${response.statusCode}");
    return [];
  }
}

void main(List<String> args) async {
  MovieService movie = MovieService();
  List<MovieModel> _movies = await movie.fetchMovies();

  for (int i = 0; i < _movies.length; i++) {
    print(_movies[i].movieName);
  }
}

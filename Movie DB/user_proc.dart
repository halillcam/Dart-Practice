import 'package:movie_db/Service/models/movie_model.dart';
import 'package:movie_db/Service/movie_service.dart';

class UserProc {
  MovieService service = MovieService();

  Future<void> getData() async {
    List<MovieModel> movies = await service.fetchMovies();

    for (int i = 0; i < movies.length; i++) {
      print("${movies[i].movieName} - ${movies[i].imdbRating} - ${movies[i].director}");
    }
  }
}

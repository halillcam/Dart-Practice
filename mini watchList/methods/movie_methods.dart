import 'package:mini_watchlist/methods/methods.dart';
import 'package:mini_watchlist/mock%20data/mock_movie_datas.dart';
import 'package:mini_watchlist/models/movie_model.dart';

class MovieMethods implements IMovieMethods {
  MockMovieDatas mockDatas = MockMovieDatas();
  MovieModel? movie;

  @override
  void addMovie(
    int? movieID,
    String? movieName,
    String? category,
    double? imbdPoint,
    String? watchStatus,
  ) {
    if (movieID == null ||
        movieName == null ||
        category == null ||
        imbdPoint == null ||
        watchStatus == null) {
      print("Lütfen boş alan bırakmayınız !");
    } else {
      movie = MovieModel(
        movieID: movieID,
        movieName: movieName,
        category: category,
        imbdPoint: imbdPoint,
        watchStatus: watchStatus,
      );
      mockDatas.movies.add(movie!);
      print("Film eklendi !");
    }
  }

  @override
  void deleteMovie(int? movieID) {
    if (movieID != null) {
      for (int i = 0; i < mockDatas.movies.length; i++) {
        if (mockDatas.movies[i].movieID == movieID) {
          mockDatas.movies.removeAt(i);
          print("Film Silindi");
          return;
        }
      }
    } else {
      print("Lütfen id değerini boş girmeyiniz !");
    }
  }

  @override
  void listMovies() {
    for (int i = 0; i < mockDatas.movies.length; i++) {
      print(
        "${mockDatas.movies[i].movieID}  ${mockDatas.movies[i].movieName} ${mockDatas.movies[i].category} ${mockDatas.movies[i].imbdPoint} ${mockDatas.movies[i].watchStatus}",
      );
    }
  }

  @override
  void searchMovieByName(String? name) {
    if (name == null) {
      print("Lütfen boş bırakmayınız !");
    } else {
      for (int i = 0; i < mockDatas.movies.length; i++) {
        if (mockDatas.movies[i].movieName == name) {
          print("${mockDatas.movies[i].movieName}");
          return;
        }
      }
    }
  }

  @override
  void filterWithCategory({String? category}) {
    if (category == null) {
      print("Lütfen boş bırakmayınız !");
    } else {
      for (int i = 0; i < mockDatas.movies.length; i++) {
        if (mockDatas.movies[i].category == category) {
          print("${mockDatas.movies[i].category}");
          return;
        }
      }
    }
  }

  @override
  void filterWithImbdPoint(double? point) {
    if (point == null) {
      print("Lütfen boş bırakmayınız !");
    } else {
      for (int i = 0; i < mockDatas.movies.length; i++) {
        if (mockDatas.movies[i].imbdPoint! >= point) {
          print("${mockDatas.movies[i].imbdPoint}");
          return;
        }
      }
    }
  }

  @override
  void updateMovieStatus(int? movieID, String? status) {
    if (movieID == null || status == null) {
      print("Lütfen boş alan bırakmayınız");
      return;
    }

    for (int i = 0; i < mockDatas.movies.length; i++) {
      if (mockDatas.movies[i].movieID == movieID) {
        mockDatas.movies[i].watchStatus = status;

        print("Film durumu güncellendi");

        print(mockDatas.movies[i]);

        return;
      }
    }

    print("Film bulunamadı");
  }
}

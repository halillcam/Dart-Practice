import 'package:mini_watchlist/methods/movie_methods.dart';
import 'dart:io';

class MovieProc {
  MovieMethods movie = MovieMethods();
  int? movieID;
  String? movieName;
  String? category;
  double? imbdPoint;
  String? watchStatus;

  int? number;

  Future<void> delay(String text) async {
    print(text);
    await Future.delayed(Duration(seconds: 2));
  }

  // add movie

  Future<void> addMovie() async {
    print("ID : ");
    movieID = int.tryParse(stdin.readLineSync()!);
    print("Movie name : ");
    movieName = stdin.readLineSync();

    print("Category : ");
    category = stdin.readLineSync();

    print("Imbd Point : ");
    imbdPoint = double.tryParse(stdin.readLineSync()!);

    print("Watch Status : ");
    watchStatus = stdin.readLineSync();

    await delay("Kontroller Sağlanıyor ...");
    movie.addMovie(movieID, movieName, category, imbdPoint, watchStatus);
  }

  // delete

  Future<void> delete() async {
    await listMovie();
    print("ID : ");
    movieID = int.tryParse(stdin.readLineSync()!);
    await delay("Kontroller sağlanıyor ... ");
    movie.deleteMovie(movieID);
    listMovie();
  }

  // search name
  Future<void> searchWithName() async {
    print("name : ");
    movieName = stdin.readLineSync();
    await delay("Kontroller Sağlanıyor ...");
    movie.searchMovieByName(movieName);
  }

  // category filter

  Future<void> categoryFilter() async {
    print("Category name : ");
    category = stdin.readLineSync();
    await delay("Kontroller sağlanıyor ... ");
    movie.filterWithCategory();
  }

  // imbd point filter

  Future<void> imbdPointFilter() async {
    print("Imbd Point : ");
    imbdPoint = double.tryParse(stdin.readLineSync()!);
    await delay("Kontroller sağlanıyor ... ");
    movie.filterWithImbdPoint(imbdPoint);
  }

  // update movie Status

  Future<void> updateMovieStatus() async {
    listMovie();
    print("ID : ");
    movieID = int.tryParse(stdin.readLineSync()!);

    print("Status : ");
    watchStatus = stdin.readLineSync();

    await delay("Kontroller Sağlanıyor ...");
    movie.updateMovieStatus(movieID, watchStatus);
    listMovie();
  }

  // list movie

  Future<void> listMovie() async {
    await delay("Filmler Listeleniyor ...");
    movie.listMovies();
  }

  Future<void> userProc() async {
    while (true) {
      print("\n===== Kişisel Film deposu =====");
      print("1 - Filmleri Listele");
      print("2 - Film Ekle");
      print("3 - Film Sil");
      print("4 - Film durumunu güncelle");
      print("5 - Film Araması yap");
      print("6 - IMBD Filtrelemesi yap");
      print("7 - Kategori Filtrelemesi yap");

      print("99 - Çıkış");

      number = int.tryParse(stdin.readLineSync()!);

      switch (number) {
        case 1:
          await listMovie();
          break;

        case 2:
          await addMovie();
          break;

        case 3:
          await delete();
          break;

        case 4:
          await updateMovieStatus();
          break;

        case 5:
          await searchWithName();
          break;

        case 6:
          await imbdPointFilter();
          break;

        case 7:
          await categoryFilter();
          break;

        case 99:
          print("Cikis yapiliyor ...");
          return;

        default:
          print("Hatali secim");
          break;
      }
    }
  }
}

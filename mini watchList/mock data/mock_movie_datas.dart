import 'package:mini_watchlist/models/movie_model.dart';

class MockMovieDatas {
  List<MovieModel> movies = [
    MovieModel(
      movieID: 1,
      movieName: "Interstellar",
      category: "Bilim Kurgu",
      imbdPoint: 7.8,
      watchStatus: "izlendi",
    ),
    MovieModel(
      movieID: 2,
      movieName: "The Martian",
      category: "Bilim Kurgu",
      imbdPoint: 7.3,
      watchStatus: "izlenmedi",
    ),
    MovieModel(
      movieID: 3,
      movieName: "Mogol",
      category: "Tarih",
      imbdPoint: 7.0,
      watchStatus: "İzlendi",
    ),
    MovieModel(
      movieID: 4,
      movieName: "Recep İvedik",
      category: "Komedi",
      imbdPoint: 6.9,
      watchStatus: "izlenmedi",
    ),
    MovieModel(
      movieID: 5,
      movieName: "Hızlı ve Öfkeli 1",
      category: "Aksiyon",
      imbdPoint: 8.0,
      watchStatus: "İzlendi",
    ),
    MovieModel(
      movieID: 6,
      movieName: "Buz Devri",
      category: "Çizgi Film",
      imbdPoint: 7.4,
      watchStatus: "izlendi",
    ),
    MovieModel(
      movieID: 7,
      movieName: "Ayla",
      category: "Dram",
      imbdPoint: 6.5,
      watchStatus: "İzlenmedi",
    ),
  ];
}

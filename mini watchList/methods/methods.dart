abstract class IMovieMethods {
  void addMovie(
    int? movieID,
    String? movieName,
    String? category,
    double? imbdPoint,
    String? watchStatus,
  );
  void deleteMovie(int? movieID);
  void updateMovieStatus(int? movieID, String? status);
  void listMovies();
  void searchMovieByName(String? name);
  void filterWithCategory({String? category});
  void filterWithImbdPoint(double? point);
}

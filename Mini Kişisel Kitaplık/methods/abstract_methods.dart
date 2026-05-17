abstract class IBookMethods {
  void addBook(int? bookID, String? bookName, String? authorName, int? pageCount, String? status);
  void deleteBook(int id);
  void listBook();
  void updateStatus(int id, {String status = ""});
}

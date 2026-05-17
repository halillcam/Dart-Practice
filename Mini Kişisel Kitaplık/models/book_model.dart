class BookModel {
  int? bookID;
  String? bookName;
  String? authorName;
  int? pageCount;
  String? status; // okuyor,okumuyor bilgisi icin

  BookModel({
    required this.bookID,
    required this.bookName,
    required this.authorName,
    required this.pageCount,
    required this.status,
  });
}

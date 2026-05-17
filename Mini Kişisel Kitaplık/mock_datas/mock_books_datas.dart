import 'package:mini_kisisel_kitaplik/models/book_model.dart';

class BooksDatas {
  List<BookModel> myBooks = [
    BookModel(
      bookID: 1,
      bookName: "Marslı",
      authorName: "Andy Weir",
      pageCount: 312,
      status: "Okundu",
    ),
    BookModel(
      bookID: 2,
      bookName: "Kozmos",
      authorName: "Carl Sagan",
      pageCount: 412,
      status: "Okundu",
    ),
    BookModel(
      bookID: 3,
      bookName: "Harry Potter ve Sırlar Odası",
      authorName: "J.K Rowling",
      pageCount: 300,
      status: "Okundu",
    ),
  ];
}

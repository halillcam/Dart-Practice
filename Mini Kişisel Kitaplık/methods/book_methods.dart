import 'package:mini_kisisel_kitaplik/methods/abstract_methods.dart';
import 'package:mini_kisisel_kitaplik/mock_datas/mock_books_datas.dart';
import 'package:mini_kisisel_kitaplik/models/book_model.dart';

class BookMethods implements IBookMethods {
  BookModel? book;
  BooksDatas books = BooksDatas();

  @override
  void addBook(int? bookID, String? bookName, String? authorName, int? pageCount, String? status) {
    if (bookID == null ||
        bookName == null ||
        authorName == null ||
        pageCount == null ||
        status == null) {
      print("Değerler Boş Olamaz !");
    } else {
      book = BookModel(
        bookID: bookID,
        bookName: bookName,
        authorName: authorName,
        pageCount: pageCount,
        status: status,
      );
      books.myBooks.add(book!);
    }
  }

  @override
  void deleteBook(int id) {
    for (int i = 0; i < books.myBooks.length; i++) {
      if (books.myBooks[i].bookID == id) {
        book = books.myBooks[i];
        break;
      }
    }

    if (book != null) {
      books.myBooks.remove(book);
      print("${book?.bookName} silindi");
    } else {
      print("Kitap bulunamadı");
    }
  }

  @override
  void listBook() {
    for (int i = 0; i < books.myBooks.length; i++) {
      print("${books.myBooks[i].bookID}, ${books.myBooks[i].bookName}");
    }
  }

  @override
  void updateStatus(int id, {String status = ""}) {
    for (int i = 0; i < books.myBooks.length; i++) {
      if (id == books.myBooks[i].bookID) {
        books.myBooks[i].status = status;

        print("Status güncellendi");
        print(books.myBooks[i]);

        return;
      }
    }

    print("Kitap bulunamadı");
  }
}

void main(List<String> args) {
  BookMethods methods = BookMethods();
  methods.deleteBook(2);
}

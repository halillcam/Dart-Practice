import 'package:mini_kisisel_kitaplik/methods/book_methods.dart';
import 'dart:io';

class BookProc {
  BookMethods bookMethods = BookMethods();

  int? bookID;
  String? bookName;
  String? authorName;
  int? pageCount;
  String? status;

  int? number;

  Future<void> delay(String text) async {
    print(text);
    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> addBook() async {
    print("Kitap id : ");
    bookID = int.tryParse(stdin.readLineSync()!);

    print("Kitap ismi : ");
    bookName = stdin.readLineSync();

    print("Yazar ismi : ");
    authorName = stdin.readLineSync();

    print("Kaç sayfa : ");
    pageCount = int.tryParse(stdin.readLineSync()!);

    print("Durumu : ");
    status = stdin.readLineSync();

    await delay("Kontrol sağlanıyor ....");
    bookMethods.addBook(bookID, bookName, authorName, pageCount, status);
    print("Kitap Eklendi");
  }

  Future<void> deleteBook() async {
    print("Kitap id  : ");
    bookID = int.tryParse(stdin.readLineSync()!);

    await delay("Kontrol Sağlanıyor ....");
    bookMethods.deleteBook(bookID!);
  }

  Future<void> updateStatus() async {
    print("Kitap id  : ");
    bookID = int.tryParse(stdin.readLineSync()!);

    await delay("Kontrol Sağlanıyor ....");
    bookMethods.updateStatus(bookID!);
    print("Status : ");
    status = stdin.readLineSync();

    await delay("Kontrol Sağlanıyor ....");
    print("işlem Başarılı !");
  }

  Future<void> bookList() async {
    await delay("Kontrol Sağlanıyor ....");
    bookMethods.listBook();
  }

  Future<void> proc() async {
    while (true) {
      print("\n===== Mini Kargo Sistemi =====");
      print("1 - Kitapları Listele");
      print("2 - Kitap Ekle");
      print("3 - Kitap Sil");
      print("4 - Oku / Kitaplığa tekrar a koy");

      print("99 - Çıkış");

      number = int.tryParse(stdin.readLineSync()!);

      switch (number) {
        case 1:
          await bookList();
          break;

        case 2:
          await addBook();
          break;

        case 3:
          await deleteBook();
          break;

        case 4:
          await updateStatus();
          break;

        case 99:
          print("Çıkış yapılıyor...");
          return;

        default:
          print("Hatalı seçim");
      }
    }
  }
}

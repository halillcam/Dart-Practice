import 'dart:io';

import 'package:mini_eticaret/methods/product_methods.dart';

class ProductProcs {
  ProductMethods productMethods = ProductMethods();

  String? productName;
  int? productID;
  int? productPrice;
  String? productStatus;

  int? number;

  Future<void> delay(String text) async {
    print(text);
    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> addProduct() async {
    listProducts();
    print("Ürün ID si : ");
    productID = int.tryParse(stdin.readLineSync()!);

    print("Ürün ismi : ");
    productName = stdin.readLineSync();

    print("Ürün fiyati : ");
    productPrice = int.tryParse(stdin.readLineSync()!);

    print("Ürün durumu : ");
    productStatus = stdin.readLineSync();

    await delay("Kontroller sağlanıyor ...");
    productMethods.addProducts(productID, productName, productPrice, productStatus);
    listProducts();
  }

  Future<void> deleteProducts() async {
    listProducts();
    print("Silinecek ürün id si : ");
    productID = int.tryParse(stdin.readLineSync()!);

    await delay("Kontrol sağlanıyor ....");

    productMethods.deleteProducts(productID);
    listProducts();
  }

  Future<void> updateProduct() async {
    listProducts();
    print("Ürün ID si : ");
    productID = int.tryParse(stdin.readLineSync()!);

    print("Ürün durumu : ");
    productStatus = stdin.readLineSync();

    await delay("Kontroller sağlanıyor ...");
    productMethods.updateProductStatus(productID, productStatus);
  }

  Future<void> searchWithName() async {
    print("Aranacak Ürün adını giriniz : ");
    productName = stdin.readLineSync();

    await delay("Kontroller sağlanıyor ...");
    productMethods.searchWithName(productName);
  }

  Future<void> filterWithPrice() async {
    print("Filtrelenecek Maximum ürün fiyatını  : ");
    productPrice = int.tryParse(stdin.readLineSync()!);

    await delay("Kontroller sağlanıyor ...");
    productMethods.filterWithPrice(productPrice);
  }

  Future<void> filterWithStatus() async {
    print("Filtrelenecek Statu giriniz : ");
    productStatus = stdin.readLineSync();

    await delay("Kontroller Sağlanıyor ...");
    productMethods.filterWithStatus(productStatus);
  }

  Future<void> listProducts() async {
    await delay("Ürünler Listeleniyor ...");
    productMethods.listProducts();
  }

  Future<void> proc() async {
    while (true) {
      print("\n===== Mini E ticaret ürün Sistemi =====");
      print("1 - Ürünleri Listele");
      print("2 - Ürün Ekle");
      print("3 - Ürün Sil");
      print("4 - Stok durumunu güncelle");
      print("5 - Ürün Araması yap");
      print("6 - Fiyat Filtrelemesi yap");
      print("7 - Stok durumlarını öğren");

      print("99 - Çıkış");

      number = int.tryParse(stdin.readLineSync()!);

      switch (number) {
        case 1:
          await listProducts();
          break;

        case 2:
          await addProduct();
          break;

        case 3:
          await deleteProducts();
          break;

        case 4:
          await updateProduct();
          break;

        case 5:
          await searchWithName();
          break;

        case 6:
          await filterWithPrice();
          break;

        case 7:
          await filterWithStatus();
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

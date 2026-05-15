import 'dart:io';

import 'package:mini_kargo_takip/methods/cargo_methods.dart';

class CargoProc {
  CargoMethods cargoMethods = CargoMethods();

  int? id;
  String? senderName;
  String? receiverName;
  String? status;

  int? number;

  Future<void> delay(String text) async {
    print(text);
    await Future.delayed(Duration(seconds: 2));
  }

  // KARGO SORGULA

  Future<void> checkCargo() async {
    print("Kargo ID giriniz:");
    id = int.tryParse(stdin.readLineSync()!);

    if (id == null) {
      print("Geçersiz ID");
      return;
    }

    await delay("Kargo sorgulanıyor...");
    cargoMethods.checkCargo(id!);
  }

  // KARGO EKLE

  Future<void> addCargo() async {
    print("ID:");
    id = int.tryParse(stdin.readLineSync()!);

    print("Sender:");
    senderName = stdin.readLineSync();

    print("Receiver:");
    receiverName = stdin.readLineSync();

    print("Status:");
    status = stdin.readLineSync();

    if (id == null || senderName == null || receiverName == null || status == null) {
      print("Lütfen değerleri boş girmeyiniz !");
      return;
    }

    await delay("Kontrol ediliyor...");
    cargoMethods.addCargo(id, senderName, receiverName, status);

    print("Ekleme başarılı");
    print(
      "Eklemenen kargo bilgileri id : $id, senderName : $senderName, receiver name : $receiverName, Status : $status",
    );
  }

  // Kargo Sil

  Future<void> deleteCargo() async {
    await listCargo();
    print("Silinecek ID:");
    id = int.tryParse(stdin.readLineSync()!);

    if (id == null) {
      print("Geçersiz ID");
      return;
    }

    await delay("Silme işlemi hazırlanıyor...");

    cargoMethods.deleteCargo(id!);

    print("Silme işlemi tamamlandı");
  }

  // KARGO GÜNCELLE

  Future<void> updateCargo() async {
    await listCargo();
    print("Güncellenecek Kargo ID si:");
    id = int.tryParse(stdin.readLineSync()!);

    print("Sender:");
    senderName = stdin.readLineSync();

    print("Receiver:");
    receiverName = stdin.readLineSync();

    print("Status:");
    status = stdin.readLineSync();

    if (id == null) {
      print("Geçersiz ID");
      return;
    }

    await delay("Güncelleme kontrol ediliyor...");

    cargoMethods.updateCargo(senderName: senderName, receiverName: receiverName, status: status);

    print("Güncelleme tamamlandı");
  }

  // Kargo listele
  Future<void> listCargo() async {
    await delay("Kargolar yükleniyor...");
    cargoMethods.listCargo();
  }

  Future<void> proc() async {
    while (true) {
      print("\n===== Mini Kargo Sistemi =====");
      print("1 - Listele");
      print("2 - Ekle");
      print("3 - Güncelle");
      print("4 - Sil");
      print("5 - Sorgula");
      print("99 - Çıkış");

      number = int.tryParse(stdin.readLineSync()!);

      switch (number) {
        case 1:
          await listCargo();
          break;

        case 2:
          await addCargo();
          break;

        case 3:
          await updateCargo();
          break;

        case 4:
          await deleteCargo();
          break;

        case 5:
          await checkCargo();
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

void main(List<String> args) {
  CargoProc proc = CargoProc();
  proc.proc();
}

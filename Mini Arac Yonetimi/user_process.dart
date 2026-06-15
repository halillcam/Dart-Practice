import 'dart:io';

import 'package:car_seller/methods/car_methods.dart';

class UserProcess {
  CarMethods carMethods = CarMethods();
  String? carName;
  int? carModel;
  double? carKM;
  double? price;

  int? number;

  Future<void> delay(String text) async {
    print(text);
    await Future.delayed(Duration(seconds: 2));
  }

  // add car

  Future<void> addCar() async {
    print("Araç ismi : ");
    carName = stdin.readLineSync();

    print("Araç modeli : ");
    carModel = int.tryParse(stdin.readLineSync()!);

    print("Araç Kilometresi : ");
    carKM = double.tryParse(stdin.readLineSync()!);

    print("Araç fiyatı : ");
    price = double.tryParse(stdin.readLineSync()!);

    await delay("Kontroller Sağlanıyorr ...");

    carMethods.addCar(carName, carModel, carKM, price);
  }

  // List car

  Future<void> listCar() async {
    await delay("Kontroller Sağlanıyor ...");
    carMethods.listCar();
  }

  // sell car

  Future<void> sellCar() async {
    await listCar();
    print("Satılan Araç ismini giriniz : ");
    carName = stdin.readLineSync();

    await delay("Kontroller Sağlanıyorr ...");

    carMethods.sellCar(carName);
  }

  Future<void> proc() async {
    while (true) {
      print("\n===== Mini Araç Yönetim Sistemi =====");
      print("1 - Listele");
      print("2 - Ekle");
      print("3 - Satış");
      print("99 - Çıkış");

      number = int.tryParse(stdin.readLineSync()!);

      switch (number) {
        case 1:
          await listCar();
          break;

        case 2:
          await addCar();
          break;

        case 3:
          await sellCar();
          break;

        case 99:
          return;

        default:
          print("Yanlış seçim !");
          break;
      }
    }
  }
}

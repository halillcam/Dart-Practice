import 'dart:io';

import 'package:mini_pharmacy/domain/repositories/medicine_repository.dart';

class UserProc {
  MedicineRepository medicineRepository = MedicineRepository();

  String? medicineName;
  int? medicinePrice;
  int? stockNumber;

  int? number;

  void showMedicines() {
    medicineRepository.showMedicine();
  }

  // add medicine
  void addMedicine() {
    print("İlaç ismi giriniz : ");
    medicineName = stdin.readLineSync();
    print("Fiyatı giriniz : ");
    medicinePrice = int.tryParse(stdin.readLineSync()!);
    print("Stok sayısını giriniz : ");
    stockNumber = int.tryParse(stdin.readLineSync()!);

    medicineRepository.addMedicine(medicineName, medicinePrice, stockNumber);
  }

  // update medicine

  void updateMedicine() {
    print("İlaç ismi giriniz : ");
    medicineName = stdin.readLineSync();
    print("Fiyatı giriniz : ");
    medicinePrice = int.tryParse(stdin.readLineSync()!);
    print("Stok sayısını giriniz : ");
    stockNumber = int.tryParse(stdin.readLineSync()!);

    medicineRepository.updateMedicine(medicineName, medicinePrice, stockNumber);
  }

  // delete medicine

  void deleteMedicine() {
    print("İlaç ismi giriniz : ");
    medicineName = stdin.readLineSync();
    medicineRepository.deleteMedicine(medicineName);
  }

  void checkMedicine() {
    print("ilaç ismini giriniz : ");
    medicineName = stdin.readLineSync();
    medicineRepository.checkMedicine(medicineName);
    medicineRepository.checkStock(medicineName);
  }

  void proc() {
    while (true) {
      print("\n===== Mini İlaç yönetimi =====");
      print("1 - Listele");
      print("2 - Ekle");
      print("3- Güncelle");
      print("4 - Sil");
      print("5 - Sorgula");
      print("99 - Çıkış");

      number = int.tryParse(stdin.readLineSync()!);

      switch (number) {
        case 1:
          showMedicines();
          break;
        case 2:
          addMedicine();
          break;
        case 3:
          updateMedicine();
          break;
        case 4:
          deleteMedicine();
          break;
        case 5:
          checkMedicine();
          break;

        case 99:
          print("Cikis yapiliyor ....");
          return;

        default:
          print("Hatalı değer girdiniz");
          break;
      }
    }
  }
}

void main(List<String> args) {
  UserProc proc = UserProc();
  proc.proc();
}

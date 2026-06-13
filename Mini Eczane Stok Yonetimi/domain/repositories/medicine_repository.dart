import 'package:mini_pharmacy/data/mock%20data/medicine_data.dart';
import 'package:mini_pharmacy/data/model/models.dart';

class MedicineRepository {
  MedicineData data = MedicineData();

  Models? model;

  // Show medicine

  void showMedicine() {
    for (int i = 0; i < data.medicineData.length; i++) {
      print("${data.medicineData[i].medicineName} - ${data.medicineData[i].medicinePrice} dollar");
    }
  }

  // add Medicine

  void addMedicine(String? medicineName, int? medicinePrice, int? stockNumber) {
    if (medicineName == null || medicinePrice == null || stockNumber == null) {
      print("İlgili alanları doldurunuz ! ");
      return;
    } else {
      model = Models(
        medicineName: medicineName,
        medicinePrice: medicinePrice,
        stockNumber: stockNumber,
      );
      data.medicineData.add(model!);
    }
  }

  // update medicine

  void updateMedicine(String? medicineName, int? medicinePrice, int? stockNumber) {
    if (medicineName == null) {
      print("Güncellemek için bir ilaç ismi giriniz.");
      return;
    }
    model = checkMedicine(medicineName);
    if (model != null) {
      model!.medicineName = medicineName;
      model!.medicinePrice = medicinePrice;
      model!.stockNumber = stockNumber;

      print("İşlem başarılı : $medicineName, $medicinePrice , $stockNumber");
      return;
    }
  }

  // delete medicine

  void deleteMedicine(String? medicineName) {
    if (medicineName == null) {
      print("Silmek için bir ilaç ismi giriniz.");
      return;
    }
    model = checkMedicine(medicineName);

    if (model != null) {
      data.medicineData.removeWhere((element) => element.medicineName == medicineName);
      print("$medicineName sistemden tamamen silindi.");
    } else {
      print(" İlaç bulunamadığı için silinemedi.");
    }
  }

  // check stock

  bool checkStock(String? medicineName) {
    if (medicineName != null) {
      for (int i = 0; i < data.medicineData.length; i++) {
        if (medicineName == data.medicineData[i].medicineName) {
          if (data.medicineData[i].stockNumber != 0) {
            print("Stokta şu sayıda mevcut = ${data.medicineData[i].stockNumber}");

            return true;
          } else {
            print("Ürün stokta yok");

            return false;
          }
        }
      }
    }

    return false;
  }

  // check medicine

  Models? checkMedicine(String? medicineName) {
    if (medicineName == null) {
      return null;
    }

    for (int i = 0; i < data.medicineData.length; i++) {
      if (medicineName == data.medicineData[i].medicineName) {
        model = data.medicineData[i];

        print(
          "Ürün mevcut: ${model?.medicineName}, fiyatı: ${model?.medicinePrice}, stok adedi = ${model?.stockNumber}",
        );

        return model;
      }
    }

    print("Ürün bulunamadı");
    return null;
  }
}

void main(List<String> args) {
  MedicineRepository medicineRepository = MedicineRepository();
  medicineRepository.checkMedicine("Paracetamol");
}

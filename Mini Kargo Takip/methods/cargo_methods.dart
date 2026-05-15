import 'package:mini_kargo_takip/models/cargo_model.dart';

class CargoMethods {
  List<CargoModel> cargoData = [];

  CargoModel? cargo;

  // Kargo ekle

  void addCargo(int? id, String? senderName, String? receiverName, String? status) {
    if (id == null || senderName == null || receiverName == null || status == null) {
      print("Kargo oluşturma başarısız");
      return;
    }

    if (senderName.isEmpty || receiverName.isEmpty || status.isEmpty) {
      print("Boş alan bırakmayınız");
      return;
    }

    for (int i = 0; i < cargoData.length; i++) {
      if (cargoData[i].cargoID == id) {
        print("Bu ID zaten kullanılıyor");
        return;
      }
    }

    cargo = CargoModel(
      cargoID: id,
      senderName: senderName,
      receiverName: receiverName,
      status: status,
    );

    cargoData.add(cargo!);

    print("Kargo başarıyla oluşturuldu");
  }

  // Check cargo

  void checkCargo(int id) {
    if (cargoData.isEmpty) {
      print("Sistemde hiç kargo yok");
      cargo = null;
      return;
    }

    // Kargo arama
    for (int i = 0; i < cargoData.length; i++) {
      if (cargoData[i].cargoID == id) {
        cargo = cargoData[i];

        print("Kargo bulundu:");
        print(cargo);

        return;
      }
    }

    cargo = null;

    print("Kargo bulunamadı");
  }

  // Kargo güncelle

  void updateCargo({int id = 0, String? senderName, String? receiverName, String? status}) {
    if (cargo == null) {
      return;
    }

    // Validation
    if (senderName == null || receiverName == null || status == null) {
      print("Güncelleme başarısız");
      return;
    }

    cargo?.senderName = senderName;
    cargo?.receiverName = receiverName;
    cargo?.status = status;

    print("Kargo güncellendi");
    print(
      "Yeni kargo bilgileri ${cargo?.cargoID}, ${cargo?.senderName},${cargo?.receiverName},${cargo?.status}",
    );
    print(cargo);
  }

  // Kargo Sil

  void deleteCargo(int id) {
    checkCargo(id);

    if (cargo == null) {
      return;
    }

    // Listeden sil
    cargoData.remove(cargo);

    print("Kargo silindi");
  }

  // Sistemdeki bütün kargoları göster

  void listCargo() {
    if (cargoData.isEmpty) {
      print("Kargo bulunmuyor");
      return;
    }

    print("---- KARGOLAR ----");

    for (int i = 0; i < cargoData.length; i++) {
      print(cargoData[i]);
    }
  }
}

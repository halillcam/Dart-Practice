import 'dart:io';

import 'package:oda_rezervasyon/models/methods/room_methods.dart';

class RoomProc {
  RoomMethods roomMethods = RoomMethods();

  int? selectedRoom;
  String? fullName;
  int? tcNO;
  String? status;
  int? number;

  Future<void> delay(String text) async {
    print(text);
    await Future.delayed(Duration(seconds: 2));
  }

  Future<void> addCustomers() async {
    print("Lütfen oda Seçimi yapınız : ");
    selectedRoom = int.tryParse(stdin.readLineSync() ?? "");

    if (selectedRoom == null) {
      print("Oda seçimi geçersiz veya boş olamaz !");
      return;
    }

    print("Adınız ve Soyadınız : ");
    fullName = stdin.readLineSync();

    print("TC Kimlik numaranızı giriniz : ");
    tcNO = int.tryParse(stdin.readLineSync() ?? "");

    if (fullName == null || fullName!.isEmpty || tcNO == null) {
      print("Müşteri bilgileri boş olamaz!");
      return;
    }

    await delay("Kontroller sağlanıyor ...");

    roomMethods.addCustomer(fullName!, tcNO!, selectedRoom!);
  }

  // update room status

  Future<void> updateRoomStatus() async {
    print("Lütfen oda Seçimi yapınız : ");
    selectedRoom = int.tryParse(stdin.readLineSync() ?? "");

    if (selectedRoom == null) {
      print("Oda seçimi geçersiz veya boş olamaz !");
      return;
    }

    print("Statu (Bos Dolu) giriniz : ");
    status = stdin.readLineSync();
    if (status == null) {
      print("Statu bos olamaz !");
      return;
    }
    await delay("Kontroller Sağlanıyor ...");
    roomMethods.updateStatus(selectedRoom!, status!);
    listRooms();
  }
  // List rooms

  Future<void> listRooms() async {
    await delay("Odalar Listeleniyor ...");
    roomMethods.listRooms();
  }

  Future<void> proc() async {
    while (true) {
      print("\n----- Oda Rezervasyon Sistemi -----\n");
      print("1 - Odaları Listele");
      print("2 - Kullanıcı kaydı");
      print("3 - Oda durumunu (Dolu/Bos) güncelleme");
      print("99 - Çıkış yap");
      number = int.tryParse(stdin.readLineSync() ?? "");

      switch (number) {
        case 1:
          await listRooms();
          break;
        case 2:
          await addCustomers();
          break;
        case 3:
          await updateRoomStatus();
          break;
        case 99:
          await delay("Cikis yapiliyor ...");
          return;
        default:
          print("Geçersiz seçim!");
      }
    }
  }
}

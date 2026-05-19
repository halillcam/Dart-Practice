import 'package:oda_rezervasyon/models/customer_model.dart';
import 'package:oda_rezervasyon/models/methods/methods.dart';
import 'package:oda_rezervasyon/models/mock%20datas/room_datas.dart';
import 'package:oda_rezervasyon/models/room_model.dart';

class RoomMethods implements IMethods {
  RoomDatas roomDatas = RoomDatas();
  CustomerModel? customer;
  RoomModel? secilenOda;
  @override
  void addCustomer(String fullName, int tcNO, int targetRoomNumber) {
    customer = CustomerModel(fullName: fullName, tcNO: tcNO);

    secilenOda = roomDatas.rooms.firstWhere((oda) => oda.roomNumber == targetRoomNumber);

    if (secilenOda?.status == "Dolu") {
      print("$targetRoomNumber numaralı oda zaten dolu! Başka oda seçiniz.");
      return;
    }
    secilenOda?.customer = customer;
    secilenOda?.status = "Dolu";
    print("$fullName isimli müşteri $targetRoomNumber numaralı odaya başarıyla yerleştirildi.");
  }

  @override
  void listRooms() {
    for (int i = 0; i < roomDatas.rooms.length; i++) {
      print("${roomDatas.rooms[i].roomNumber} - ${roomDatas.rooms[i].bedCount}");
    }
  }

  @override
  void updateStatus(int targetRoomNumber, String status) {
    listRooms();
    for (int i = 0; i < roomDatas.rooms.length; i++) {
      if (targetRoomNumber == roomDatas.rooms[i].roomNumber) {
        roomDatas.rooms[i].status = status;
        print("$targetRoomNumber numaralı odanın yeni durumu: $status");
        listRooms();
        return;
      }
    }
  }
}

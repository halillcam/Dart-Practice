import 'package:oda_rezervasyon/models/customer_model.dart';

class RoomModel {
  int? roomNumber;
  int? bedCount;
  String? status; // boş yada dolu
  CustomerModel? customer;

  RoomModel({
    required this.roomNumber,
    required this.bedCount,
    required this.status,
    this.customer,
  });
}

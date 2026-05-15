class CargoModel {
  int? cargoID;
  String? senderName;
  String? receiverName;
  String? status;

  CargoModel({
    required this.cargoID,
    required this.senderName,
    required this.receiverName,
    required this.status,
  });

  @override
  String toString() {
    return "ID: $cargoID | Gönderici: $senderName | Alıcı: $receiverName | Status: $status";
  }
}

import 'package:car_seller/models/car_model.dart';

abstract class IMethods {
  CarModel? addCar(String? carName, int? carModel, double? carKM, double? price);
  CarModel? sellCar(String? carName);
  List<CarModel?> listCar();
}

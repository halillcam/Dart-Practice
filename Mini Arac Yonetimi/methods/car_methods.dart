import 'package:car_seller/Mock%20Data/car_data.dart';
import 'package:car_seller/methods/methods.dart';
import 'package:car_seller/models/car_model.dart';

class CarMethods implements IMethods {
  CarData carData = CarData();

  @override
  CarModel? addCar(String? carName, int? carModel, double? carKM, double? price) {
    if (carName == null || carModel == null || carKM == null || price == null) {
      print("Lütfen boş bırakmayınız !");
      return null;
    }
    CarModel newCar = CarModel(carName: carName, carModel: carModel, carKM: carKM, price: price);
    carData.cars.add(newCar);
    print("Araç Eklendi = $carName, $carModel , $carKM, $price");
    return newCar;
  }

  @override
  CarModel? sellCar(String? carName) {
    CarModel? sellCar;
    if (carName == null) {
      print("Lütfen boş bırakmayınız !");
      return null;
    }
    for (int i = 0; i < carData.cars.length; i++) {
      if (carName == carData.cars[i].carName) {
        sellCar = carData.cars[i];
        carData.cars.remove(sellCar);
        print("${sellCar.carName} Aracı Satıldı ve Stoktan düştü");
        return sellCar;
      }
    }
    print("Araç stokta yok");
    return null;
  }

  @override
  List<CarModel?> listCar() {
    List<CarModel> carList = [];
    for (int i = 0; i < carData.cars.length; i++) {
      print(
        "Araç İsmi : ${carData.cars[i].carName}, Modeli : ${carData.cars[i].carModel}, Kilometresi : ${carData.cars[i].carKM}, fiyatı : ${carData.cars[i].price}",
      );
      carList.add(carData.cars[i]);
    }
    return carList;
  }
}

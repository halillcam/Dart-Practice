import 'package:mini_eticaret/models/product_model.dart';

class ProductDatas {
  List<ProductModel> products = [
    ProductModel(
      productID: 1,
      productName: "Laptop",
      productPrice: 2500,
      productStatus: "Stokta mevcut",
    ),
    ProductModel(
      productID: 2,
      productName: "Telefon",
      productPrice: 3000,
      productStatus: "Stokta mevcut",
    ),
    ProductModel(
      productID: 3,
      productName: "Çamaşır Makinesi",
      productPrice: 1500,
      productStatus: "Stokta yok",
    ),
    ProductModel(
      productID: 4,
      productName: "Kitap",
      productPrice: 150,
      productStatus: "Stokta Mevcut",
    ),
    ProductModel(
      productID: 5,
      productName: "Gözlük",
      productPrice: 1200,
      productStatus: "Stokta Mevcut",
    ),
  ];
}

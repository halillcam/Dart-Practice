import 'package:mini_eticaret/methods/methods.dart';
import 'package:mini_eticaret/mock%20datas/product_datas.dart';
import 'package:mini_eticaret/models/product_model.dart';

class ProductMethods implements IProductMethods {
  ProductModel? productModel;
  ProductDatas products = ProductDatas();
  List<ProductModel> filtered = [];
  bool found = false;

  /// ürün [EKLEME]
  @override
  void addProducts(int? productID, String? productName, int? productPrice, String? productStatus) {
    if (productID == null || productName == null || productPrice == null || productStatus == null) {
      print("Ürün ekleme işlemi başarısız Lütfen bütün alanları Doldurun");
    } else {
      productModel = ProductModel(
        productID: productID,
        productName: productName,
        productPrice: productPrice,
        productStatus: productStatus,
      );
      products.products.add(productModel!);
    }
  }

  /// ürün [SILME]

  @override
  void deleteProducts(int? id) {
    if (id == null) {
      print("ID boş olamaz");
      return;
    }

    for (int i = 0; i < products.products.length; i++) {
      if (products.products[i].productID == id) {
        products.products.removeAt(i);
        print("Ürün silindi");
        listProducts();
        return;
      }
    }

    print("Ürün bulunamadı");
  }

  /// Ürün [GUNCELLEME]

  @override
  void updateProductStatus(int? id, String? status) {
    listProducts();
    for (int i = 0; i < products.products.length; i++) {
      if (id == products.products[i].productID) {
        products.products[i].productStatus = status;
      }
    }
    print("Güncelleme işlemi başarılı");
    listProducts();
  }

  /// Fiyat ile [FILTRELEME]

  @override
  void filterWithPrice(int? maxPrice) {
    if (maxPrice == null) {
      print("Fiyat boş");
      return;
    }

    for (int i = 0; i < products.products.length; i++) {
      if (products.products[i].productPrice! <= maxPrice) {
        filtered.add(products.products[i]);
      }
    }

    for (var p in filtered) {
      print(p);
    }
  }

  /// Status ile [FILTRELEME]

  @override
  void filterWithStatus(String? status) {
    if (status == null) {
      print("Status boş");
      return;
    }

    for (int i = 0; i < products.products.length; i++) {
      if (products.products[i].productStatus == status) {
        print(products.products[i]);
      }
    }
  }

  /// Urunleri [LISTELEME]
  @override
  void listProducts() {
    for (int i = 0; i < products.products.length; i++) {
      print(
        "${products.products[i].productID},${products.products[i].productName},${products.products[i].productPrice},${products.products[i].productStatus}",
      );
    }
  }

  /// [NAME] ile [FILTRELEME]

  @override
  void searchWithName(String? productName) {
    if (productName == null) {
      print("İsim boş olamaz");
      return;
    }

    found;

    for (int i = 0; i < products.products.length; i++) {
      if (products.products[i].productName!.toLowerCase().contains(productName.toLowerCase())) {
        print(products.products[i]);
        found = true;
      }
    }

    if (!found) {
      print("Ürün bulunamadı");
    }
  }
}

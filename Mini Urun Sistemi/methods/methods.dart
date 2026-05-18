abstract class IProductMethods {
  void addProducts(int? productID, String? productName, int? productPrice, String? productStatus);
  void deleteProducts(int? id);
  void updateProductStatus(int? id, String? status);
  void listProducts();
  void searchWithName(String? productName);
  void filterWithPrice(int? maxPrice);
  void filterWithStatus(String? status);
}

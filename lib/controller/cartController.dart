import 'package:get/get.dart';

import '../model/description_model.dart';

class FavoritrController2 extends GetxController {
  RxList<ProductModel> cartItems = <ProductModel>[].obs;

  void addedtoFavorite(ProductModel item) {
    cartItems.add(item);
  }

  void removeFromCart(ProductModel item) {
    cartItems.remove(item);
  }

  void clearCart() {
    cartItems.clear();
  }
}

import 'package:get/get.dart';

import '../model/description_model.dart';

class CartController extends GetxController {
  RxList<DescriptionModel> cartItems = <DescriptionModel>[].obs;

  void addToCart(DescriptionModel item) {
    cartItems.add(item);
  }

  void removeFromCart(DescriptionModel item) {
    cartItems.remove(item);
  }

  void clearCart() {
    cartItems.clear();
  }
}

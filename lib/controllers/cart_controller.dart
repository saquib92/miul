import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:milza_foods/services/api_services.dart';
import '../models/get_cart_response.dart';

class CartController extends GetxController {
  var cartResponse = Rx<GetCartResponse?>(null);
  var isLoading = true.obs;

  Future<void> fetchCartDetails() async {
    try {
      isLoading(true);

      var response = await ApiServices().getCart();
      cartResponse.value = response;
    } catch (e) {
      debugPrint("Error fetching cart details: $e");
    } finally {
      isLoading(false);
    }
  }
}

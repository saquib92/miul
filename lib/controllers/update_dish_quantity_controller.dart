import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:milza_foods/models/update_dish_quantity_request.dart';
import 'package:milza_foods/models/update_dish_quantity_response.dart';
import 'package:milza_foods/services/api_services.dart';
import '../models/get_cart_response.dart';

class UpdateDishQuantityController extends GetxController {
  final ApiServices _apiServices = ApiServices();

  var cartResponse = Rx<GetCartResponse?>(null);
  var isLoading = true.obs;

  var dishQuantities = <int, RxInt>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchCartDetails();
  }

  Future<void> fetchCartDetails() async {
    try {
      isLoading(true);

      var response = await ApiServices().getCart();
      cartResponse.value = response;

      if (cartResponse.value?.data != null) {
        for (var cartDetail in cartResponse.value!.data!) {
          if (cartDetail.cartDetails != null) {
            for (var cartItem in cartDetail.cartDetails!) {
              dishQuantities[cartItem.dish?.id ?? 0] =
                  RxInt(cartItem.quantity ?? 0);
            }
          }
        }
      }
    } catch (e) {
      debugPrint("Error fetching cart details: $e");
    } finally {
      isLoading(false);
    }
  }

  Future<void> updateDishQuantity(
      int restaurantId, int dishId, String type) async {
    try {
      UpdateDishQuantityRequest request = UpdateDishQuantityRequest(
        restaurentId: restaurantId,
        disheId: dishId,
        type: type,
      );

      debugPrint('request: $request');
      UpdateDishQuantityResponse response =
          await _apiServices.updateCartQuantity(request);

      if (response.success == true) {
        if (response.data != null) {
          dishQuantities[dishId] = RxInt(response.data!.quantity ?? 0);
          Get.snackbar('Success',
              'Dish quantity updated to ${dishQuantities[dishId]?.value}');
        } else {
          Get.snackbar('Error', 'Data not found in response');
        }
      } else {
        Get.snackbar('Error', response.message ?? 'Failed to update quantity');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update quantity: ${e.toString()}');
    }
  }

  void addQuantity(int restaurantId, int dishId) {
    updateDishQuantity(restaurantId, dishId, "add");
  }

  void removeQuantity(int restaurantId, int dishId) {
    if (getQuantity(dishId) > 0) {
      updateDishQuantity(restaurantId, dishId, "minus");
    }
  }

  int getQuantity(int dishId) {
    return dishQuantities[dishId]?.value ?? 0;
  }
}

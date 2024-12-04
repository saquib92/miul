import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../services/api_services.dart';
import '../models/get_restaurent_dishes_response.dart';

class RestaurentDishesController extends GetxController {
  var dishes = <RestaurentDish>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRestaurentDishes();
  }

  Future<void> fetchRestaurentDishes() async {
    try {
      isLoading(true);

      final response = await ApiServices.getRestaurentDishes();

      if (response != null && response.data?.dishes != null) {
        dishes.value = response.data!.dishes!;
      } else {
        dishes.clear();
      }
    } catch (e) {
      debugPrint('Error fetching restaurant dishes: $e');
    } finally {
      isLoading(false);
    }
  }
}

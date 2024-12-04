import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milza_foods/services/api_services.dart';

import '../models/get_all_recommended_dishes.dart';

class RecommendedDishesController extends GetxController {
  var recommendedDishes = <RecommendedDishes>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchRecommendedDishes();
  }

  Future<void> fetchRecommendedDishes() async {
    try {
      isLoading(true);
      var dishes = await ApiServices.getRecommendedDishes();
      if (dishes != null) {
        recommendedDishes.value = List<RecommendedDishes>.from(dishes.map(
          (dish) => RecommendedDishes.fromJson(dish),
        ));
      } else {
        recommendedDishes.clear();
      }
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      isLoading(false);
    }
  }
}

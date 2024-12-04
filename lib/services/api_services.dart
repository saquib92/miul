import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:milza_foods/models/get_cart_response.dart';

import '../models/get_restaurent_dishes_response.dart';
import '../models/update_dish_quantity_request.dart';
import '../models/update_dish_quantity_response.dart';
import '../utils/constants.dart';

class ApiServices {
  static Future<List<dynamic>?> getRecommendedDishes() async {
    debugPrint('Constants.apiToken1: ${Constants.apiToken}');
    final response = await http.get(
      Uri.parse('${Constants.baseUrl}${Constants.recommendedDishes}'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Constants.apiToken}'
      },
    );
    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);

      if (responseData is Map<String, dynamic> &&
          responseData.containsKey('data')) {
        return List<dynamic>.from(responseData['data']);
      }

      if (responseData is List) {
        return List<dynamic>.from(responseData);
      }
    }
    return null;
  }

  Future<UpdateDishQuantityResponse> updateCartQuantity(
      UpdateDishQuantityRequest request) async {
    final url = Uri.parse('${Constants.baseUrl}${Constants.cartQuantity}');

    debugPrint('URL: $url');

    debugPrint('Request body: ${jsonEncode(request.toJson())}');
    debugPrint('Constants.apiToken: ${Constants.apiToken}');

    final response = await http.post(
      url,
      body: jsonEncode(request.toJson()),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${Constants.apiToken}',
      },
    );

    debugPrint('headers: ${response.headers}');
    debugPrint('Response status code: ${response.statusCode}');

    debugPrint('Response: ${response.headers}');
    debugPrint('Response1: ${response.body}');

    if (response.statusCode == 200) {
      debugPrint('Response body: ${response.body}');

      try {
        final responseData = jsonDecode(response.body);
        debugPrint('Parsed response data: $responseData');
        return UpdateDishQuantityResponse.fromJson(responseData);
      } catch (e) {
        debugPrint('Error parsing response: $e');
        throw Exception('Error parsing response body');
      }
    } else {
      debugPrint(
          'Failed to update cart quantity. Response body: ${response.body}');
      throw Exception('Failed to update cart quantity: ${response.body}');
    }
  }

  Future<GetCartResponse> getCart() async {
    try {
      final response = await http.get(
        Uri.parse('${Constants.baseUrl}${Constants.cart}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Constants.apiToken}'
        },
      );
      if (response.statusCode == 200) {
        return GetCartResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed to load cart details');
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future<GetRestaurentDishesResponse?> getRestaurentDishes() async {
    try {
      final response = await http.get(
        Uri.parse('${Constants.baseUrl}${Constants.dishes}'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${Constants.apiToken}',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        final dishesResponse =
            GetRestaurentDishesResponse.fromJson(responseData);

        debugPrint('dishesResponse: ${dishesResponse.data?.dishes}');

        if (dishesResponse.data?.dishes != null &&
            dishesResponse.data!.dishes!.isNotEmpty) {
          return dishesResponse;
        } else {
          debugPrint('No dishes found or empty list.');
        }
      } else {
        debugPrint('API Error: ${response.body}');
      }
    } catch (e) {
      debugPrint('Error fetching restaurant dishes: $e');
    }
    return null;
  }
}

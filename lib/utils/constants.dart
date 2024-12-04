import 'package:flutter_dotenv/flutter_dotenv.dart';

class Constants {
  // static const baseUrl = 'http://milzac.node.profcymabackend.com:3002/api/';
  static const recommendedDishes =
      'without-login/masters/all-recommended-dishes';
  static const dishes = 'user/restaurents/dishes';
  static const cart = 'user/cart';
  static const cartQuantity = 'user/cart/quantity';

  static String baseUrl = dotenv.env['API_BASE_URL'] ?? '';
  static String apiToken = dotenv.env['AUTH_TOKEN'] ?? '';

  static String imgUrl = 'http://milzac.node.profcymabackend.com:3002';
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milza_foods/utils/constants.dart';
import '../controllers/restaurent_dishes_controller.dart';

class RestaurentDishes extends StatelessWidget {
  const RestaurentDishes({super.key});

  @override
  Widget build(BuildContext context) {
    final RestaurentDishesController restaurantDishesController =
        Get.put(RestaurentDishesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dishes'),
      ),
      body: Obx(
        () {
          if (restaurantDishesController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (restaurantDishesController.dishes.isEmpty) {
            return const Center(
                child: Text('No recommended dishes available.'));
          }
          return ListView.builder(
            itemCount: restaurantDishesController.dishes.length,
            itemBuilder: (context, index) {
              final dish = restaurantDishesController.dishes[index];
              return Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(
                      scale: 3,
                      "${Constants.imgUrl}${dish.coverImage ?? ''}",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                height: 250,
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Flexible(
                              child: Image.asset(
                                'assets/bestseller.png',
                                scale: 20,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 5, bottom: 15),
                              child: Text(
                                'Best Seller',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dish.name ?? '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        dish.vote ?? '',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const SizedBox(width: 5),
                                      const Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 18,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              dish.foodType?.name ?? '',
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const Divider(
                              thickness: 2,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '₹${dish.price}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                Text(
                                  '${dish.time}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    dish.freeDelivery == 1
                                        ? const Text(
                                            'Free Delivery',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                            ),
                                          )
                                        : const SizedBox.shrink(),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

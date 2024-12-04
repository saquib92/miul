import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milza_foods/controllers/update_dish_quantity_controller.dart';
import 'package:milza_foods/controllers/recommended_dishes_controller.dart';
import 'package:milza_foods/utils/constants.dart';
import 'package:milza_foods/views/restaurent_dishes.dart';

import 'widgets/bottom_nav_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final RecommendedDishesController recommendedDishesController =
        Get.put(RecommendedDishesController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Dishes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const RestaurentDishes(),
          ));
        },
        child: const Icon(Icons.card_travel),
      ),
      bottomNavigationBar: BottomNavigationWidget(),
      body: Obx(
        () {
          if (recommendedDishesController.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          if (recommendedDishesController.recommendedDishes.isEmpty) {
            return const Center(
                child: Text('No recommended dishes available.'));
          }
          return ListView.builder(
            itemCount: recommendedDishesController.recommendedDishes.length,
            itemBuilder: (context, index) {
              final dish = recommendedDishesController.recommendedDishes[index];
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
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5, vertical: 0),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            icon: const Icon(Icons.remove,
                                                color: Colors.black),
                                            onPressed: () {
                                              Get.find<
                                                      UpdateDishQuantityController>()
                                                  .removeQuantity(
                                                      dish.restaurentId!,
                                                      dish.id!);
                                            },
                                          ),
                                          Obx(() {
                                            final quantity = Get.put(
                                                    UpdateDishQuantityController())
                                                .getQuantity(dish.id!);
                                            debugPrint('quantity: $quantity');
                                            return Text(
                                              quantity == 0
                                                  ? 'Add'
                                                  : '$quantity',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            );
                                          }),
                                          IconButton(
                                            icon: const Icon(Icons.add,
                                                color: Colors.black),
                                            onPressed: () {
                                              Get.find<
                                                      UpdateDishQuantityController>()
                                                  .addQuantity(
                                                      dish.restaurentId!,
                                                      dish.id!);
                                            },
                                          ),
                                        ],
                                      ),
                                    ),
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

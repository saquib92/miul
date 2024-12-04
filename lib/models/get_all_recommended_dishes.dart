class GetAllRecommendedDishes {
  bool? success;
  int? code;
  List<RecommendedDishes>? data;
  String? message;

  GetAllRecommendedDishes({this.success, this.code, this.data, this.message});

  GetAllRecommendedDishes.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    if (json['data'] != null) {
      data = <RecommendedDishes>[];
      json['data'].forEach((v) {
        data!.add(RecommendedDishes.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }
}

class RecommendedDishes {
  int? id;
  String? name;
  String? image;
  String? coverImage;
  String? time;
  String? description;
  String? price;
  String? adminPrice;
  String? packagingCharges;
  int? discount;
  String? vote;
  int? customizeSpice;
  int? freeDelivery;
  int? bestSeller;
  int? recommended;
  int? acceptReject;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? userId;
  int? restaurentId;
  int? foodTypeId;
  int? categoryId;
  FoodType? foodType;
  Category? category;

  RecommendedDishes(
      {this.id,
      this.name,
      this.image,
      this.coverImage,
      this.time,
      this.description,
      this.price,
      this.adminPrice,
      this.packagingCharges,
      this.discount,
      this.vote,
      this.customizeSpice,
      this.freeDelivery,
      this.bestSeller,
      this.recommended,
      this.acceptReject,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId,
      this.restaurentId,
      this.foodTypeId,
      this.categoryId,
      this.foodType,
      this.category});

  RecommendedDishes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    coverImage = json['cover_image'];
    time = json['time'];
    description = json['description'];
    price = json['price'];
    adminPrice = json['admin_price'];
    packagingCharges = json['packaging_charges'];
    discount = json['discount'];
    vote = json['vote'];
    customizeSpice = json['customize_spice'];
    freeDelivery = json['free_delivery'];
    bestSeller = json['best_seller'];
    recommended = json['recommended'];
    acceptReject = json['accept_reject'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    userId = json['user_id'];
    restaurentId = json['restaurent_id'];
    foodTypeId = json['food_type_id'];
    categoryId = json['category_id'];
    foodType =
        json['food_type'] != null ? FoodType.fromJson(json['food_type']) : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['cover_image'] = coverImage;
    data['time'] = time;
    data['description'] = description;
    data['price'] = price;
    data['admin_price'] = adminPrice;
    data['packaging_charges'] = packagingCharges;
    data['discount'] = discount;
    data['vote'] = vote;
    data['customize_spice'] = customizeSpice;
    data['free_delivery'] = freeDelivery;
    data['best_seller'] = bestSeller;
    data['recommended'] = recommended;
    data['accept_reject'] = acceptReject;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['user_id'] = userId;
    data['restaurent_id'] = restaurentId;
    data['food_type_id'] = foodTypeId;
    data['category_id'] = categoryId;
    if (foodType != null) {
      data['food_type'] = foodType!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    return data;
  }
}

class FoodType {
  int? id;
  String? name;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  FoodType(
      {this.id,
      this.name,
      this.image,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  FoodType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;
  String? topColor;
  String? bottomColor;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Category(
      {this.id,
      this.name,
      this.image,
      this.topColor,
      this.bottomColor,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    topColor = json['top_color'];
    bottomColor = json['bottom_color'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['top_color'] = topColor;
    data['bottom_color'] = bottomColor;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}

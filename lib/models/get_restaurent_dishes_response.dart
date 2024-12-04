class GetRestaurentDishesResponse {
  bool? success;
  int? code;
  RestaurentData? data;
  String? message;

  GetRestaurentDishesResponse({
    this.success,
    this.code,
    this.data,
    this.message,
  });

  GetRestaurentDishesResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    data = json['data'] != null ? RestaurentData.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class RestaurentData {
  List<RestaurentDish>? dishes;
  int? currentPage;
  int? totalPages;
  int? perPage;
  int? totalEntries;
  String? name;

  RestaurentData({
    this.dishes,
    this.currentPage,
    this.totalPages,
    this.perPage,
    this.totalEntries,
    this.name,
  });

  RestaurentData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      dishes = <RestaurentDish>[];
      json['data'].forEach((v) {
        dishes!.add(RestaurentDish.fromJson(v));
      });
    }
    currentPage = json['currentPage'];
    totalPages = json['totalPages'];
    perPage = json['per_page'];
    totalEntries = json['totalEntries'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (dishes != null) {
      data['data'] = dishes!.map((v) => v.toJson()).toList();
    }
    data['currentPage'] = currentPage;
    data['totalPages'] = totalPages;
    data['per_page'] = perPage;
    data['totalEntries'] = totalEntries;
    data['name'] = name;
    return data;
  }
}

class RestaurentDish {
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
  Category? category;
  FoodType? foodType;
  Favorite? favorite;

  RestaurentDish({
    this.id,
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
    this.category,
    this.foodType,
    this.favorite,
  });

  RestaurentDish.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? '';
    name = json['name'] ?? '';
    image = json['image'] ?? '';
    coverImage = json['cover_image'] ?? '';
    time = json['time'] ?? '';
    description = json['description'] ?? '';
    price = json['price'] ?? '';
    adminPrice = json['admin_price'] ?? '';
    packagingCharges = json['packaging_charges'] ?? '';
    discount = json['discount'] ?? '';
    vote = json['vote'] ?? '';
    customizeSpice = json['customize_spice'] ?? 0;
    freeDelivery = json['free_delivery'] ?? 0;
    bestSeller = json['best_seller'] ?? 0;
    recommended = json['recommended'] ?? 0;
    acceptReject = json['accept_reject'] ?? 0;
    status = json['status'] ?? 0;
    createdAt = json['createdAt'] ?? '';
    updatedAt = json['updatedAt'] ?? '';
    deletedAt = json['deletedAt'] ?? '';
    userId = json['user_id'] ?? 0;
    restaurentId = json['restaurent_id'] ?? 0;
    foodTypeId = json['food_type_id'] ?? 0;
    categoryId = json['category_id'] ?? 0;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    foodType =
        json['food_type'] != null ? FoodType.fromJson(json['food_type']) : null;
    favorite =
        json['favorite'] != null ? Favorite.fromJson(json['favorite']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id ?? '';
    data['name'] = name ?? '';
    data['image'] = image ?? '';
    data['cover_image'] = coverImage ?? '';
    data['time'] = time ?? '';
    data['description'] = description ?? '';
    data['price'] = price ?? '';
    data['admin_price'] = adminPrice ?? '';
    data['packaging_charges'] = packagingCharges ?? '';
    data['discount'] = discount ?? '';
    data['vote'] = vote ?? '';
    data['customize_spice'] = customizeSpice ?? 0;
    data['free_delivery'] = freeDelivery ?? 0;
    data['best_seller'] = bestSeller ?? 0;
    data['recommended'] = recommended ?? 0;
    data['accept_reject'] = acceptReject ?? 0;
    data['status'] = status ?? 0;
    data['createdAt'] = createdAt ?? '';
    data['updatedAt'] = updatedAt ?? '';
    data['deletedAt'] = deletedAt ?? '';
    data['user_id'] = userId ?? 0;
    data['restaurent_id'] = restaurentId ?? 0;
    data['food_type_id'] = foodTypeId ?? 0;
    data['category_id'] = categoryId ?? 0;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (foodType != null) {
      data['food_type'] = foodType!.toJson();
    }
    if (favorite != null) {
      data['favorite'] = favorite!.toJson();
    }
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

  Category({
    this.id,
    this.name,
    this.image,
    this.topColor,
    this.bottomColor,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

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

class FoodType {
  int? id;
  String? name;
  String? image;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  FoodType({
    this.id,
    this.name,
    this.image,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

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

class Favorite {
  int? id;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;

  Favorite({
    this.id,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  Favorite.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    return data;
  }
}

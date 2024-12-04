class GetCartResponse {
  bool? success;
  int? code;
  List<Data>? data;
  String? message;

  GetCartResponse({this.success, this.code, this.data, this.message});

  GetCartResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
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

class Data {
  int? id;
  int? dishesCount;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? restaurentId;
  int? userId;
  Restaurent? restaurent;
  List<CartDetails>? cartDetails;

  Data(
      {this.id,
      this.dishesCount,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.restaurentId,
      this.userId,
      this.restaurent,
      this.cartDetails});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dishesCount = json['dishes_count'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    restaurentId = json['restaurent_id'];
    userId = json['user_id'];
    restaurent = json['restaurent'] != null
        ? Restaurent.fromJson(json['restaurent'])
        : null;
    if (json['cart_details'] != null) {
      cartDetails = <CartDetails>[];
      json['cart_details'].forEach((v) {
        cartDetails!.add(CartDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['dishes_count'] = dishesCount;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['restaurent_id'] = restaurentId;
    data['user_id'] = userId;
    if (restaurent != null) {
      data['restaurent'] = restaurent!.toJson();
    }
    if (cartDetails != null) {
      data['cart_details'] = cartDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Restaurent {
  int? id;
  String? name;
  String? image;
  String? landmark;
  String? address;
  String? latitude;
  String? longitude;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? userId;
  int? countryId;
  int? stateId;
  int? cityId;
  int? pincodeId;

  Restaurent(
      {this.id,
      this.name,
      this.image,
      this.landmark,
      this.address,
      this.latitude,
      this.longitude,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.userId,
      this.countryId,
      this.stateId,
      this.cityId,
      this.pincodeId});

  Restaurent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    landmark = json['landmark'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    userId = json['user_id'];
    countryId = json['country_id'];
    stateId = json['state_id'];
    cityId = json['city_id'];
    pincodeId = json['pincode_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['landmark'] = landmark;
    data['address'] = address;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['user_id'] = userId;
    data['country_id'] = countryId;
    data['state_id'] = stateId;
    data['city_id'] = cityId;
    data['pincode_id'] = pincodeId;
    return data;
  }
}

class CartDetails {
  int? id;
  int? quantity;
  int? customizeSpice;
  int? status;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  int? cartId;
  int? restaurentId;
  int? disheId;
  int? userId;
  Dish? dish;

  CartDetails(
      {this.id,
      this.quantity,
      this.customizeSpice,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.deletedAt,
      this.cartId,
      this.restaurentId,
      this.disheId,
      this.userId,
      this.dish});

  CartDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    customizeSpice = json['customize_spice'];
    status = json['status'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    cartId = json['cart_id'];
    restaurentId = json['restaurent_id'];
    disheId = json['dishe_id'];
    userId = json['user_id'];
    dish = json['dish'] != null ? Dish.fromJson(json['dish']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['customize_spice'] = customizeSpice;
    data['status'] = status;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['cart_id'] = cartId;
    data['restaurent_id'] = restaurentId;
    data['dishe_id'] = disheId;
    data['user_id'] = userId;
    if (dish != null) {
      data['dish'] = dish!.toJson();
    }
    return data;
  }
}

class Dish {
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

  Dish(
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
      this.categoryId});

  Dish.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

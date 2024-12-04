class UpdateDishQuantityResponse {
  bool? success;
  int? code;
  Data? data;
  String? message;

  UpdateDishQuantityResponse(
      {this.success, this.code, this.data, this.message});

  UpdateDishQuantityResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    code = json['code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
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

  Data(
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
      this.userId});

  Data.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

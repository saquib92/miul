class UpdateDishQuantityRequest {
  int? restaurentId;
  int? disheId;
  String? type;

  UpdateDishQuantityRequest({this.restaurentId, this.disheId, this.type});

  UpdateDishQuantityRequest.fromJson(Map<String, dynamic> json) {
    restaurentId = json['restaurent_id'];
    disheId = json['dishe_id'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['restaurent_id'] = restaurentId;
    data['dishe_id'] = disheId;
    data['type'] = type;
    return data;
  }
}

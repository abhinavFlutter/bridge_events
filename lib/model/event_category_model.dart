class EventCategoryModel {
  late String? categoryId;
  late String? categoryName;
  late String? categoryImg;

  EventCategoryModel({this.categoryId, this.categoryName, this.categoryImg});
  //convert json data to dart objects
  factory EventCategoryModel.fromJson(Map<String, dynamic> json) {
    return EventCategoryModel(
        categoryId: json['categoryId'],
        categoryName: json['categoryName'],
        categoryImg: json['categoryImg']);
  }
  //convert dart object to Json data
  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'categoryName': categoryName,
      'categoryImg': categoryImg
    };
  }
}

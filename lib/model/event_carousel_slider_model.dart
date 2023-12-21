class EventCategoryModel {
  late String? carouselId;
  late String? carouselimg;


  EventCategoryModel({required this.carouselId, required this.carouselimg, });
  //convert json data to dart objects
  factory EventCategoryModel.fromJson(Map<String, dynamic> json) {
    return EventCategoryModel(
        carouselId: json['carouselId'],
        carouselimg: json['carouselimg']);

  }
  //convert dart object to Json data
  Map<String, dynamic> toJson() {
    return {
      'categoryId': carouselId,
      'categoryName': carouselimg,

    };
  }
}

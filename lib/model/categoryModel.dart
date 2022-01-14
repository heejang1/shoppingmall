class CategoryModel {
  late final String image;
  late final String category;
  late final int discount;

  CategoryModel({
    required this.image,
    required this.category,
    required this.discount,
  });

  CategoryModel.fromJson(Map<String,dynamic> json) {
    image = json['image'];
    category = json['category'];
    discount= json['discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = image;
    data['category'] = category;
    data['discount'] = discount;
    return data;
  }
}
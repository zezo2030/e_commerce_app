class ProductModel {
  final String id;
  final String name;
  final String desc;
  final int price;
  final double discount;
  final String img;
  final bool isFavorites;
  final String category;

  ProductModel({
    required this.id,
    required this.name,
    required this.desc,
    required this.price,
    required this.discount,
    required this.img,
    required this.isFavorites,
    required this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'] as String,
      name: json['name'] as String,
      desc: json['desc'] as String,
      price: json['price'] as int,
      discount: (json['discount'] as num).toDouble(),
      img: json['img'] as String,
      isFavorites: json['isFavorites'] as bool,
      category: json['category'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'price': price,
      'discount': discount,
      'img': img,
      'isFavorites': isFavorites,
      'category': category,
    };
  }
}

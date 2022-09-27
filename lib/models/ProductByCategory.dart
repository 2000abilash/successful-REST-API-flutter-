import 'dart:convert';

ProductByCategory productByCategoryFromMap(String str) => ProductByCategory.fromMap(json.decode(str));

String productByCategoryToMap(ProductByCategory data) => json.encode(data.toMap());

class ProductByCategory {
  ProductByCategory({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  int id;
  String title;
  dynamic price;
  String description;
  String category;
  String image;
  Rating rating;

  factory ProductByCategory.fromMap(Map<String, dynamic> json) => ProductByCategory(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: Rating.fromMap(json["rating"]),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating.toMap(),
  };
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  double rate;
  int count;

  factory Rating.fromMap(Map<String, dynamic> json) => Rating(
    rate: json["rate"].toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toMap() => {
    "rate": rate,
    "count": count,
  };
}

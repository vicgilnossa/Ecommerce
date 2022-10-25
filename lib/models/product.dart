// To parse this JSON data, do
//
//     final product = productFromMap(jsonString);

import 'dart:convert';

class Product {
  Product({
    required this.name,
    required this.overview,
    this.picture,
    required this.price,
    this.id,
  });

  String name;
  String overview;
  String? picture;
  int price;
  String? id;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String, dynamic> json) => Product(
        name: json["name"],
        overview: json["overview"],
        picture: json["picture"],
        price: json["price"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "overview": overview,
        "picture": picture,
        "price": price,
      };

  Product copy() => Product(
      name: this.name,
      overview: this.overview,
      price: this.price,
      id: this.id,
      picture: this.picture);
}

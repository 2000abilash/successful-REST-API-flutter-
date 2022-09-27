// To parse this JSON data, do
//
//     final cart = cartFromMap(jsonString);

import 'dart:convert';

class Cart {
  Cart({
    required this.productId,
    required this.quantity,
  });

  int productId;
  int quantity;

  factory Cart.fromMap(Map<String, dynamic> json) => Cart(
    productId: json["productId"],
    quantity: json["quantity"],
  );

  Map<String, dynamic> toMap() => {
    "productId": productId,
    "quantity": quantity,
  };
}

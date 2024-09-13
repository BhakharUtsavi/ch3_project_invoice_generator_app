import 'package:flutter/material.dart';

class Globals {

  static List<Map<String,dynamic>> cartItem=[];

  static String? name;
  static String? email;
  static String? phone;
  static String? address;

  static double totalPrice = 0;

  static ensureDefaultQuantities() {
    for (int i = 0; i < cartItem.length; i++) {
      if (cartItem[i]['quantity'] == null || cartItem[i]['quantity'] < 1) {
        cartItem[i]['quantity'] = 1;
      }
    }
  }

  static incrementQuantity(Map<String, dynamic> item) {
      item['quantity']++;
      calculateTotalPrice();
  }

  static decrementQuantity(Map<String, dynamic> item) {
      if ((item['quantity']) > 1) {
        item['quantity']--;
      } else {
        item['quantity'] = 1;
      }
      calculateTotalPrice();
  }

  static calculateTotalPrice() {
    double newTotalPrice = 0.0;

    for (int i = 0; i < cartItem.length; i++) {
      var item = cartItem[i];
      double itemPrice = (item['price'] ?? 0.0).toDouble();
      int itemQuantity = item['quantity'] ?? 1;
      newTotalPrice += itemPrice * itemQuantity;
    }
      totalPrice = newTotalPrice;
  }
}
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:the_basic_look/features/women_view/data/models/cart_item_model2/cart_item_model2.dart';

class CartServices {
  Future<bool> postItem({
    required String size,
    required String token,
    required String id,
  }) async {
    String url = 'https://chicwardrobe-znz5.onrender.com/cart/$id';
    var data = jsonEncode({
      'size': size,
    });
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: data,
    );
    print(token);
    print(response.body);
    if (response.statusCode == 201) {
      print('sucssses');

      // print(
      //     "${userData.role}   and    ${userData.token}   and     ${userData.userId}");
      return true;
    } else {
      print('error ${response.statusCode}');
      return false;
    }
  }

  Future<List<CartModel>> getCartItems({
    required String token,
  }) async {
    String url = 'https://chicwardrobe-znz5.onrender.com/cart';

    final response = await http.get(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
    );
    Map<String, dynamic> jsonData = jsonDecode(response.body);
    List<dynamic> cart = jsonData['cart'];

    List<CartModel> cartList = [];
    for (var product in cart) {
      cartList.add(CartModel.fromJson(product));
    }
    print(token);

    if (response.statusCode == 200) {
      print('sucssses');
      // print(response.body);
      print(cartList);

      // print(
      //     "${userData.role}   and    ${userData.token}   and     ${userData.userId}");
    } else {
      print('error ${response.statusCode}');
    }
    return cartList;
  }

  Future<void> deletItem({
    required String token,
    required String id,
  }) async {
    String url = 'https://chicwardrobe-znz5.onrender.com/cart/$id';
    var data = jsonEncode({
      'size': 'S',
    });
    final response = await http.delete(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: data,
    );
    print(token);
    print(response.body);
    if (response.statusCode == 200) {
      print('product is deleted from cart');

      // print(
      //     "${userData.role}   and    ${userData.token}   and     ${userData.userId}");
    } else {
      print('error ${response.statusCode}');
    }
  }

  Future<int?> getCartPrice({required String token}) async {
    final url = Uri.parse('https://chicwardrobe-znz5.onrender.com/cart');

    final response = await http.get(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      final int? totalPrice = responseData['totalPrice'];
      print(totalPrice);
      return totalPrice;
    } else {
      print(response.body);
      print(response.statusCode);
      return 0;
    }
  }
}

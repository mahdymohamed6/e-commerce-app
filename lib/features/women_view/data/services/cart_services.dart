import 'dart:convert';

import 'package:http/http.dart' as http;

class CartServices {
  void postItem(
      {required String size,
      required String token,
      required String id,
      required String name}) async {
    String url = 'https://chicwardrobe-znz5.onrender.com/cart/$id';
    var data = jsonEncode({
      '(size, ': size,
    });
    final response = await http.post(
      Uri.parse(url),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token',
      },
      body: data,
    );
    print(response.statusCode);
  }
}

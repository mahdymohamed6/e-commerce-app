import 'dart:convert';

import 'package:http/http.dart' as http;

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

  void getCartItems({
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
    print(token);

    if (response.statusCode == 200) {
      print('sucssses');
      print(response.body);
      // print(
      //     "${userData.role}   and    ${userData.token}   and     ${userData.userId}");
    } else {
      print('error ${response.statusCode}');
    }
  }
}

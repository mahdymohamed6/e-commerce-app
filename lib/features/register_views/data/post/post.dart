import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:the_basic_look/core/utils/app_storge.dart';
import 'package:the_basic_look/features/register_views/data/models/user_data_model';

class Post {
  Future<void> register(
      {required String name,
      required String pass,
      required String email}) async {
    String url = 'https://chicwardrobe-znz5.onrender.com/auth/register';
    var data = jsonEncode({'name': name, 'email': email, 'password': pass});
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: data,
    );
    String jsonData = response.body;
    if (response.statusCode == 201) {
      print('sucssses');
      print(jsonData);
    } else {
      print('error ${response.statusCode}');
    }
  }

  Future<bool> login({required String pass, required String email}) async {
    String url = 'https://chicwardrobe-znz5.onrender.com/auth/login';
    var data = jsonEncode({'email': email, 'password': pass});
    final response = await http.post(
      Uri.parse(url),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: data,
    );
    Map<String, dynamic> jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      print('sucssses');
      final userData = UserData.fromJson(jsonData);
      getxStorge.write('token', userData.token);
      getxStorge.write('role', userData.role);
      getxStorge.write('userId', userData.userId);
      String token = getxStorge.read('token');
      print(token);
      // print(
      //     "${userData.role}   and    ${userData.token}   and     ${userData.userId}");
      return true;
    } else {
      print('error ${response.statusCode}');
      return false;
    }
  }
}

// Future<void> register(
//     {required String name,
//     required String pass,
//     required String email}) async {
//   var data = jsonEncode({'name': name, 'email': email, 'password': pass});
//   final response = await dio.post(url,
//       data: data,
//       options: Options(
//           headers: {'Content-Type': 'application/json; charset=UTF-8'}));

//   print(response.data);
// }

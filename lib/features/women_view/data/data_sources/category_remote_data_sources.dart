import 'package:the_basic_look/features/women_view/data/models/product_model.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  final Dio dio;
  String baseUrl =
      'https://chicwardrobe-znz5.onrender.com/products/collections/';
  RemoteDataSource({required this.dio});
  Future<List<ProductModel>> getCollection({required String collection}) async {
    var response = await dio.get(baseUrl + collection);
    Map<String, dynamic> jsonData = response.data;
    List<dynamic> products = jsonData['products'];

    List<ProductModel> productModel = [];
    for (var product in products) {
      productModel.add(ProductModel.fromJson(product));
    }
    print('get geted trigerd');
    return productModel;
  }
}


// masculine
// essentials
// formal
// feminine
import 'product.dart';

class CartModel {
  Product? product;
  int? quantity;
  String? size;
  String? id;

  CartModel({this.product, this.quantity, this.size, this.id});

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      quantity: json['quantity'] as int?,
      size: json['size'] as String?,
      id: json['_id'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'product': product?.toJson(),
        'quantity': quantity,
        'size': size,
        '_id': id,
      };
}

import 'package:the_basic_look/features/women_view/domain/entities/product_entity.dart';

class SizeModel {
  String? sizeName;
  int? quantity;

  SizeModel({this.sizeName, this.quantity});

  factory SizeModel.fromJson(Map<String, dynamic> json) => SizeModel(
        sizeName: json['sizeName'] as String?,
        quantity: json['quantity'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'sizeName': sizeName,
        'quantity': quantity,
      };
}

class ProductModel extends ProductEntity {
  @override
  String? id;
  String? name;
  int? price;
  List<SizeModel>? sizes;
  String? description;
  String? gender;
  String? collectionSeason;
  String? image;
  String? creator;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ProductModel({
    this.id,
    this.name,
    this.price,
    this.sizes,
    this.description,
    this.gender,
    this.collectionSeason,
    this.image,
    this.creator,
    this.createdAt,
    this.updatedAt,
    this.v,
  }) : super(
            productImage: image!,
            prodctName: name!,
            productPrice: price!,
            id: id!);

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        price: json['price'] as int?,
        sizes: (json['sizes'] as List<dynamic>?)
            ?.map((sizeJson) => SizeModel.fromJson(sizeJson))
            .toList(),
        description: json['description'] as String?,
        gender: json['gender'] as String?,
        collectionSeason: json['collectionSeason'] as String?,
        image:
            'https://chicwardrobe-znz5.onrender.com/${json['image'] as String?}',
        creator: json['creator'] as String?,
        createdAt: json['createdAt'] == null
            ? null
            : DateTime.parse(json['createdAt'] as String),
        updatedAt: json['updatedAt'] == null
            ? null
            : DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'name': name,
        'price': price,
        'sizes': sizes?.map((size) => size.toJson()).toList(),
        'description': description,
        'gender': gender,
        'collectionSeason': collectionSeason,
        'image': image,
        'creator': creator,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
        '__v': v,
      };
}

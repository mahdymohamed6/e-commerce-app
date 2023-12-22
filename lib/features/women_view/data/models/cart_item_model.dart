import 'package:the_basic_look/features/women_view/domain/entities/cart_item_entity.dart';

class CartItemModel extends CartItemEntity {
  String? id;
  String? name;
  int? price;
  List<String>? size;
  String? description;
  String? gender;
  String? collectionSeason;
  String? image;
  String? creator;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CartItemModel({
    this.id,
    this.name,
    this.price,
    this.size,
    this.description,
    this.gender,
    this.collectionSeason,
    this.image,
    this.creator,
    this.createdAt,
    this.updatedAt,
    this.v,
  }) : super(name: name!, price: price!);

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        id: json['_id'] as String?,
        name: json['name'] as String?,
        price: json['price'] as int?,
        size: json['size'] as List<String>?,
        description: json['description'] as String?,
        gender: json['gender'] as String?,
        collectionSeason: json['collectionSeason'] as String?,
        image: json['image'] as String?,
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
        'size': size,
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

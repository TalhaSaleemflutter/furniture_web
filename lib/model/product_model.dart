import 'dart:convert';
class ProductModel {
  final String prodId;
  final String title;
  final String description;
  final double price;
  final String condition;
  final List<String> listOfImages;
  final double discountPrice;
  final bool isSold;
  final DateTime createdAt;

  ProductModel({
    required this.prodId,
    required this.title,
    required this.description,
    required this.price,
    required this.condition,
    required this.listOfImages,
    required this.discountPrice,  
    required this.isSold,
    required this.createdAt,
  });

  ProductModel copyWith({
    String? prodId,
    String? title,
    String? description,
    double? price,
    String? condition,
    List<String>? listOfImages,
    double? discountPrice,
    bool? isSold,
    DateTime? createdAt,
  }) {
    return ProductModel(
      prodId: prodId ?? this.prodId,
      title: title ?? this.title,
      description: description ?? this.description,
      price: price ?? this.price,
      condition: condition ?? this.condition,
      listOfImages: listOfImages ?? this.listOfImages,
      discountPrice: discountPrice ?? this.discountPrice,
      isSold: isSold ?? this.isSold,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'prodId': prodId, 
      'title': title,
      'description': description,
      'price': price,
      'condition': condition,
      'listOfImages': listOfImages,
      'discountPrice': discountPrice,
      'isSold': isSold,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      prodId: map['prodId'] ?? '',
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      condition: map['condition'] ?? '',
      listOfImages: List<String>.from(map['listOfImages'] ?? []),
      discountPrice: map['discountPrice']?.toDouble() ?? 0.0,
      isSold: map['isSold'] ?? false,
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
    );
  }

  factory ProductModel.fromJson(String source) => ProductModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}

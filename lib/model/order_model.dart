import 'dart:convert';
import 'package:intl/intl.dart';

class OrderModel {
  final String prodId;
  final String title;
  final double price;
  final DateTime createdAt;
  final String name;
  final String postcode;
  final String email;
  final String address;
  final String phoneNumber;

  OrderModel({
    required this.prodId,
    required this.title,
    required this.price,
    required this.createdAt,
    required this.name,
    required this.postcode,
    required this.email,
    required this.address,
    required this.phoneNumber,
  });

  // 👇 Human-readable date getter
  String get formattedDate =>
      DateFormat('dd MMM yyyy, hh:mm a').format(createdAt);

  OrderModel copyWith({
    String? prodId,
    String? title,
    double? price,
    DateTime? createdAt,
    String? name,
    String? postcode,
    String? email,
    String? address,
    String? phoneNumber,
  }) {
    return OrderModel(
      prodId: prodId ?? this.prodId,
      title: title ?? this.title,
      price: price ?? this.price,
      createdAt: createdAt ?? this.createdAt,
      name: name ?? this.name,
      postcode: postcode ?? this.postcode,
      email: email ?? this.email,
      address: address ?? this.address,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'prodId': prodId,
      'title': title,
      'price': price,
      'createdAt': createdAt.toIso8601String(), // keep ISO
      'name': name,
      'postcode': postcode,
      'email': email,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      prodId: map['prodId'] ?? '',
      title: map['title'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
      name: map['name'] ?? '',
      postcode: map['postcode'] ?? '',
      email: map['email'] ?? '',
      address: map['address'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
    );
  }

  factory OrderModel.fromJson(String source) =>
      OrderModel.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());
}

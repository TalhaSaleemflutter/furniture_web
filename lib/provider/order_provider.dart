import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:furniture_web/model/order_model.dart';

class OrderProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  void setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  String _twoDigits(int n) => n.toString().padLeft(2, '0');
  String generateOrderId() {
    final now = DateTime.now();
    return '${now.year}-${_twoDigits(now.month)}-${_twoDigits(now.day)} ${_twoDigits(now.hour)}:${_twoDigits(now.minute)}';
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  OrderModel _currentOrder = OrderModel(
    prodId: '',
    title: '',
    price: 0.0,
    createdAt: DateTime.now(),
    name: '',
    postcode: '',
    email: '',
    address: '',
    phoneNumber: '',
  );
  OrderModel get currentOrder => _currentOrder;

  Future<void> uploadCurrentOrder(BuildContext context) async {
    setLoading(true); // This already calls notifyListeners()
    try {
      final docId = generateOrderId();
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(docId)
          .set(_currentOrder.toMap());
      print("✅ Order uploaded successfully");
    } catch (e) {
      print("❌ Failed to upload order: $e");
      rethrow; // Important to rethrow so the calling function can handle it
    } finally {
      setLoading(false); // This already calls notifyListeners()
    }
  }

  void updateCurrentOrderField(String field, dynamic value) {
    _currentOrder = _currentOrder.copyWith(
      prodId: field == 'prodId' ? value as String : _currentOrder.prodId,
      title: field == 'title' ? value as String : _currentOrder.title,
      price: field == 'price' ? value as double : _currentOrder.price,
      createdAt:
          field == 'createdAt' ? value as DateTime : _currentOrder.createdAt,
      name: field == 'name' ? value as String : _currentOrder.name,
      postcode: field == 'postcode' ? value as String : _currentOrder.postcode,
      email: field == 'email' ? value as String : _currentOrder.email,
      address: field == 'address' ? value as String : _currentOrder.address,
      phoneNumber:
          field == 'phoneNumber' ? value as String : _currentOrder.phoneNumber,
    );
    notifyListeners();
  }

  void clearCurrentOrder(bool isNotify) {
    _currentOrder = OrderModel(
      prodId: '',
      title: '',
      price: 0.0,
      createdAt: DateTime.now(),
      name: '',
      postcode: '',
      email: '',
      address: '',
      phoneNumber: '',
    );

    if (isNotify) {
      notifyListeners();
    }
  }
}

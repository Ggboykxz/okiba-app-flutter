import 'package:hive_flutter/hive_flutter.dart';
import '../models/user_model.dart';

class LocalDataSource {
  static const String _userBox = 'user_cache';
  static const String _productsBox = 'products_cache';
  static const String _cartBox = 'cart';

  Future<void> initialize() async {
    await Hive.initFlutter();
    await Hive.openBox(_userBox);
    await Hive.openBox(_productsBox);
    await Hive.openBox(_cartBox);
  }

  // User cache
  Future<void> cacheUser(UserModel user) async {
    final box = Hive.box(_userBox);
    await box.put('current_user', user.toMap());
  }

  UserModel? getCachedUser() {
    final box = Hive.box(_userBox);
    final data = box.get('current_user');
    if (data != null) {
      return UserModel.fromMap(Map<String, dynamic>.from(data));
    }
    return null;
  }

  Future<void> clearUser() async {
    final box = Hive.box(_userBox);
    await box.clear();
  }

  // Cart
  Future<void> addToCart(Map<String, dynamic> item) async {
    final box = Hive.box(_cartBox);
    final items = box.get('items', defaultValue: <Map<String, dynamic>>[]) as List;
    items.add(item);
    await box.put('items', items);
  }

  List<Map<String, dynamic>> getCart() {
    final box = Hive.box(_cartBox);
    return List<Map<String, dynamic>>.from(box.get('items', defaultValue: []));
  }

  Future<void> clearCart() async {
    final box = Hive.box(_cartBox);
    await box.put('items', <Map<String, dynamic>>[]);
  }

  // Products cache
  Future<void> cacheProducts(List<Map<String, dynamic>> products) async {
    final box = Hive.box(_productsBox);
    await box.put('products', products);
  }

  List<Map<String, dynamic>> getCachedProducts() {
    final box = Hive.box(_productsBox);
    return List<Map<String, dynamic>>.from(box.get('products', defaultValue: []));
  }
}

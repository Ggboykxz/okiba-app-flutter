import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/product_model.dart';
import '../datasources/local_datasource.dart';

class ProductRepository {
  final FirebaseFirestore _firestore;
  final LocalDataSource _local;

  ProductRepository({
    FirebaseFirestore? firestore,
    LocalDataSource? local,
  })  : _firestore = firestore ?? FirebaseFirestore.instance,
        _local = local ?? LocalDataSource();

  Stream<List<ProductModel>> getProducts({
    String? category,
    String? zone,
    int? maxPrice,
    double? latitude,
    double? longitude,
    double? radiusKm,
  }) {
    Query query = _firestore
        .collection('products')
        .where('status', isEqualTo: 'active')
        .orderBy('createdAt', descending: true)
        .limit(20);

    if (category != null) {
      query = query.where('category', isEqualTo: category);
    }
    if (zone != null) {
      query = query.where('zone', isEqualTo: zone);
    }

    return query.snapshots().map((snapshot) {
      final products = snapshot.docs
          .map((doc) => ProductModel.fromMap({
                'id': doc.id,
                ...Map<String, dynamic>.from(doc.data() as Map),
              }))
          .toList();
      _local.cacheProducts(products.map((p) => p.toMap()).toList());
      return products;
    });
  }

  Stream<ProductModel?> getProduct(String id) {
    return _firestore.collection('products').doc(id).snapshots().map(
          (snapshot) {
            if (!snapshot.exists) return null;
            return ProductModel.fromMap({
              'id': snapshot.id,
              ...Map<String, dynamic>.from(snapshot.data() as Map),
            });
          },
        );
  }

  Future<void> createProduct(ProductModel product) async {
    await _firestore.collection('products').doc(product.id).set(product.toMap());
  }

  Future<void> updateProduct(ProductModel product) async {
    await _firestore
        .collection('products')
        .doc(product.id)
        .update(product.toMap());
  }

  Future<void> deleteProduct(String id) async {
    await _firestore.collection('products').doc(id).update({
      'status': 'inactive',
    });
  }

  List<ProductModel> getCachedProducts() {
    return _local
        .getCachedProducts()
        .map((data) => ProductModel.fromMap(data))
        .toList();
  }
}

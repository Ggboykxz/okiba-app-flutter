import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/order_model.dart';

class OrderRepository {
  final FirebaseFirestore _firestore;

  OrderRepository({FirebaseFirestore? firestore})
      : _firestore = firestore ?? FirebaseFirestore.instance;

  Stream<List<OrderModel>> getClientOrders(String clientId) {
    return _firestore
        .collection('orders')
        .where('clientId', isEqualTo: clientId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OrderModel.fromMap({
                  'id': doc.id,
                  ...Map<String, dynamic>.from(doc.data() as Map),
                }))
            .toList());
  }

  Stream<List<OrderModel>> getSellerOrders(String sellerId) {
    return _firestore
        .collection('orders')
        .where('sellerId', isEqualTo: sellerId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => OrderModel.fromMap({
                  'id': doc.id,
                  ...Map<String, dynamic>.from(doc.data() as Map),
                }))
            .toList());
  }

  Stream<OrderModel?> getOrder(String id) {
    return _firestore.collection('orders').doc(id).snapshots().map(
          (snapshot) {
            if (!snapshot.exists) return null;
            return OrderModel.fromMap({
              'id': snapshot.id,
              ...Map<String, dynamic>.from(snapshot.data() as Map),
            });
          },
        );
  }

  Future<void> createOrder(OrderModel order) async {
    await _firestore.collection('orders').doc(order.id).set(order.toMap());
  }

  Future<void> updateOrderStatus(String id, String status) async {
    await _firestore.collection('orders').doc(id).update({
      'status': status,
      'updatedAt': FieldValue.serverTimestamp(),
    });
  }

  Future<void> assignDelivery(String orderId, String deliveryPersonId) async {
    await _firestore.collection('orders').doc(orderId).update({
      'deliveryPersonId': deliveryPersonId,
      'status': 'assigned',
    });
  }
}

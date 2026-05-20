import '../../data/models/order_model.dart';
import '../../data/repositories/order_repository.dart';
import '../entities/order_entity.dart';

class PlaceOrder {
  final OrderRepository _repository;

  PlaceOrder(this._repository);

  Future<OrderEntity> call(OrderModel order) async {
    await _repository.createOrder(order);
    return OrderEntity(
      id: order.id,
      clientId: order.clientId,
      sellerId: order.sellerId,
      status: order.status.name,
      total: order.total,
      itemCount: order.items.length,
      createdAt: order.createdAt,
    );
  }
}

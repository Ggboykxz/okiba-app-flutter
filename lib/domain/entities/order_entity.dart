class OrderEntity {
  final String id;
  final String clientId;
  final String sellerId;
  final String status;
  final int total;
  final int itemCount;
  final DateTime createdAt;

  const OrderEntity({
    required this.id,
    required this.clientId,
    required this.sellerId,
    required this.status,
    required this.total,
    required this.itemCount,
    required this.createdAt,
  });
}

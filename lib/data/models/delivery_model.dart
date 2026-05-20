enum DeliveryJobStatus { available, accepted, pickedUp, delivered, cancelled }

class DeliveryJobModel {
  final String id;
  final String orderId;
  final String? deliveryPersonId;
  final DeliveryJobStatus status;
  final String pickupAddress;
  final double pickupLatitude;
  final double pickupLongitude;
  final String dropoffAddress;
  final double dropoffLatitude;
  final double dropoffLongitude;
  final double distance;
  final int fee;
  final String? clientPhone;
  final String? sellerPhone;
  final DateTime createdAt;
  final DateTime? pickedUpAt;
  final DateTime? deliveredAt;

  DeliveryJobModel({
    required this.id,
    required this.orderId,
    this.deliveryPersonId,
    this.status = DeliveryJobStatus.available,
    required this.pickupAddress,
    required this.pickupLatitude,
    required this.pickupLongitude,
    required this.dropoffAddress,
    required this.dropoffLatitude,
    required this.dropoffLongitude,
    required this.distance,
    required this.fee,
    this.clientPhone,
    this.sellerPhone,
    DateTime? createdAt,
    this.pickedUpAt,
    this.deliveredAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() => {
        'id': id,
        'orderId': orderId,
        'deliveryPersonId': deliveryPersonId,
        'status': status.name,
        'pickupAddress': pickupAddress,
        'pickupLatitude': pickupLatitude,
        'pickupLongitude': pickupLongitude,
        'dropoffAddress': dropoffAddress,
        'dropoffLatitude': dropoffLatitude,
        'dropoffLongitude': dropoffLongitude,
        'distance': distance,
        'fee': fee,
        'clientPhone': clientPhone,
        'sellerPhone': sellerPhone,
        'createdAt': createdAt.toIso8601String(),
        'pickedUpAt': pickedUpAt?.toIso8601String(),
        'deliveredAt': deliveredAt?.toIso8601String(),
      };

  factory DeliveryJobModel.fromMap(Map<String, dynamic> map) => DeliveryJobModel(
        id: map['id'] as String,
        orderId: map['orderId'] as String,
        deliveryPersonId: map['deliveryPersonId'] as String?,
        status: DeliveryJobStatus.values.byName(map['status'] as String? ?? 'available'),
        pickupAddress: map['pickupAddress'] as String,
        pickupLatitude: (map['pickupLatitude'] as num).toDouble(),
        pickupLongitude: (map['pickupLongitude'] as num).toDouble(),
        dropoffAddress: map['dropoffAddress'] as String,
        dropoffLatitude: (map['dropoffLatitude'] as num).toDouble(),
        dropoffLongitude: (map['dropoffLongitude'] as num).toDouble(),
        distance: (map['distance'] as num).toDouble(),
        fee: map['fee'] as int,
        clientPhone: map['clientPhone'] as String?,
        sellerPhone: map['sellerPhone'] as String?,
        createdAt: DateTime.parse(map['createdAt'] as String),
        pickedUpAt: map['pickedUpAt'] != null
            ? DateTime.parse(map['pickedUpAt'] as String)
            : null,
        deliveredAt: map['deliveredAt'] != null
            ? DateTime.parse(map['deliveredAt'] as String)
            : null,
      );
}

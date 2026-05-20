enum OrderStatus {
  pending,
  paymentPending,
  paymentConfirmed,
  confirmed,
  preparing,
  ready,
  assigned,
  pickedUp,
  inTransit,
  delivered,
  cancelled,
  refunded,
}

enum DeliveryMode { standard, express, retrait }

enum PaymentMethod {
  orangeMoney,
  mtnMobileMoney,
  airtelMoney,
  cash,
  card,
}

class OrderItem {
  final String productId;
  final String title;
  final String? imageUrl;
  final int price;
  final int quantity;
  final String? variantLabel;

  OrderItem({
    required this.productId,
    required this.title,
    this.imageUrl,
    required this.price,
    required this.quantity,
    this.variantLabel,
  });

  int get total => price * quantity;

  Map<String, dynamic> toMap() => {
        'productId': productId,
        'title': title,
        'imageUrl': imageUrl,
        'price': price,
        'quantity': quantity,
        'variantLabel': variantLabel,
      };

  factory OrderItem.fromMap(Map<String, dynamic> map) => OrderItem(
        productId: map['productId'] as String,
        title: map['title'] as String,
        imageUrl: map['imageUrl'] as String?,
        price: map['price'] as int,
        quantity: map['quantity'] as int,
        variantLabel: map['variantLabel'] as String?,
      );
}

class OrderModel {
  final String id;
  final String clientId;
  final String? clientName;
  final String? clientPhone;
  final String sellerId;
  final String? sellerName;
  final String? deliveryPersonId;
  final String? deliveryPersonName;
  final List<OrderItem> items;
  final OrderStatus status;
  final DeliveryMode deliveryMode;
  final PaymentMethod paymentMethod;
  final int subtotal;
  final int deliveryFee;
  final int total;
  final String? addressLabel;
  final double? addressLatitude;
  final double? addressLongitude;
  final String? note;
  final DateTime createdAt;
  final DateTime? confirmedAt;
  final DateTime? deliveredAt;

  OrderModel({
    required this.id,
    required this.clientId,
    this.clientName,
    this.clientPhone,
    required this.sellerId,
    this.sellerName,
    this.deliveryPersonId,
    this.deliveryPersonName,
    required this.items,
    this.status = OrderStatus.pending,
    this.deliveryMode = DeliveryMode.standard,
    this.paymentMethod = PaymentMethod.orangeMoney,
    required this.subtotal,
    this.deliveryFee = 0,
    required this.total,
    this.addressLabel,
    this.addressLatitude,
    this.addressLongitude,
    this.note,
    DateTime? createdAt,
    this.confirmedAt,
    this.deliveredAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() => {
        'id': id,
        'clientId': clientId,
        'clientName': clientName,
        'clientPhone': clientPhone,
        'sellerId': sellerId,
        'sellerName': sellerName,
        'deliveryPersonId': deliveryPersonId,
        'deliveryPersonName': deliveryPersonName,
        'items': items.map((i) => i.toMap()).toList(),
        'status': status.name,
        'deliveryMode': deliveryMode.name,
        'paymentMethod': paymentMethod.name,
        'subtotal': subtotal,
        'deliveryFee': deliveryFee,
        'total': total,
        'addressLabel': addressLabel,
        'addressLatitude': addressLatitude,
        'addressLongitude': addressLongitude,
        'note': note,
        'createdAt': createdAt.toIso8601String(),
        'confirmedAt': confirmedAt?.toIso8601String(),
        'deliveredAt': deliveredAt?.toIso8601String(),
      };

  factory OrderModel.fromMap(Map<String, dynamic> map) => OrderModel(
        id: map['id'] as String,
        clientId: map['clientId'] as String,
        clientName: map['clientName'] as String?,
        clientPhone: map['clientPhone'] as String?,
        sellerId: map['sellerId'] as String,
        sellerName: map['sellerName'] as String?,
        deliveryPersonId: map['deliveryPersonId'] as String?,
        deliveryPersonName: map['deliveryPersonName'] as String?,
        items: (map['items'] as List)
            .map((i) => OrderItem.fromMap(i as Map<String, dynamic>))
            .toList(),
        status: OrderStatus.values.byName(map['status'] as String? ?? 'pending'),
        deliveryMode: DeliveryMode.values.byName(map['deliveryMode'] as String? ?? 'standard'),
        paymentMethod: PaymentMethod.values.byName(map['paymentMethod'] as String? ?? 'orangeMoney'),
        subtotal: map['subtotal'] as int,
        deliveryFee: map['deliveryFee'] as int? ?? 0,
        total: map['total'] as int,
        addressLabel: map['addressLabel'] as String?,
        addressLatitude: (map['addressLatitude'] as num?)?.toDouble(),
        addressLongitude: (map['addressLongitude'] as num?)?.toDouble(),
        note: map['note'] as String?,
        createdAt: DateTime.parse(map['createdAt'] as String),
        confirmedAt: map['confirmedAt'] != null
            ? DateTime.parse(map['confirmedAt'] as String)
            : null,
        deliveredAt: map['deliveredAt'] != null
            ? DateTime.parse(map['deliveredAt'] as String)
            : null,
      );
}

import 'order_model.dart';

enum PaymentStatus { pending, processing, confirmed, failed, refunded }

class PaymentModel {
  final String id;
  final String orderId;
  final String clientId;
  final int amount;
  final int? fee;
  final PaymentMethod method;
  final PaymentStatus status;
  final String? transactionId;
  final String? phoneNumber;
  final DateTime createdAt;
  final DateTime? confirmedAt;

  PaymentModel({
    required this.id,
    required this.orderId,
    required this.clientId,
    required this.amount,
    this.fee,
    required this.method,
    this.status = PaymentStatus.pending,
    this.transactionId,
    this.phoneNumber,
    DateTime? createdAt,
    this.confirmedAt,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() => {
        'id': id,
        'orderId': orderId,
        'clientId': clientId,
        'amount': amount,
        'fee': fee,
        'method': method.name,
        'status': status.name,
        'transactionId': transactionId,
        'phoneNumber': phoneNumber,
        'createdAt': createdAt.toIso8601String(),
        'confirmedAt': confirmedAt?.toIso8601String(),
      };

  factory PaymentModel.fromMap(Map<String, dynamic> map) => PaymentModel(
        id: map['id'] as String,
        orderId: map['orderId'] as String,
        clientId: map['clientId'] as String,
        amount: map['amount'] as int,
        fee: map['fee'] as int?,
        method: PaymentMethod.values.byName(map['method'] as String),
        status: PaymentStatus.values.byName(map['status'] as String? ?? 'pending'),
        transactionId: map['transactionId'] as String?,
        phoneNumber: map['phoneNumber'] as String?,
        createdAt: DateTime.parse(map['createdAt'] as String),
        confirmedAt: map['confirmedAt'] != null
            ? DateTime.parse(map['confirmedAt'] as String)
            : null,
      );
}

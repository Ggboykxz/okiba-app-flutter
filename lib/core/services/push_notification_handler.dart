import 'package:flutter/material.dart';

enum NotificationType {
  orderConfirmed,
  orderShipped,
  orderDelivered,
  paymentReceived,
  newMessage,
  newReview,
  promotion,
  lowStock,
  system,
}

class PushNotificationHandler {
  static final PushNotificationHandler _instance = PushNotificationHandler._();
  factory PushNotificationHandler() => _instance;
  PushNotificationHandler._();

  // Callback when a notification is tapped
  void Function(NotificationType type, String? data)? onNotificationTap;

  void handleNotificationTap(NotificationType type, String? payload) {
    onNotificationTap?.call(type, payload);
  }

  String getNotificationRoute(NotificationType type, String? data) {
    switch (type) {
      case NotificationType.orderConfirmed:
      case NotificationType.orderShipped:
      case NotificationType.orderDelivered:
        return '/client/orders/${data ?? ''}';
      case NotificationType.newMessage:
        return '/chat/${data ?? ''}';
      case NotificationType.paymentReceived:
        return '/seller/boutique/wallet';
      case NotificationType.newReview:
        return '/client/product/${data ?? ''}/reviews';
      case NotificationType.promotion:
        return '/rapid/feed';
      case NotificationType.lowStock:
        return '/seller/boutique/inventory';
      case NotificationType.system:
        return '/notifications/${data ?? ''}';
    }
  }

  IconData getNotificationIcon(NotificationType type) {
    switch (type) {
      case NotificationType.orderConfirmed:
        return Icons.check_circle_rounded;
      case NotificationType.orderShipped:
        return Icons.local_shipping_rounded;
      case NotificationType.orderDelivered:
        return Icons.delivery_dining_rounded;
      case NotificationType.paymentReceived:
        return Icons.payments_rounded;
      case NotificationType.newMessage:
        return Icons.chat_rounded;
      case NotificationType.newReview:
        return Icons.star_rounded;
      case NotificationType.promotion:
        return Icons.local_offer_rounded;
      case NotificationType.lowStock:
        return Icons.inventory_rounded;
      case NotificationType.system:
        return Icons.info_rounded;
    }
  }

  Color getNotificationColor(NotificationType type, ColorScheme colorScheme) {
    switch (type) {
      case NotificationType.orderConfirmed:
      case NotificationType.orderDelivered:
      case NotificationType.paymentReceived:
        return colorScheme.primary;
      case NotificationType.orderShipped:
        return colorScheme.secondary;
      case NotificationType.newMessage:
        return colorScheme.tertiary;
      case NotificationType.newReview:
        return Colors.amber;
      case NotificationType.promotion:
        return colorScheme.error;
      case NotificationType.lowStock:
        return Colors.orange;
      case NotificationType.system:
        return colorScheme.onSurfaceVariant;
    }
  }

  String getNotificationTitle(NotificationType type) {
    switch (type) {
      case NotificationType.orderConfirmed:
        return 'Commande confirmée';
      case NotificationType.orderShipped:
        return 'Commande expédiée';
      case NotificationType.orderDelivered:
        return 'Commande livrée';
      case NotificationType.paymentReceived:
        return 'Paiement reçu';
      case NotificationType.newMessage:
        return 'Nouveau message';
      case NotificationType.newReview:
        return 'Nouvel avis';
      case NotificationType.promotion:
        return 'Promotion';
      case NotificationType.lowStock:
        return 'Stock faible';
      case NotificationType.system:
        return 'Information';
    }
  }
}

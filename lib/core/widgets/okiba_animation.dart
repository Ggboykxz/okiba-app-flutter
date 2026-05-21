import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

enum AnimationType {
  splashSuccess,
  paymentSuccess,
  loadingDots,
  emptyState,
  errorState,
  orderDelivered,
  newMessage,
  driverArriving,
}

class OkibaAnimation extends StatelessWidget {
  final AnimationType type;
  final double size;
  final bool repeat;
  final VoidCallback? onComplete;

  const OkibaAnimation({
    super.key,
    required this.type,
    this.size = 120,
    this.repeat = false,
    this.onComplete,
  });

  String get _assetPath {
    switch (type) {
      case AnimationType.splashSuccess:
        return 'assets/animations/splash_success.json';
      case AnimationType.paymentSuccess:
        return 'assets/animations/payment_success.json';
      case AnimationType.loadingDots:
        return 'assets/animations/loading_dots.json';
      case AnimationType.emptyState:
        return 'assets/animations/empty_state.json';
      case AnimationType.errorState:
        return 'assets/animations/error_state.json';
      case AnimationType.orderDelivered:
        return 'assets/animations/order_delivered.json';
      case AnimationType.newMessage:
        return 'assets/animations/new_message.json';
      case AnimationType.driverArriving:
        return 'assets/animations/driver_arriving.json';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      _assetPath,
      width: size,
      height: size,
      repeat: repeat,
      onLoaded: (composition) {
        if (!repeat && onComplete != null) {
          Future.delayed(composition.duration, onComplete!);
        }
      },
    );
  }
}

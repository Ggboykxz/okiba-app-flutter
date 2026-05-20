class ApiEndpoints {
  ApiEndpoints._();

  static const String baseUrl = 'https://api.okiba.ga/v1';

  // Auth
  static const String sendOtp = '/auth/send-otp';
  static const String verifyOtp = '/auth/verify-otp';
  static const String registerUser = '/auth/register';
  static const String refreshToken = '/auth/refresh';

  // Products
  static const String products = '/products';
  static const String productDetail = '/products/';
  static const String productCategories = '/products/categories';

  // Orders
  static const String orders = '/orders';
  static const String orderDetail = '/orders/';
  static const String orderStatus = '/orders/status/';

  // Payments
  static const String paymentInit = '/payments/init';
  static const String paymentConfirm = '/payments/confirm';
  static const String paymentStatus = '/payments/status/';

  // Delivery
  static const String deliveryJobs = '/delivery/jobs';
  static const String deliveryAccept = '/delivery/jobs/accept';
  static const String deliveryComplete = '/delivery/jobs/complete';

  // Wallet
  static const String walletBalance = '/wallet/balance';
  static const String walletWithdraw = '/wallet/withdraw';
  static const String walletHistory = '/wallet/history';

  // Chat
  static const String conversations = '/chat/conversations';
  static const String messages = '/chat/messages/';

  // Notifications
  static const String notifications = '/notifications';
  static const String notificationRegister = '/notifications/register';
}

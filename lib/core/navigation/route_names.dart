/// Route path constants — single source of truth.
class RoutePaths {
  RoutePaths._();

  // Phase 0
  static const String splash = '/';
  static const String empty = '/empty';

  // Phase 1
  static const String welcome = '/welcome';
  static const String register = '/register';
  static const String otp = '/otp';
  static const String login = '/login';
  static const String emailRegister = '/register/email';
  static const String emailVerification = '/register/verify';
  static const String resetPassword = '/reset-password';
  static const String newPassword = '/reset-password/new';

  // Phase 2
  static const String onboarding = '/onboarding';
  static const String roleSelection = '/role-selection';
  static const String sellerTypeDetail = '/seller-type-detail';
  static const String kyc = '/kyc';
  static const String profileSetup = '/profile-setup';

  // Phase 3
  static const String clientHome = '/client/home';
  static const String categories = '/categories';
  static const String categoryProducts = '/categories/:id/products';
  static const String search = '/client/search';
  static const String searchResults = '/client/search/results';
  static const String productDetail = '/client/product/:id';
  static const String sellerProfile = '/client/seller/:id';
  static const String reviews = '/client/product/:id/reviews';
  static const String negotiate = '/client/product/:id/negotiate';
  static const String cart = '/client/cart';
  static const String cartItemEdit = '/client/cart/item/:id/edit';
  static const String checkout = '/client/checkout';
  static const String checkoutAddress = '/client/checkout/address';
  static const String checkoutDelivery = '/client/checkout/delivery';
  static const String checkoutPayment = '/client/checkout/payment';
  static const String checkoutReview = '/client/checkout/review';
  static const String paymentProcessing = '/client/checkout/processing';
  static const String paymentFailed = '/client/checkout/failed';

  // Phase 4
  static const String orders = '/client/orders';
  static const String orderDetail = '/client/orders/:id';
  static const String orderTracking = '/client/orders/:id/tracking';
  static const String rateOrder = '/client/orders/:id/rate';
  static const String dispute = '/client/orders/:id/dispute';
  static const String favorites = '/favorites';

  // Phase 5
  static const String sellerWhatsapp = '/seller/whatsapp';
  static const String whatsappProductCreate = '/seller/whatsapp/product/create';
  static const String whatsappProductDetail = '/seller/whatsapp/product/:id/detail';
  static const String whatsappProductEdit = '/seller/whatsapp/product/:id/edit';
  static const String whatsappOrders = '/seller/whatsapp/orders';
  static const String whatsappOrderDetail = '/seller/whatsapp/orders/:id';
  static const String whatsappStats = '/seller/whatsapp/stats';

  // Phase 6
  static const String sellerBoutique = '/seller/boutique';
  static const String boutiqueAnalytics = '/seller/boutique/analytics';
  static const String boutiqueCatalog = '/seller/boutique/catalog';
  static const String boutiqueProductCreate = '/seller/boutique/product/create';
  static const String boutiqueProductEdit = '/seller/boutique/product/:id/edit';
  static const String boutiqueOrders = '/seller/boutique/orders';
  static const String boutiqueOrderDetail = '/seller/boutique/orders/:id';
  static const String boutiqueInventory = '/seller/boutique/inventory';
  static const String boutiqueWallet = '/seller/boutique/wallet';
  static const String boutiqueSettings = '/seller/boutique/settings';

  // Phase 7
  static const String rapidDashboard = '/rapid';
  static const String rapidPublish = '/rapid/publish';
  static const String rapidFeed = '/rapid/feed';
  static const String rapidProductDetail = '/rapid/product/:id';
  static const String rapidPromotions = '/rapid/promotions';
  static const String rapidFlashSales = '/rapid/flash-sales';
  static const String rapidMessages = '/rapid/messages';
  static const String rapidAnalytics = '/rapid/analytics';

  // Phase 8
  static const String driverDashboard = '/driver';
  static const String driverZone = '/driver/zone';
  static const String driverEarnings = '/driver/earnings';
  static const String driverWallet = '/driver/wallet';
  static const String driverProfile = '/driver/profile';
  static const String driverRequest = '/driver/request/:id';
  static const String driverNavigation = '/driver/navigation/:id';
  static const String driverPickup = '/driver/pickup/:id';
  static const String driverDropoff = '/driver/dropoff/:id';

  // Phase 9
  static const String chatList = '/chat';
  static const String chatDetail = '/chat/:id';
  static const String supportChat = '/support-chat';

  // Phase 10
  static const String profile = '/profile';
  static const String editProfile = '/profile/edit';
  static const String language = '/profile/language';
  static const String lowDataMode = '/profile/low-data';
  static const String notificationSettings = '/profile/notification-settings';
  static const String privacySecurity = '/profile/privacy-security';
  static const String paymentMethods = '/profile/payment-methods';
  static const String addressBook = '/profile/address-book';
  static const String referral = '/profile/referral';
  static const String about = '/profile/about';
  static const String deleteAccount = '/profile/delete-account';
  static const String help = '/help';

  // Phase 11
  static const String notifications = '/notifications';
  static const String notificationDetail = '/notifications/:id';

  // Phase 12
  static const String adminDashboard = '/admin';
  static const String adminUsers = '/admin/users';
  static const String adminOrders = '/admin/orders';
  static const String adminKyc = '/admin/kyc';

  // Phase 13
  static const String onboardingTutorial = '/onboarding-tutorial';
  static const String rateApp = '/rate-app';
  static const String whatsNew = '/whats-new';
  static const String accessibilitySettings = '/profile/accessibility';
  static const String appUpdate = '/app-update';
}

/// Route name constants for named navigation.
class RouteNames {
  RouteNames._();

  // Phase 0
  static const String splash = 'splash';
  static const String empty = 'empty';

  // Phase 1
  static const String welcome = 'welcome';
  static const String register = 'register';
  static const String otp = 'otp';
  static const String login = 'login';
  static const String emailRegister = 'emailRegister';
  static const String emailVerification = 'emailVerification';
  static const String resetPassword = 'resetPassword';
  static const String newPassword = 'newPassword';

  // Phase 2
  static const String onboarding = 'onboarding';
  static const String roleSelection = 'roleSelection';
  static const String sellerTypeDetail = 'sellerTypeDetail';
  static const String kyc = 'kyc';
  static const String profileSetup = 'profileSetup';

  // Phase 3
  static const String clientHome = 'clientHome';
  static const String categories = 'categories';
  static const String categoryProducts = 'categoryProducts';
  static const String search = 'search';
  static const String searchResults = 'searchResults';
  static const String productDetail = 'productDetail';
  static const String sellerProfile = 'sellerProfile';
  static const String reviews = 'reviews';
  static const String negotiate = 'negotiate';
  static const String cart = 'cart';
  static const String cartItemEdit = 'cartItemEdit';
  static const String checkout = 'checkout';
  static const String checkoutAddress = 'checkoutAddress';
  static const String checkoutDelivery = 'checkoutDelivery';
  static const String checkoutPayment = 'checkoutPayment';
  static const String checkoutReview = 'checkoutReview';
  static const String paymentProcessing = 'paymentProcessing';
  static const String paymentFailed = 'paymentFailed';

  // Phase 4
  static const String orders = 'orders';
  static const String orderDetail = 'orderDetail';
  static const String orderTracking = 'orderTracking';
  static const String rateOrder = 'rateOrder';
  static const String dispute = 'dispute';
  static const String favorites = 'favorites';

  // Phase 5
  static const String sellerWhatsapp = 'sellerWhatsapp';
  static const String whatsappProductCreate = 'whatsappProductCreate';
  static const String whatsappProductDetail = 'whatsappProductDetail';
  static const String whatsappProductEdit = 'whatsappProductEdit';
  static const String whatsappOrders = 'whatsappOrders';
  static const String whatsappOrderDetail = 'whatsappOrderDetail';
  static const String whatsappStats = 'whatsappStats';

  // Phase 6
  static const String sellerBoutique = 'sellerBoutique';
  static const String boutiqueAnalytics = 'boutiqueAnalytics';
  static const String boutiqueCatalog = 'boutiqueCatalog';
  static const String boutiqueProductCreate = 'boutiqueProductCreate';
  static const String boutiqueProductEdit = 'boutiqueProductEdit';
  static const String boutiqueOrders = 'boutiqueOrders';
  static const String boutiqueOrderDetail = 'boutiqueOrderDetail';
  static const String boutiqueInventory = 'boutiqueInventory';
  static const String boutiqueWallet = 'boutiqueWallet';
  static const String boutiqueSettings = 'boutiqueSettings';

  // Phase 7
  static const String rapidDashboard = 'rapidDashboard';
  static const String rapidPublish = 'rapidPublish';
  static const String rapidFeed = 'rapidFeed';
  static const String rapidProductDetail = 'rapidProductDetail';
  static const String rapidPromotions = 'rapidPromotions';
  static const String rapidFlashSales = 'rapidFlashSales';
  static const String rapidMessages = 'rapidMessages';
  static const String rapidAnalytics = 'rapidAnalytics';

  // Phase 8
  static const String driverDashboard = 'driverDashboard';
  static const String driverZone = 'driverZone';
  static const String driverEarnings = 'driverEarnings';
  static const String driverWallet = 'driverWallet';
  static const String driverProfile = 'driverProfile';
  static const String driverRequest = 'driverRequest';
  static const String driverNavigation = 'driverNavigation';
  static const String driverPickup = 'driverPickup';
  static const String driverDropoff = 'driverDropoff';

  // Phase 9
  static const String chatList = 'chatList';
  static const String chatDetail = 'chatDetail';
  static const String supportChat = 'supportChat';

  // Phase 10
  static const String profile = 'profile';
  static const String editProfile = 'editProfile';
  static const String language = 'language';
  static const String lowDataMode = 'lowDataMode';
  static const String notificationSettings = 'notificationSettings';
  static const String privacySecurity = 'privacySecurity';
  static const String paymentMethods = 'paymentMethods';
  static const String addressBook = 'addressBook';
  static const String referral = 'referral';
  static const String about = 'about';
  static const String deleteAccount = 'deleteAccount';
  static const String help = 'help';

  // Phase 11
  static const String notifications = 'notifications';
  static const String notificationDetail = 'notificationDetail';

  // Phase 12
  static const String adminDashboard = 'adminDashboard';
  static const String adminUsers = 'adminUsers';
  static const String adminOrders = 'adminOrders';
  static const String adminKyc = 'adminKyc';

  // Phase 13
  static const String onboardingTutorial = 'onboardingTutorial';
  static const String rateApp = 'rateApp';
  static const String whatsNew = 'whatsNew';
  static const String accessibilitySettings = 'accessibilitySettings';
  static const String appUpdate = 'appUpdate';
}

import 'package:go_router/go_router.dart';
import '../../presentation/auth/screens/welcome_screen.dart';
import '../../presentation/auth/screens/register_screen.dart';
import '../../presentation/auth/screens/otp_verification_screen.dart';
import '../../presentation/auth/screens/login_screen.dart';
import '../../presentation/auth/screens/email_register_screen.dart';
import '../../presentation/auth/screens/email_verification_screen.dart';
import '../../presentation/auth/screens/reset_password_screen.dart';
import '../../presentation/auth/screens/new_password_screen.dart';
import '../../presentation/auth/screens/onboarding_screen.dart';
import '../../presentation/auth/screens/role_selection_screen.dart';
import '../../presentation/auth/screens/seller_type_detail_screen.dart';
import '../../presentation/auth/screens/kyc_screen.dart';
import '../../presentation/auth/screens/profile_setup_screen.dart';
import '../../presentation/client/screens/client_home_screen.dart';
import '../../presentation/client/screens/category_screen.dart';
import '../../presentation/client/screens/category_products_screen.dart';
import '../../presentation/client/screens/search_screen.dart';
import '../../presentation/client/screens/search_results_screen.dart';
import '../../presentation/client/screens/product_detail_screen.dart';
import '../../presentation/client/screens/seller_profile_screen.dart';
import '../../presentation/client/screens/reviews_screen.dart';
import '../../presentation/client/screens/negotiate_screen.dart';
import '../../presentation/client/screens/cart_screen.dart';
import '../../presentation/client/screens/cart_item_edit_screen.dart';
import '../../presentation/client/screens/checkout/checkout_screen.dart';
import '../../presentation/client/screens/checkout/checkout_address_screen.dart';
import '../../presentation/client/screens/checkout/checkout_delivery_screen.dart';
import '../../presentation/client/screens/checkout/checkout_payment_screen.dart';
import '../../presentation/client/screens/checkout/checkout_review_screen.dart';
import '../../presentation/client/screens/checkout/payment_processing_screen.dart';
import '../../presentation/client/screens/checkout/payment_failed_screen.dart';
import '../../presentation/client/screens/orders/orders_screen.dart';
import '../../presentation/client/screens/orders/order_detail_screen.dart';
import '../../presentation/client/screens/orders/order_tracking_screen.dart';
import '../../presentation/client/screens/orders/rate_order_screen.dart';
import '../../presentation/client/screens/orders/dispute_screen.dart';
import '../../presentation/client/screens/favorites_screen.dart';
import '../../presentation/seller/screens/seller_whatsapp_screen.dart';
import '../../presentation/seller/screens/whatsapp_product_create_screen.dart';
import '../../presentation/seller/screens/whatsapp_product_detail_screen.dart';
import '../../presentation/seller/screens/whatsapp_product_edit_screen.dart';
import '../../presentation/seller/screens/whatsapp_orders_screen.dart';
import '../../presentation/seller/screens/whatsapp_order_detail_screen.dart';
import '../../presentation/seller/screens/whatsapp_stats_screen.dart';
import '../../presentation/seller/screens/seller_boutique_screen.dart';
import '../../presentation/seller/screens/boutique_analytics_screen.dart';
import '../../presentation/seller/screens/boutique_catalog_screen.dart';
import '../../presentation/seller/screens/boutique_product_create_screen.dart';
import '../../presentation/seller/screens/boutique_product_edit_screen.dart';
import '../../presentation/seller/screens/boutique_orders_screen.dart';
import '../../presentation/seller/screens/boutique_order_detail_screen.dart';
import '../../presentation/seller/screens/boutique_inventory_screen.dart';
import '../../presentation/seller/screens/boutique_wallet_screen.dart';
import '../../presentation/seller/screens/boutique_settings_screen.dart';
import '../../presentation/seller_rapid/screens/rapid_dashboard_screen.dart';
import '../../presentation/seller_rapid/screens/rapid_publish_screen.dart';
import '../../presentation/seller_rapid/screens/rapid_feed_screen.dart';
import '../../presentation/seller_rapid/screens/rapid_product_detail_screen.dart';
import '../../presentation/seller_rapid/screens/rapid_promotions_screen.dart';
import '../../presentation/seller_rapid/screens/rapid_flash_sales_screen.dart';
import '../../presentation/seller_rapid/screens/rapid_messages_screen.dart';
import '../../presentation/seller_rapid/screens/rapid_analytics_screen.dart';
import '../../presentation/delivery/screens/driver_dashboard_screen.dart';
import '../../presentation/delivery/screens/driver_zone_screen.dart';
import '../../presentation/delivery/screens/driver_earnings_screen.dart';
import '../../presentation/delivery/screens/driver_wallet_screen.dart';
import '../../presentation/delivery/screens/driver_profile_screen.dart';
import '../../presentation/delivery/screens/new_delivery_request_screen.dart';
import '../../presentation/delivery/screens/delivery_navigation_screen.dart';
import '../../presentation/delivery/screens/delivery_pickup_screen.dart';
import '../../presentation/delivery/screens/delivery_dropoff_screen.dart';
import '../../presentation/chat/screens/chat_list_screen.dart';
import '../../presentation/chat/screens/chat_detail_screen.dart';
import '../../presentation/chat/screens/support_chat_screen.dart';
import '../../presentation/profile/screens/profile_screen.dart';
import '../../presentation/profile/screens/edit_profile_screen.dart';
import '../../presentation/profile/screens/language_screen.dart';
import '../../presentation/profile/screens/low_data_mode_screen.dart';
import '../../presentation/profile/screens/notification_settings_screen.dart';
import '../../presentation/profile/screens/privacy_security_screen.dart';
import '../../presentation/profile/screens/payment_methods_screen.dart';
import '../../presentation/profile/screens/address_book_screen.dart';
import '../../presentation/profile/screens/referral_screen.dart';
import '../../presentation/profile/screens/about_screen.dart';
import '../../presentation/profile/screens/delete_account_screen.dart';
import '../../presentation/profile/screens/help_screen.dart';
import '../../presentation/notifications/screens/notifications_screen.dart';
import '../../presentation/notifications/screens/notification_detail_screen.dart';
import '../../presentation/admin/screens/admin_dashboard_screen.dart';
import '../../presentation/admin/screens/admin_users_screen.dart';
import '../../presentation/admin/screens/admin_orders_screen.dart';
import '../../presentation/admin/screens/admin_kyc_screen.dart';
import '../../presentation/shared/screens/onboarding_tutorial_screen.dart';
import '../../presentation/shared/screens/rate_app_screen.dart';
import '../../presentation/shared/screens/whats_new_screen.dart';
import '../../presentation/shared/screens/app_update_screen.dart';
import '../../presentation/profile/screens/accessibility_settings_screen.dart';
import '../../presentation/splash/splash_screen.dart';
import '../../presentation/shared/screens/empty_state_screen.dart';
import '../../core/widgets/empty_state_image.dart';
import '../../presentation/shared/screens/error_screen.dart';
import 'route_names.dart';

class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: RoutePaths.splash,
    debugLogDiagnostics: true,
    routes: _routes,
    errorBuilder: (context, state) => ErrorScreen(
      title: 'Page introuvable',
      message: "Cette page n'existe pas.",
      onRetry: () => context.go(RoutePaths.splash),
    ),
  );

  static final List<RouteBase> _routes = [
    // 0.1 Splash
    GoRoute(
      path: RoutePaths.splash,
      name: RouteNames.splash,
      builder: (_, _) => const SplashScreen(),
    ),

    // 0.7 Empty state (generic)
    GoRoute(
      path: RoutePaths.empty,
      name: RouteNames.empty,
      builder: (_, state) => EmptyStateScreen(
        type: EmptyStateType.generic,
        title: state.uri.queryParameters['title'] ?? 'Contenu indisponible',
        subtitle: state.uri.queryParameters['subtitle'],
        actionLabel: state.uri.queryParameters['action'],
      ),
    ),

    // 1.1 Welcome
    GoRoute(
      path: RoutePaths.welcome,
      name: RouteNames.welcome,
      builder: (_, _) => const WelcomeScreen(),
    ),

    // 1.2 Register
    GoRoute(
      path: RoutePaths.register,
      name: RouteNames.register,
      builder: (_, _) => const RegisterScreen(),
    ),

    // 1.3 OTP
    GoRoute(
      path: RoutePaths.otp,
      name: RouteNames.otp,
      builder: (_, _) => const OtpVerificationScreen(),
    ),

    // 1.4 Login
    GoRoute(
      path: RoutePaths.login,
      name: RouteNames.login,
      builder: (_, _) => const LoginScreen(),
    ),

    // 1.5 Email register
    GoRoute(
      path: RoutePaths.emailRegister,
      name: RouteNames.emailRegister,
      builder: (_, _) => const EmailRegisterScreen(),
    ),

    // 1.6 Email verification
    GoRoute(
      path: RoutePaths.emailVerification,
      name: RouteNames.emailVerification,
      builder: (_, _) => const EmailVerificationScreen(),
    ),

    // 1.7 Reset password
    GoRoute(
      path: RoutePaths.resetPassword,
      name: RouteNames.resetPassword,
      builder: (_, _) => const ResetPasswordScreen(),
    ),

    // 1.8 New password
    GoRoute(
      path: RoutePaths.newPassword,
      name: RouteNames.newPassword,
      builder: (_, _) => const NewPasswordScreen(),
    ),

    // 2.1 Onboarding
    GoRoute(
      path: RoutePaths.onboarding,
      name: RouteNames.onboarding,
      builder: (_, _) => const OnboardingScreen(),
    ),

    // 2.2 Role selection
    GoRoute(
      path: RoutePaths.roleSelection,
      name: RouteNames.roleSelection,
      builder: (_, _) => const RoleSelectionScreen(),
    ),

    // 2.4 Seller type detail
    GoRoute(
      path: RoutePaths.sellerTypeDetail,
      name: RouteNames.sellerTypeDetail,
      builder: (_, _) => const SellerTypeDetailScreen(),
    ),

    // 2.5 KYC verification
    GoRoute(
      path: RoutePaths.kyc,
      name: RouteNames.kyc,
      builder: (_, _) => const KycScreen(),
    ),

    // 2.6 Profile setup
    GoRoute(
      path: RoutePaths.profileSetup,
      name: RouteNames.profileSetup,
      builder: (_, _) => const ProfileSetupScreen(),
    ),

    // 3.1 Client home
    GoRoute(
      path: RoutePaths.clientHome,
      name: RouteNames.clientHome,
      builder: (_, _) => const ClientHomeScreen(),
    ),

    // 3.2 Categories
    GoRoute(
      path: RoutePaths.categories,
      name: RouteNames.categories,
      builder: (_, _) => const CategoryScreen(),
    ),

    // 3.3 Category products
    GoRoute(
      path: RoutePaths.categoryProducts,
      name: RouteNames.categoryProducts,
      builder: (_, state) => CategoryProductsScreen(
        categoryId: state.pathParameters['id'] ?? '',
      ),
    ),

    // 3.4 Search
    GoRoute(
      path: RoutePaths.search,
      name: RouteNames.search,
      builder: (_, _) => const SearchScreen(),
    ),

    // 3.5 Search results
    GoRoute(
      path: RoutePaths.searchResults,
      name: RouteNames.searchResults,
      builder: (_, state) => SearchResultsScreen(
        query: state.uri.queryParameters['q'] ?? '',
      ),
    ),

    // 3.6 Product detail
    GoRoute(
      path: RoutePaths.productDetail,
      name: RouteNames.productDetail,
      builder: (_, state) => ProductDetailScreen(
        productId: state.pathParameters['id'] ?? '',
      ),
    ),

    // 3.7 Seller profile
    GoRoute(
      path: RoutePaths.sellerProfile,
      name: RouteNames.sellerProfile,
      builder: (_, state) => SellerProfileScreen(
        sellerId: state.pathParameters['id'] ?? '',
      ),
    ),

    // 3.8 Reviews
    GoRoute(
      path: RoutePaths.reviews,
      name: RouteNames.reviews,
      builder: (_, state) => ReviewsScreen(
        productId: state.pathParameters['id'] ?? '',
      ),
    ),

    // 3.9 Cart
    GoRoute(
      path: RoutePaths.cart,
      name: RouteNames.cart,
      builder: (_, _) => const CartScreen(),
    ),

    // 3.10 Cart item edit
    GoRoute(
      path: RoutePaths.cartItemEdit,
      name: RouteNames.cartItemEdit,
      builder: (_, state) => CartItemEditScreen(
        itemId: state.pathParameters['id'] ?? '',
      ),
    ),

    // 3.11 Checkout address
    GoRoute(
      path: RoutePaths.checkoutAddress,
      name: RouteNames.checkoutAddress,
      builder: (_, _) => const CheckoutAddressScreen(),
    ),

    // 3.12 Checkout delivery
    GoRoute(
      path: RoutePaths.checkoutDelivery,
      name: RouteNames.checkoutDelivery,
      builder: (_, _) => const CheckoutDeliveryScreen(),
    ),

    // 3.13 Checkout payment
    GoRoute(
      path: RoutePaths.checkoutPayment,
      name: RouteNames.checkoutPayment,
      builder: (_, _) => const CheckoutPaymentScreen(),
    ),

    // 3.14 Checkout review
    GoRoute(
      path: RoutePaths.checkoutReview,
      name: RouteNames.checkoutReview,
      builder: (_, _) => const CheckoutReviewScreen(),
    ),

    // 3.15 Payment processing
    GoRoute(
      path: RoutePaths.paymentProcessing,
      name: RouteNames.paymentProcessing,
      builder: (_, _) => const PaymentProcessingScreen(),
    ),

    // 3.16 Checkout (original, keeps backwards compat)
    GoRoute(
      path: RoutePaths.checkout,
      name: RouteNames.checkout,
      builder: (_, _) => const CheckoutScreen(),
    ),

    // 3.17 Payment failed
    GoRoute(
      path: RoutePaths.paymentFailed,
      name: RouteNames.paymentFailed,
      builder: (_, _) => const PaymentFailedScreen(),
    ),

    // 3.18 Negotiate
    GoRoute(
      path: RoutePaths.negotiate,
      name: RouteNames.negotiate,
      builder: (_, state) => NegotiateScreen(
        productId: state.pathParameters['id'] ?? '',
      ),
    ),

    // 4.1 Orders list
    GoRoute(
      path: RoutePaths.orders,
      name: RouteNames.orders,
      builder: (_, _) => const OrdersScreen(),
    ),

    // 4.2 Order detail
    GoRoute(
      path: RoutePaths.orderDetail,
      name: RouteNames.orderDetail,
      builder: (_, state) => OrderDetailScreen(
        orderId: state.pathParameters['id'] ?? '',
      ),
    ),

    // 4.3 Order tracking
    GoRoute(
      path: RoutePaths.orderTracking,
      name: RouteNames.orderTracking,
      builder: (_, state) => OrderTrackingScreen(
        orderId: state.pathParameters['id'] ?? '',
      ),
    ),

    // 4.4 Rate order
    GoRoute(
      path: RoutePaths.rateOrder,
      name: RouteNames.rateOrder,
      builder: (_, state) => RateOrderScreen(
        orderId: state.pathParameters['id'] ?? '',
      ),
    ),

    // 4.5 Dispute
    GoRoute(
      path: RoutePaths.dispute,
      name: RouteNames.dispute,
      builder: (_, state) => DisputeScreen(
        orderId: state.pathParameters['id'] ?? '',
      ),
    ),

    // 4.6 Favorites
    GoRoute(
      path: RoutePaths.favorites,
      name: RouteNames.favorites,
      builder: (_, _) => const FavoritesScreen(),
    ),

    // 5.1 Seller WhatsApp dashboard
    GoRoute(
      path: RoutePaths.sellerWhatsapp,
      name: RouteNames.sellerWhatsapp,
      builder: (_, _) => const SellerWhatsAppScreen(),
    ),

    // 5.2 WhatsApp product create
    GoRoute(
      path: RoutePaths.whatsappProductCreate,
      name: RouteNames.whatsappProductCreate,
      builder: (_, _) => const WhatsAppProductCreateScreen(),
    ),

    // 5.3 WhatsApp product detail
    GoRoute(
      path: RoutePaths.whatsappProductDetail,
      name: RouteNames.whatsappProductDetail,
      builder: (_, state) => WhatsAppProductDetailScreen(
        productId: state.pathParameters['id'] ?? '',
      ),
    ),

    // 5.4 WhatsApp product edit
    GoRoute(
      path: RoutePaths.whatsappProductEdit,
      name: RouteNames.whatsappProductEdit,
      builder: (_, state) => WhatsAppProductEditScreen(
        productId: state.pathParameters['id'] ?? '',
      ),
    ),

    // 5.5 WhatsApp orders
    GoRoute(
      path: RoutePaths.whatsappOrders,
      name: RouteNames.whatsappOrders,
      builder: (_, _) => const WhatsAppOrdersScreen(),
    ),

    // 5.6 WhatsApp order detail
    GoRoute(
      path: RoutePaths.whatsappOrderDetail,
      name: RouteNames.whatsappOrderDetail,
      builder: (_, state) => WhatsAppOrderDetailScreen(
        orderId: state.pathParameters['id'] ?? '',
      ),
    ),

    // 5.7 WhatsApp stats
    GoRoute(
      path: RoutePaths.whatsappStats,
      name: RouteNames.whatsappStats,
      builder: (_, _) => const WhatsAppStatsScreen(),
    ),

    // 6.1 Seller boutique dashboard
    GoRoute(
      path: RoutePaths.sellerBoutique,
      name: RouteNames.sellerBoutique,
      builder: (_, _) => const SellerBoutiqueScreen(),
    ),
    // 6.2 Boutique analytics
    GoRoute(
      path: RoutePaths.boutiqueAnalytics,
      name: RouteNames.boutiqueAnalytics,
      builder: (_, _) => const BoutiqueAnalyticsScreen(),
    ),
    // 6.3 Boutique catalog
    GoRoute(
      path: RoutePaths.boutiqueCatalog,
      name: RouteNames.boutiqueCatalog,
      builder: (_, _) => const BoutiqueCatalogScreen(),
    ),
    // 6.4 Boutique product create
    GoRoute(
      path: RoutePaths.boutiqueProductCreate,
      name: RouteNames.boutiqueProductCreate,
      builder: (_, _) => const BoutiqueProductCreateScreen(),
    ),
    // 6.5 Boutique product edit
    GoRoute(
      path: RoutePaths.boutiqueProductEdit,
      name: RouteNames.boutiqueProductEdit,
      builder: (_, state) => BoutiqueProductEditScreen(
        productId: state.pathParameters['id']!,
      ),
    ),
    // 6.6 Boutique orders
    GoRoute(
      path: RoutePaths.boutiqueOrders,
      name: RouteNames.boutiqueOrders,
      builder: (_, _) => const BoutiqueOrdersScreen(),
    ),
    // 6.7 Boutique order detail
    GoRoute(
      path: RoutePaths.boutiqueOrderDetail,
      name: RouteNames.boutiqueOrderDetail,
      builder: (_, state) => BoutiqueOrderDetailScreen(
        orderId: state.pathParameters['id']!,
      ),
    ),
    // 6.8 Boutique inventory
    GoRoute(
      path: RoutePaths.boutiqueInventory,
      name: RouteNames.boutiqueInventory,
      builder: (_, _) => const BoutiqueInventoryScreen(),
    ),
    // 6.9 Boutique wallet
    GoRoute(
      path: RoutePaths.boutiqueWallet,
      name: RouteNames.boutiqueWallet,
      builder: (_, _) => const BoutiqueWalletScreen(),
    ),
    // 6.10 Boutique settings
    GoRoute(
      path: RoutePaths.boutiqueSettings,
      name: RouteNames.boutiqueSettings,
      builder: (_, _) => const BoutiqueSettingsScreen(),
    ),

    // 7.1 Rapid dashboard
    GoRoute(
      path: RoutePaths.rapidDashboard,
      name: RouteNames.rapidDashboard,
      builder: (_, _) => const RapidDashboardScreen(),
    ),

    // 7.2 Rapid publish
    GoRoute(
      path: RoutePaths.rapidPublish,
      name: RouteNames.rapidPublish,
      builder: (_, _) => const RapidPublishScreen(),
    ),

    // 7.3 Rapid feed
    GoRoute(
      path: RoutePaths.rapidFeed,
      name: RouteNames.rapidFeed,
      builder: (_, _) => const RapidFeedScreen(),
    ),
    // 7.4 Rapid product detail
    GoRoute(
      path: RoutePaths.rapidProductDetail,
      name: RouteNames.rapidProductDetail,
      builder: (_, state) => RapidProductDetailScreen(
        productId: state.pathParameters['id']!,
      ),
    ),
    // 7.5 Rapid promotions
    GoRoute(
      path: RoutePaths.rapidPromotions,
      name: RouteNames.rapidPromotions,
      builder: (_, _) => const RapidPromotionsScreen(),
    ),
    // 7.6 Rapid flash sales
    GoRoute(
      path: RoutePaths.rapidFlashSales,
      name: RouteNames.rapidFlashSales,
      builder: (_, _) => const RapidFlashSalesScreen(),
    ),
    // 7.7 Rapid messages
    GoRoute(
      path: RoutePaths.rapidMessages,
      name: RouteNames.rapidMessages,
      builder: (_, _) => const RapidMessagesScreen(),
    ),
    // 7.8 Rapid analytics
    GoRoute(
      path: RoutePaths.rapidAnalytics,
      name: RouteNames.rapidAnalytics,
      builder: (_, _) => const RapidAnalyticsScreen(),
    ),

    // 8.1 Driver dashboard
    GoRoute(
      path: RoutePaths.driverDashboard,
      name: RouteNames.driverDashboard,
      builder: (_, _) => const DriverDashboardScreen(),
    ),
    // 8.2 Driver zone
    GoRoute(
      path: RoutePaths.driverZone,
      name: RouteNames.driverZone,
      builder: (_, _) => const DriverZoneScreen(),
    ),
    // 8.3 Driver earnings
    GoRoute(
      path: RoutePaths.driverEarnings,
      name: RouteNames.driverEarnings,
      builder: (_, _) => const DriverEarningsScreen(),
    ),
    // 8.4 Driver wallet
    GoRoute(
      path: RoutePaths.driverWallet,
      name: RouteNames.driverWallet,
      builder: (_, _) => const DriverWalletScreen(),
    ),
    // 8.5 Driver profile
    GoRoute(
      path: RoutePaths.driverProfile,
      name: RouteNames.driverProfile,
      builder: (_, _) => const DriverProfileScreen(),
    ),
    // 8.6 New delivery request
    GoRoute(
      path: RoutePaths.driverRequest,
      name: RouteNames.driverRequest,
      builder: (_, state) => NewDeliveryRequestScreen(
        requestId: state.pathParameters['id']!,
      ),
    ),
    // 8.7 Delivery navigation
    GoRoute(
      path: RoutePaths.driverNavigation,
      name: RouteNames.driverNavigation,
      builder: (_, state) => DeliveryNavigationScreen(
        deliveryId: state.pathParameters['id']!,
      ),
    ),
    // 8.8 Delivery pickup
    GoRoute(
      path: RoutePaths.driverPickup,
      name: RouteNames.driverPickup,
      builder: (_, state) => DeliveryPickupScreen(
        deliveryId: state.pathParameters['id']!,
      ),
    ),
    // 8.9 Delivery dropoff
    GoRoute(
      path: RoutePaths.driverDropoff,
      name: RouteNames.driverDropoff,
      builder: (_, state) => DeliveryDropoffScreen(
        deliveryId: state.pathParameters['id']!,
      ),
    ),

    // 9.1 Chat list
    GoRoute(
      path: RoutePaths.chatList,
      name: RouteNames.chatList,
      builder: (_, _) => const ChatListScreen(),
    ),

    // 9.2 Chat detail
    GoRoute(
      path: RoutePaths.chatDetail,
      name: RouteNames.chatDetail,
      builder: (_, state) => ChatDetailScreen(
        chatId: state.pathParameters['id'] ?? '',
      ),
    ),
    // 9.4 Support chat
    GoRoute(
      path: RoutePaths.supportChat,
      name: RouteNames.supportChat,
      builder: (_, _) => const SupportChatScreen(),
    ),

    // 10.1 Profile hub
    GoRoute(
      path: RoutePaths.profile,
      name: RouteNames.profile,
      builder: (_, _) => const ProfileScreen(),
    ),

    // 10.2 Edit profile
    GoRoute(
      path: RoutePaths.editProfile,
      name: RouteNames.editProfile,
      builder: (_, _) => const EditProfileScreen(),
    ),

    // 10.7 Language
    GoRoute(
      path: RoutePaths.language,
      name: RouteNames.language,
      builder: (_, _) => const LanguageScreen(),
    ),

    // 10.8 Low data mode
    GoRoute(
      path: RoutePaths.lowDataMode,
      name: RouteNames.lowDataMode,
      builder: (_, _) => const LowDataModeScreen(),
    ),

    // 10.6 Notification settings
    GoRoute(
      path: RoutePaths.notificationSettings,
      name: RouteNames.notificationSettings,
      builder: (_, _) => const NotificationSettingsScreen(),
    ),

    // 10.7 Privacy & security
    GoRoute(
      path: RoutePaths.privacySecurity,
      name: RouteNames.privacySecurity,
      builder: (_, _) => const PrivacySecurityScreen(),
    ),

    // 10.8 Payment methods
    GoRoute(
      path: RoutePaths.paymentMethods,
      name: RouteNames.paymentMethods,
      builder: (_, _) => const PaymentMethodsScreen(),
    ),

    // 10.9 Address book
    GoRoute(
      path: RoutePaths.addressBook,
      name: RouteNames.addressBook,
      builder: (_, _) => const AddressBookScreen(),
    ),

    // 10.10 Referral
    GoRoute(
      path: RoutePaths.referral,
      name: RouteNames.referral,
      builder: (_, _) => const ReferralScreen(),
    ),

    // 10.11 About
    GoRoute(
      path: RoutePaths.about,
      name: RouteNames.about,
      builder: (_, _) => const AboutScreen(),
    ),

    // 10.12 Delete account
    GoRoute(
      path: RoutePaths.deleteAccount,
      name: RouteNames.deleteAccount,
      builder: (_, _) => const DeleteAccountScreen(),
    ),

    // 10.11 Help
    GoRoute(
      path: RoutePaths.help,
      name: RouteNames.help,
      builder: (_, _) => const HelpScreen(),
    ),

    // 11.1 Notifications center
    GoRoute(
      path: RoutePaths.notifications,
      name: RouteNames.notifications,
      builder: (_, _) => const NotificationsScreen(),
    ),
    // 11.2 Notification detail
    GoRoute(
      path: RoutePaths.notificationDetail,
      name: RouteNames.notificationDetail,
      builder: (_, state) => NotificationDetailScreen(
        notificationId: state.pathParameters['id'] ?? '',
      ),
    ),

    // 12.1 Admin dashboard
    GoRoute(
      path: RoutePaths.adminDashboard,
      name: RouteNames.adminDashboard,
      builder: (_, _) => const AdminDashboardScreen(),
    ),
    // 12.2 Admin users
    GoRoute(
      path: RoutePaths.adminUsers,
      name: RouteNames.adminUsers,
      builder: (_, _) => const AdminUsersScreen(),
    ),
    // 12.3 Admin orders
    GoRoute(
      path: RoutePaths.adminOrders,
      name: RouteNames.adminOrders,
      builder: (_, _) => const AdminOrdersScreen(),
    ),
    // 12.4 Admin KYC
    GoRoute(
      path: RoutePaths.adminKyc,
      name: RouteNames.adminKyc,
      builder: (_, _) => const AdminKycScreen(),
    ),

    // 13.1 Onboarding tutorial
    GoRoute(
      path: RoutePaths.onboardingTutorial,
      name: RouteNames.onboardingTutorial,
      builder: (_, _) => const OnboardingTutorialScreen(),
    ),
    // 13.2 Rate app
    GoRoute(
      path: RoutePaths.rateApp,
      name: RouteNames.rateApp,
      builder: (_, _) => const RateAppScreen(),
    ),
    // 13.3 What's new
    GoRoute(
      path: RoutePaths.whatsNew,
      name: RouteNames.whatsNew,
      builder: (_, _) => const WhatsNewScreen(),
    ),
    // 13.4 Accessibility settings
    GoRoute(
      path: RoutePaths.accessibilitySettings,
      name: RouteNames.accessibilitySettings,
      builder: (_, _) => const AccessibilitySettingsScreen(),
    ),
    // 13.5 App update
    GoRoute(
      path: RoutePaths.appUpdate,
      name: RouteNames.appUpdate,
      builder: (_, _) => const AppUpdateScreen(),
    ),
  ];
}

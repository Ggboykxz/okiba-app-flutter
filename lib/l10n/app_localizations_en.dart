// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_name => 'Okiba';

  @override
  String get app_tagline => 'Buy, sell, get delivered';

  @override
  String get nav_home => 'Home';

  @override
  String get nav_search => 'Search';

  @override
  String get nav_cart => 'Cart';

  @override
  String get nav_orders => 'Orders';

  @override
  String get nav_profile => 'Profile';

  @override
  String get onboarding_title_1 => 'Shop Everything';

  @override
  String get onboarding_desc_1 => 'Thousands of products near you';

  @override
  String get onboarding_title_2 => 'Sell Easily';

  @override
  String get onboarding_desc_2 => 'WhatsApp, store or in 30 seconds';

  @override
  String get onboarding_title_3 => 'Deliver & Earn';

  @override
  String get onboarding_desc_3 => 'Become a delivery person and earn money';

  @override
  String get onboarding_skip => 'Skip';

  @override
  String get onboarding_next => 'Next';

  @override
  String get onboarding_start => 'Get Started';

  @override
  String get auth_login_title => 'Login';

  @override
  String get auth_phone_hint => 'Phone number';

  @override
  String get auth_phone_format => '+241 XX XX XX XX';

  @override
  String get auth_send_code => 'Send code';

  @override
  String get auth_verify_title => 'Verification';

  @override
  String get auth_code_hint => 'Verification code';

  @override
  String get auth_verify => 'Verify';

  @override
  String get auth_resend => 'Resend code';

  @override
  String auth_resend_in(Object seconds) {
    return 'Resend in ${seconds}s';
  }

  @override
  String get auth_email_title => 'Email';

  @override
  String get auth_email_hint => 'Email address';

  @override
  String get auth_password_hint => 'Password';

  @override
  String get auth_forgot_password => 'Forgot password?';

  @override
  String get auth_no_account => 'Don\'t have an account?';

  @override
  String get auth_has_account => 'Already have an account?';

  @override
  String get auth_register => 'Register';

  @override
  String get auth_register_title => 'Create account';

  @override
  String get auth_name_hint => 'Full name';

  @override
  String get auth_login_button => 'Log in';

  @override
  String get auth_login_subtitle => 'Log in to your account';

  @override
  String get auth_invalid_phone => 'Invalid phone number';

  @override
  String get auth_password_required => 'Password required';

  @override
  String get auth_phone_register_hint => 'Phone';

  @override
  String get auth_continue => 'Continue';

  @override
  String get auth_register_email => 'Register with email';

  @override
  String get auth_email_register_title => 'Email registration';

  @override
  String get auth_email_register_subtitle =>
      'Create your account with an email';

  @override
  String get auth_email_label => 'Email';

  @override
  String get auth_email_invalid => 'Invalid email';

  @override
  String get auth_password_min_chars => 'Minimum 8 characters';

  @override
  String get auth_confirm_password => 'Confirm password';

  @override
  String get auth_passwords_no_match => 'Passwords do not match';

  @override
  String get auth_email_verify_title => 'Check your email';

  @override
  String get auth_email_verify_desc =>
      'A verification link has been sent\nto your email address.';

  @override
  String get auth_email_verified => 'I\'ve verified';

  @override
  String get auth_email_not_received => 'Didn\'t receive anything? ';

  @override
  String get auth_otp_subtitle => 'Enter the code sent by SMS';

  @override
  String get auth_otp_not_received => 'Code not received? ';

  @override
  String get auth_forgot_password_title => 'Forgot password';

  @override
  String get auth_reset_subtitle => 'Enter your number to reset';

  @override
  String get auth_reset_sms_info => 'A reset code will be sent via SMS.';

  @override
  String get auth_sms_info => 'You will receive an SMS to confirm your number.';

  @override
  String get auth_new_password_title => 'New password';

  @override
  String get auth_new_password_subtitle => 'Choose a secure password';

  @override
  String get auth_new_password_hint => 'New password';

  @override
  String get auth_register_subtitle => 'Enter your phone number';

  @override
  String get role_title => 'What do you want to do?';

  @override
  String get role_question => 'Who are you?';

  @override
  String get role_subtitle => 'Choose your main profile';

  @override
  String get seller_type_title => 'Selling mode';

  @override
  String get seller_type_subtitle => 'Choose how to sell your products';

  @override
  String get profile_setup_title => 'Your profile';

  @override
  String get profile_setup_subtitle => 'One last step';

  @override
  String get profile_name_required => 'Name required';

  @override
  String get profile_bio_hint => 'Bio (optional)';

  @override
  String get profile_share_location => 'Share my location';

  @override
  String get kyc_subtitle => 'Take a photo of yourself and your ID';

  @override
  String get kyc_verified => 'Identity verified';

  @override
  String get kyc_redirecting => 'Redirecting...';

  @override
  String get kyc_verifying => 'Verifying...';

  @override
  String get kyc_analyzing => 'Photo analysis and image\nquality detection';

  @override
  String get kyc_take_photo => 'Take a photo';

  @override
  String get kyc_step_selfie_title => 'Verification selfie';

  @override
  String get kyc_step_id_front_title => 'ID card — Front';

  @override
  String get kyc_step_id_back_title => 'ID card — Back';

  @override
  String get kyc_step_selfie_desc =>
      'Place your face in the frame\nand make sure the lighting is good';

  @override
  String get kyc_step_id_front_desc =>
      'Take a photo of the front of your\npassport, national ID or driver\'s license';

  @override
  String get kyc_step_id_back_desc =>
      'Flip the card and take\na photo of the back';

  @override
  String get kyc_verify_identity => 'Verify my identity';

  @override
  String get kyc_step_selfie_short => 'Selfie';

  @override
  String get kyc_step_front_short => 'Front';

  @override
  String get kyc_step_back_short => 'Back';

  @override
  String get kyc_step_selfie_label => 'Selfie';

  @override
  String get kyc_step_id_front_label => 'ID Front';

  @override
  String get kyc_step_id_back_label => 'ID Back';

  @override
  String get seller_type_badge_recommended => 'Recommended';

  @override
  String get seller_type_feature_no_shop => 'No shop to manage';

  @override
  String get seller_type_feature_whatsapp => 'Share via WhatsApp link';

  @override
  String get seller_type_feature_orders => 'Orders by message';

  @override
  String get seller_type_feature_beginner => 'Ideal to start';

  @override
  String get seller_type_feature_catalog => 'Full catalog';

  @override
  String get seller_type_feature_stock => 'Stock management';

  @override
  String get seller_type_feature_variants => 'Product variants';

  @override
  String get seller_type_feature_analytics => 'Advanced analytics';

  @override
  String get seller_type_feature_quick => 'Publish in 30s';

  @override
  String get seller_type_feature_photos => 'Photos + description';

  @override
  String get seller_type_feature_price => 'Suggested price';

  @override
  String get seller_type_feature_wardrobe => 'Perfect for decluttering';

  @override
  String get onboarding_slide_1_title => 'Shop locally';

  @override
  String get onboarding_slide_1_desc =>
      'Order from local merchants\nand support the Gabonese economy.';

  @override
  String get onboarding_slide_2_title => 'Sell easily';

  @override
  String get onboarding_slide_2_desc =>
      'Create your online store in 2 minutes.\nNo stock? No problem.';

  @override
  String get onboarding_slide_3_title => 'Fast delivery';

  @override
  String get onboarding_slide_3_desc =>
      'Track your order in real time.\nDelivered in 2 hours to your door.';

  @override
  String get welcome_subtitle => 'THE GABONESE MARKET';

  @override
  String get welcome_tagline => 'Buy and sell easily\nin Gabon';

  @override
  String get auth_send => 'Send';

  @override
  String get role_buy => 'Buy';

  @override
  String get role_buy_desc => 'Browse and buy products';

  @override
  String get role_sell => 'Sell';

  @override
  String get role_sell_desc => 'List your products';

  @override
  String get role_sell_whatsapp => 'Via WhatsApp';

  @override
  String get role_sell_shop => 'Open a shop';

  @override
  String get role_sell_rapid => 'Quick sell';

  @override
  String get role_deliver => 'Deliver';

  @override
  String get role_deliver_desc => 'Earn money delivering';

  @override
  String get role_sell_type_title => 'Choose your seller mode';

  @override
  String get role_sell_type_whatsapp => 'WhatsApp Mode';

  @override
  String get role_sell_type_whatsapp_desc =>
      'Share links via WhatsApp, no shop needed';

  @override
  String get role_sell_type_boutique => 'Boutique';

  @override
  String get role_sell_type_boutique_desc => 'Full storefront with catalog';

  @override
  String get role_sell_type_rapid => 'Quick Sell';

  @override
  String get role_sell_type_rapid_desc => 'Sell in 2 minutes with a photo';

  @override
  String get kyc_title => 'Identity verification';

  @override
  String get kyc_selfie => 'Take a selfie';

  @override
  String get kyc_id_front => 'ID card (front)';

  @override
  String get kyc_id_back => 'ID card (back)';

  @override
  String get kyc_submit => 'Submit for verification';

  @override
  String get kyc_pending => 'Pending verification';

  @override
  String get kyc_approved => 'Approved';

  @override
  String get kyc_rejected => 'Rejected';

  @override
  String get product_add_to_cart => 'Add to cart';

  @override
  String get product_buy_now => 'Buy now';

  @override
  String get product_negotiate => 'Negotiate price';

  @override
  String get product_call => 'Call';

  @override
  String get product_whatsapp => 'WhatsApp';

  @override
  String get product_verified => 'Verified';

  @override
  String get product_nearby => 'Near you';

  @override
  String get product_free_delivery => 'Free delivery';

  @override
  String get product_in_stock => 'In stock';

  @override
  String get product_out_of_stock => 'Out of stock';

  @override
  String get product_condition => 'Condition';

  @override
  String get product_condition_new => 'New';

  @override
  String get product_condition_very_good => 'Very good';

  @override
  String get product_condition_good => 'Good';

  @override
  String get product_condition_renovate => 'To renovate';

  @override
  String get product_reviews => 'reviews';

  @override
  String get product_seller => 'Seller';

  @override
  String get product_description => 'Description';

  @override
  String get product_favorite_add => 'Add to favorites';

  @override
  String get product_favorite_remove => 'Remove from favorites';

  @override
  String get category_title => 'Categories';

  @override
  String category_products_title(Object category) {
    return 'Products in $category';
  }

  @override
  String get search_title => 'Search';

  @override
  String get search_hint => 'Search products...';

  @override
  String get search_no_results => 'No results found';

  @override
  String get search_no_results_desc => 'Try a different search term';

  @override
  String get seller_profile_title => 'Seller profile';

  @override
  String get seller_profile_products => 'Products';

  @override
  String get seller_profile_reviews => 'Reviews';

  @override
  String get reviews_title => 'Reviews';

  @override
  String get reviews_empty => 'No reviews yet';

  @override
  String get reviews_empty_desc => 'Be the first to leave a review';

  @override
  String get cart_title => 'My cart';

  @override
  String get cart_empty => 'Your cart is empty';

  @override
  String get cart_empty_desc => 'Add products to get started';

  @override
  String get cart_total => 'Total';

  @override
  String get cart_checkout => 'Checkout';

  @override
  String get cart_clear => 'Clear cart';

  @override
  String get cart_item_edit_title => 'Edit item';

  @override
  String get cart_item_quantity => 'Quantity';

  @override
  String get cart_item_note => 'Note for seller';

  @override
  String get cart_item_variant => 'Variant';

  @override
  String get checkout_title => 'Checkout';

  @override
  String get checkout_address => 'Delivery address';

  @override
  String get checkout_address_hint => 'Neighborhood + landmark';

  @override
  String get checkout_use_gps => 'Use my location';

  @override
  String get checkout_delivery_mode => 'Delivery mode';

  @override
  String get checkout_standard => 'Standard (2-3 days)';

  @override
  String get checkout_express => 'Express (24h)';

  @override
  String get checkout_pickup => 'Pickup from seller';

  @override
  String get checkout_payment => 'Payment';

  @override
  String get checkout_orange_money => 'Orange Money';

  @override
  String get checkout_mtn_momo => 'MTN Mobile Money';

  @override
  String get checkout_airtel_money => 'Airtel Money';

  @override
  String get checkout_cash => 'Cash on delivery';

  @override
  String get checkout_card => 'Bank card';

  @override
  String get checkout_summary => 'Summary';

  @override
  String checkout_pay(Object amount) {
    return 'Pay $amount';
  }

  @override
  String get checkout_success => 'Order confirmed!';

  @override
  String get checkout_success_desc =>
      'You will receive a notification when your package is shipped.';

  @override
  String get checkout_failed => 'Payment failed';

  @override
  String get checkout_failed_desc => 'Please try again with another method.';

  @override
  String get checkout_processing_title => 'Processing payment';

  @override
  String get checkout_processing_desc =>
      'Please wait while we confirm your payment...';

  @override
  String get checkout_review_title => 'Review your order';

  @override
  String get checkout_review_items => 'Items';

  @override
  String get checkout_review_delivery => 'Delivery';

  @override
  String get checkout_review_payment => 'Payment method';

  @override
  String get checkout_review_place => 'Place order';

  @override
  String get checkout_negotiate_title => 'Negotiate price';

  @override
  String get checkout_negotiate_your_price => 'Your proposed price';

  @override
  String get checkout_negotiate_message => 'Message to seller';

  @override
  String get order_status_pending => 'Pending';

  @override
  String get order_status_confirmed => 'Confirmed';

  @override
  String get order_status_preparing => 'Preparing';

  @override
  String get order_status_ready => 'Ready';

  @override
  String get order_status_assigned => 'Delivery assigned';

  @override
  String get order_status_in_transit => 'In transit';

  @override
  String get order_status_delivered => 'Delivered';

  @override
  String get order_status_cancelled => 'Cancelled';

  @override
  String get order_track => 'Track my order';

  @override
  String get order_details => 'Order details';

  @override
  String get order_number => 'Order number';

  @override
  String get order_date => 'Order date';

  @override
  String get order_total => 'Total';

  @override
  String get order_status => 'Status';

  @override
  String get order_tracking_title => 'Order tracking';

  @override
  String get order_tracking_map => 'Follow your delivery on the map';

  @override
  String get order_rate_title => 'Rate your order';

  @override
  String get order_rate_seller => 'Rate the seller';

  @override
  String get order_rate_delivery => 'Rate the delivery';

  @override
  String get order_rate_comment => 'Add a comment';

  @override
  String get order_dispute_title => 'Open a dispute';

  @override
  String get order_dispute_reason => 'Reason';

  @override
  String get order_dispute_evidence => 'Upload evidence';

  @override
  String get order_dispute_submit => 'Submit dispute';

  @override
  String get order_favorites_title => 'My favorites';

  @override
  String get order_favorites_empty => 'No favorites yet';

  @override
  String get seller_dashboard => 'Dashboard';

  @override
  String get seller_products => 'My products';

  @override
  String get seller_orders => 'Orders';

  @override
  String get seller_wallet => 'Wallet';

  @override
  String get seller_add_product => 'Add product';

  @override
  String get seller_sales_today => 'Today\'s sales';

  @override
  String get seller_sales_week => 'This week';

  @override
  String get seller_sales_month => 'This month';

  @override
  String get seller_stock_alert => 'Stock alert';

  @override
  String get seller_member_since => 'Member since';

  @override
  String get seller_whatsapp_title => 'WhatsApp selling';

  @override
  String get seller_whatsapp_new => 'New product link';

  @override
  String get seller_whatsapp_share => 'Share on WhatsApp';

  @override
  String get seller_whatsapp_copy_link => 'Copy link';

  @override
  String get seller_whatsapp_views => 'Views';

  @override
  String get seller_whatsapp_connected => 'WhatsApp connected';

  @override
  String get seller_whatsapp_desc =>
      'Share your catalog and manage orders from WhatsApp';

  @override
  String get seller_whatsapp_orders_new => 'New orders';

  @override
  String get seller_whatsapp_messages => 'Messages received';

  @override
  String get seller_whatsapp_catalog => 'Catalog';

  @override
  String get seller_whatsapp_share_catalog => 'Share my WhatsApp catalog';

  @override
  String get seller_whatsapp_stats => 'View stats';

  @override
  String get seller_whatsapp_product_create => 'New WhatsApp product';

  @override
  String get seller_whatsapp_product_edit => 'Edit product';

  @override
  String get seller_whatsapp_product_detail => 'Product detail';

  @override
  String get seller_whatsapp_photos => 'Photos (1-5)';

  @override
  String get seller_whatsapp_name => 'Product name';

  @override
  String get seller_whatsapp_name_required => 'Name required';

  @override
  String get seller_whatsapp_price_required => 'Price required';

  @override
  String get seller_whatsapp_created => 'Product created successfully!';

  @override
  String get seller_whatsapp_updated => 'Product updated';

  @override
  String get seller_whatsapp_delete_confirm => 'Delete this product?';

  @override
  String get seller_whatsapp_delete_irreversible =>
      'This action is irreversible.';

  @override
  String get seller_whatsapp_published => 'Published';

  @override
  String get seller_whatsapp_visible => 'Visible in your catalog';

  @override
  String get seller_whatsapp_qr_code => 'View QR code';

  @override
  String get seller_whatsapp_orders_title => 'WhatsApp orders';

  @override
  String get seller_whatsapp_order_detail => 'Order detail';

  @override
  String get seller_whatsapp_order_confirm => 'Confirm order';

  @override
  String get seller_whatsapp_contact_whatsapp => 'Contact on WhatsApp';

  @override
  String get seller_whatsapp_mark_delivered => 'Mark as delivered';

  @override
  String get seller_whatsapp_cancel_order => 'Cancel order';

  @override
  String get seller_whatsapp_stats_title => 'Statistics';

  @override
  String get seller_whatsapp_period_7d => '7 days';

  @override
  String get seller_whatsapp_period_30d => '30 days';

  @override
  String get seller_whatsapp_period_90d => '90 days';

  @override
  String get seller_whatsapp_clicks => 'Clicks';

  @override
  String get seller_whatsapp_orders_count => 'Orders';

  @override
  String get seller_whatsapp_sales => 'Sales';

  @override
  String get seller_whatsapp_conversion_rate => 'Conversion rate';

  @override
  String get seller_whatsapp_top_products => 'Most viewed products';

  @override
  String get seller_rapid_publish => 'Publish quickly';

  @override
  String get seller_rapid_photo => 'Photo';

  @override
  String get seller_rapid_price => 'Price';

  @override
  String get seller_rapid_category => 'Category';

  @override
  String get seller_rapid_condition => 'Condition';

  @override
  String get seller_rapid_published => 'Published!';

  @override
  String get seller_rapid_title => 'Quick sell';

  @override
  String get seller_rapid_desc =>
      'Take a photo, describe your product, and publish instantly.';

  @override
  String get seller_rapid_post_ad => 'Post an ad';

  @override
  String get seller_rapid_active_ads => 'Active ads';

  @override
  String get seller_rapid_total_views => 'Total views';

  @override
  String get seller_rapid_messages => 'Messages';

  @override
  String get seller_rapid_explore_feed => 'Explore feed';

  @override
  String get seller_rapid_feed_title => 'Quick feed';

  @override
  String get seller_rapid_feed_search => 'Search the feed...';

  @override
  String get seller_rapid_filter_all => 'All';

  @override
  String get seller_rapid_filter_fashion => 'Fashion';

  @override
  String get seller_rapid_filter_tech => 'Tech';

  @override
  String get seller_rapid_filter_home => 'Home';

  @override
  String get seller_rapid_filter_services => 'Services';

  @override
  String get seller_rapid_filter_food => 'Food';

  @override
  String get seller_rapid_ad_title => 'Ad title';

  @override
  String get seller_rapid_ad_title_required => 'Title required';

  @override
  String get seller_rapid_price_required => 'Price required';

  @override
  String get seller_rapid_description => 'Description';

  @override
  String get seller_rapid_category_select => 'Category';

  @override
  String get seller_rapid_condition_normal => 'Normal use';

  @override
  String get seller_rapid_promotions_title => 'Promotions';

  @override
  String get seller_rapid_promotions_boost => 'Boost your listings';

  @override
  String get seller_rapid_promotions_boost_desc =>
      'Boosted listings get up to 5x more views.';

  @override
  String get seller_rapid_promotions_featured => 'Featured';

  @override
  String seller_rapid_promotions_featured_7d(Object price) {
    return '7 days - $price';
  }

  @override
  String seller_rapid_promotions_featured_30d(Object price) {
    return '30 days - $price';
  }

  @override
  String get seller_rapid_promotions_urgent => 'Urgent badge';

  @override
  String seller_rapid_promotions_urgent_desc(Object price) {
    return 'Until sold - $price';
  }

  @override
  String get seller_rapid_promotions_new => 'New badge';

  @override
  String seller_rapid_promotions_new_desc(Object price) {
    return '7 days - $price';
  }

  @override
  String get seller_rapid_promotions_pack => 'Visibility+ pack';

  @override
  String seller_rapid_promotions_pack_desc(Object price) {
    return '30 days - $price';
  }

  @override
  String get seller_rapid_promotions_active => 'Active';

  @override
  String get seller_rapid_promotions_activate => 'Activate this promotion';

  @override
  String get seller_rapid_flash_title => 'Flash sales';

  @override
  String get seller_rapid_flash_create => 'Create';

  @override
  String get seller_rapid_flash_ongoing => 'Active';

  @override
  String get seller_rapid_flash_upcoming => 'Upcoming';

  @override
  String get seller_rapid_flash_ended => 'Ended';

  @override
  String get seller_rapid_flash_new => 'New flash sale';

  @override
  String get seller_rapid_flash_name => 'Name';

  @override
  String get seller_rapid_flash_discount => 'Discount (%)';

  @override
  String get seller_rapid_flash_duration => 'Duration (hours)';

  @override
  String get seller_rapid_flash_schedule => 'Schedule';

  @override
  String get seller_rapid_messages_title => 'Messages';

  @override
  String get seller_rapid_analytics_title => 'Analytics';

  @override
  String get seller_rapid_analytics_ads => 'Ads';

  @override
  String get seller_rapid_analytics_contacts => 'Contacts';

  @override
  String get seller_rapid_analytics_views_per_ad => 'Views/ad';

  @override
  String get seller_rapid_analytics_perf_title => 'Performance per ad';

  @override
  String get seller_rapid_analytics_tips_title => 'Tips';

  @override
  String get seller_rapid_analytics_tip_photos =>
      'Add quality photos for more views';

  @override
  String get seller_rapid_analytics_tip_reply =>
      'Reply quickly to messages for more sales';

  @override
  String get seller_rapid_analytics_tip_boost =>
      'Use promotions to boost your listings';

  @override
  String get seller_rapid_product_detail_title => 'Ad';

  @override
  String get seller_rapid_product_detail_featured => 'Featured';

  @override
  String seller_rapid_product_detail_member_since(Object date) {
    return 'Member since $date';
  }

  @override
  String get seller_rapid_product_detail_views => 'views';

  @override
  String get seller_rapid_product_detail_favs => 'favorites';

  @override
  String get seller_rapid_product_detail_messages_count => 'messages';

  @override
  String get seller_rapid_product_detail_contact => 'Contact';

  @override
  String get seller_rapid_period_7d => '7 days';

  @override
  String get seller_rapid_period_30d => '30 days';

  @override
  String get seller_rapid_period_90d => '90 days';

  @override
  String get boutique_title => 'My boutique';

  @override
  String get boutique_overview => 'Overview';

  @override
  String get boutique_products => 'Products';

  @override
  String get boutique_commands => 'Orders';

  @override
  String get boutique_sales => 'Sales';

  @override
  String get boutique_rating => 'Average rating';

  @override
  String get boutique_actions => 'Actions';

  @override
  String get boutique_add_product => 'Add\nproduct';

  @override
  String get boutique_manage_stock => 'Manage\nstock';

  @override
  String get boutique_view_reviews => 'View\nreviews';

  @override
  String get boutique_recent_products => 'Recent products';

  @override
  String get boutique_manage => 'Manage';

  @override
  String get boutique_out_of_stock => 'Out of stock';

  @override
  String get boutique_performance => 'Performance';

  @override
  String get boutique_views_this_week => 'Views this week';

  @override
  String get boutique_conversion_rate => 'Conversion rate';

  @override
  String get boutique_response_time => 'Response time';

  @override
  String get boutique_analytics_title => 'Analytics';

  @override
  String get boutique_analytics_revenue => 'Revenue';

  @override
  String boutique_analytics_vs_previous(Object percent) {
    return '+$percent% vs previous period';
  }

  @override
  String get boutique_analytics_orders => 'Orders';

  @override
  String get boutique_analytics_views => 'Views';

  @override
  String get boutique_analytics_conversion => 'Conv. rate';

  @override
  String get boutique_analytics_avg_cart => 'Avg. cart';

  @override
  String get boutique_analytics_popular => 'Popular products';

  @override
  String get boutique_analytics_sales => 'sales';

  @override
  String get boutique_period_7d => '7 days';

  @override
  String get boutique_period_30d => '30 days';

  @override
  String get boutique_period_90d => '90 days';

  @override
  String get boutique_period_1y => '1 year';

  @override
  String get boutique_catalog_title => 'Catalog';

  @override
  String get boutique_catalog_search => 'Search product...';

  @override
  String get boutique_catalog_all => 'All';

  @override
  String get boutique_catalog_active => 'Active';

  @override
  String get boutique_catalog_out_of_stock => 'Out of stock';

  @override
  String get boutique_catalog_draft => 'Draft';

  @override
  String get boutique_catalog_sort_name_az => 'Name (A-Z)';

  @override
  String get boutique_catalog_sort_price_asc => 'Price (low to high)';

  @override
  String get boutique_catalog_sort_price_desc => 'Price (high to low)';

  @override
  String get boutique_catalog_sort_stock => 'Stock (low → high)';

  @override
  String get boutique_catalog_sort_recent => 'Most recent';

  @override
  String get boutique_inventory_title => 'Stock';

  @override
  String get boutique_inventory_total => 'Total';

  @override
  String get boutique_inventory_low => 'Low stock';

  @override
  String get boutique_inventory_rupture => 'Out of stock';

  @override
  String get boutique_inventory_excess => 'Overstock';

  @override
  String get boutique_inventory_adjust => 'Adjust stock';

  @override
  String get boutique_inventory_new_stock => 'New stock';

  @override
  String get boutique_inventory_quantity => 'Quantity';

  @override
  String get boutique_inventory_confirm => 'Ok';

  @override
  String get boutique_orders_title => 'Boutique orders';

  @override
  String get boutique_orders_ongoing => 'Ongoing';

  @override
  String get boutique_orders_shipped => 'Shipped';

  @override
  String get boutique_orders_delivered => 'Delivered';

  @override
  String get boutique_orders_cancelled => 'Cancelled';

  @override
  String get boutique_order_detail_title => 'Order detail';

  @override
  String get boutique_order_detail_placed => 'Order placed';

  @override
  String get boutique_order_detail_paid => 'Payment confirmed';

  @override
  String get boutique_order_detail_preparing => 'Preparing';

  @override
  String get boutique_order_detail_in_transit => 'In transit';

  @override
  String get boutique_order_detail_items => 'Items';

  @override
  String get boutique_order_detail_total => 'Total';

  @override
  String get boutique_order_detail_payment => 'Payment';

  @override
  String get boutique_order_detail_paid_status => 'Paid';

  @override
  String get boutique_order_detail_tracking => 'Tracking';

  @override
  String get boutique_order_detail_confirm => 'Confirm';

  @override
  String get boutique_order_detail_ship => 'Ship';

  @override
  String get boutique_order_detail_cancel_order => 'Cancel order';

  @override
  String get boutique_product_create_title => 'New product';

  @override
  String get boutique_product_create_publish => 'Publish';

  @override
  String get boutique_product_create_photos => 'Photos';

  @override
  String get boutique_product_create_name => 'Product name';

  @override
  String get boutique_product_create_name_required => 'Required';

  @override
  String get boutique_product_create_price => 'Price (FCFA)';

  @override
  String get boutique_product_create_sku => 'SKU';

  @override
  String get boutique_product_create_stock => 'Stock';

  @override
  String get boutique_product_create_weight => 'Weight (kg)';

  @override
  String get boutique_product_create_description => 'Description';

  @override
  String get boutique_product_create_variants => 'This product has variants';

  @override
  String get boutique_product_create_variants_hint => 'Size, color, etc.';

  @override
  String get boutique_product_create_variants_add => 'Add';

  @override
  String get boutique_product_create_variants_stock => 'Stock:';

  @override
  String get boutique_product_create_category => 'Category';

  @override
  String get boutique_product_create_cat_fashion => 'Fashion';

  @override
  String get boutique_product_create_cat_electronics => 'Electronics';

  @override
  String get boutique_product_create_cat_home => 'Home';

  @override
  String get boutique_product_create_cat_beauty => 'Beauty';

  @override
  String get boutique_product_create_cat_food => 'Food';

  @override
  String get boutique_product_create_cat_sports => 'Sports';

  @override
  String get boutique_product_edit_title => 'Edit product';

  @override
  String get boutique_product_edit_save => 'Save';

  @override
  String get boutique_product_edit_active => 'Product active';

  @override
  String get boutique_product_edit_visible => 'Visible in shop';

  @override
  String get boutique_product_edit_hidden => 'Hidden';

  @override
  String get boutique_product_edit_delete => 'Delete this product';

  @override
  String get boutique_product_edit_delete_confirm => 'Delete this product?';

  @override
  String get boutique_product_edit_delete_irreversible =>
      'This action is irreversible.';

  @override
  String get boutique_wallet_title => 'Wallet';

  @override
  String get boutique_wallet_balance => 'Available balance';

  @override
  String boutique_wallet_vs_last_month(Object percent) {
    return '+$percent% vs last month';
  }

  @override
  String get boutique_wallet_withdraw => 'Withdrawal';

  @override
  String get boutique_wallet_orange_money => 'Orange Money';

  @override
  String get boutique_wallet_bank => 'Bank account';

  @override
  String get boutique_wallet_make_withdrawal => 'Make a withdrawal';

  @override
  String get boutique_wallet_recent => 'Recent transactions';

  @override
  String get boutique_wallet_sale => 'Product sale';

  @override
  String get boutique_wallet_withdrawal_om => 'OM withdrawal';

  @override
  String get boutique_wallet_withdrawal_bank => 'Bank withdrawal';

  @override
  String get boutique_wallet_amount => 'Amount (FCFA)';

  @override
  String get boutique_wallet_method => 'Method';

  @override
  String get boutique_wallet_confirm_withdrawal => 'Confirm withdrawal';

  @override
  String get boutique_settings_title => 'Boutique settings';

  @override
  String get boutique_settings_save => 'Save';

  @override
  String get boutique_settings_banner => 'Banner';

  @override
  String get boutique_settings_add_banner => 'Add a banner';

  @override
  String get boutique_settings_name => 'Shop name';

  @override
  String get boutique_settings_description => 'Description';

  @override
  String get boutique_settings_phone => 'Phone';

  @override
  String get boutique_settings_email => 'Email';

  @override
  String get boutique_settings_address => 'Address';

  @override
  String get boutique_settings_hours => 'Opening hours';

  @override
  String get boutique_settings_opening => 'Opening';

  @override
  String get boutique_settings_closing => 'Closing';

  @override
  String get boutique_settings_delivery_zones => 'Delivery zone';

  @override
  String get delivery_online => 'Online';

  @override
  String get delivery_offline => 'Offline';

  @override
  String get delivery_earnings_today => 'Today\'s earnings';

  @override
  String get delivery_earnings_week => 'This week';

  @override
  String get delivery_new_order => 'New delivery!';

  @override
  String get delivery_accept => 'Accept';

  @override
  String get delivery_pickup => 'Pick up package';

  @override
  String get delivery_delivered => 'Delivered';

  @override
  String get delivery_proof_photo => 'Proof photo';

  @override
  String get delivery_scan_qr => 'Scan code';

  @override
  String get delivery_available => 'Available for deliveries';

  @override
  String get delivery_fcfc_earned => 'FCFA earned';

  @override
  String get delivery_deliveries => 'Deliveries';

  @override
  String get delivery_km_traveled => 'Traveled';

  @override
  String get delivery_new_request => 'New request';

  @override
  String get delivery_ongoing => 'In progress';

  @override
  String get delivery_history => 'History';

  @override
  String get delivery_refuse => 'Refuse';

  @override
  String get delivery_earnings_title => 'Earnings';

  @override
  String get delivery_earnings_total => 'Total earnings';

  @override
  String delivery_earnings_vs_yesterday(Object percent) {
    return '+$percent% vs yesterday';
  }

  @override
  String get delivery_earnings_evolution => 'Evolution';

  @override
  String get delivery_earnings_distance => 'Distance';

  @override
  String get delivery_earnings_rating => 'Rating';

  @override
  String get delivery_earnings_deliveries_count => 'Deliveries';

  @override
  String get delivery_earnings_transactions => 'Transactions';

  @override
  String get delivery_earnings_withdrawal => 'Withdrawal';

  @override
  String get delivery_wallet_title => 'Wallet';

  @override
  String get delivery_wallet_balance => 'Available balance';

  @override
  String get delivery_wallet_secure => 'Secure • Instant withdrawal';

  @override
  String get delivery_wallet_withdraw_now => 'Withdraw now';

  @override
  String get delivery_wallet_methods => 'Withdrawal methods';

  @override
  String get delivery_wallet_add_method => 'Add withdrawal method';

  @override
  String get delivery_wallet_history => 'Withdrawal history';

  @override
  String get delivery_wallet_completed => 'Completed';

  @override
  String get delivery_wallet_instant => 'Instant withdrawal';

  @override
  String get delivery_wallet_amount => 'Amount (FCFA)';

  @override
  String get delivery_wallet_to => 'To';

  @override
  String get delivery_wallet_confirm => 'Confirm withdrawal';

  @override
  String get delivery_profile_title => 'Delivery profile';

  @override
  String get delivery_profile_level_gold => 'Gold';

  @override
  String get delivery_profile_deliveries => 'Deliveries';

  @override
  String get delivery_profile_rating => 'Rating';

  @override
  String get delivery_profile_success_rate => 'Success rate';

  @override
  String get delivery_profile_vehicle => 'Vehicle';

  @override
  String get delivery_profile_edit => 'Edit';

  @override
  String get delivery_profile_documents => 'Documents';

  @override
  String get delivery_profile_id_card => 'ID card';

  @override
  String get delivery_profile_license => 'Driver\'s license';

  @override
  String get delivery_profile_registration => 'Registration';

  @override
  String get delivery_profile_insurance => 'Insurance';

  @override
  String get delivery_profile_validated => 'Validated';

  @override
  String get delivery_profile_pending => 'Pending';

  @override
  String get delivery_zone_title => 'Work zone';

  @override
  String get delivery_zone_save => 'Save';

  @override
  String get delivery_zone_available => 'Available zones';

  @override
  String delivery_zone_radius(Object km) {
    return 'Radius $km km';
  }

  @override
  String get delivery_request_title => 'New delivery';

  @override
  String delivery_request_expires(Object seconds) {
    return 'Offer expires in ${seconds}s';
  }

  @override
  String get delivery_request_amount => 'Delivery fee';

  @override
  String get delivery_request_pickup => 'Pickup';

  @override
  String get delivery_request_dropoff => 'Drop-off';

  @override
  String get delivery_request_distance => 'Distance';

  @override
  String get delivery_request_ignore => 'Ignore';

  @override
  String delivery_request_accept(Object amount) {
    return 'Accept - $amount';
  }

  @override
  String get delivery_navigation_title => 'Delivery navigation';

  @override
  String get delivery_navigation_map => 'Google Maps';

  @override
  String delivery_navigation_route(Object from, Object to) {
    return 'Route: $from to $to';
  }

  @override
  String get delivery_navigation_pickup => 'Pickup';

  @override
  String get delivery_navigation_delivery => 'Delivery';

  @override
  String get delivery_navigation_finalize => 'Finalize';

  @override
  String get delivery_navigation_scan_pickup => 'Scan QR - Pickup';

  @override
  String get delivery_pickup_title => 'Package pickup';

  @override
  String get delivery_pickup_desc =>
      'Scan the seller\'s QR code to confirm pickup.';

  @override
  String get delivery_pickup_scan => 'Tap to scan';

  @override
  String get delivery_pickup_or => 'Or enter code';

  @override
  String get delivery_pickup_code_hint => 'Ex: OKB-2024-001';

  @override
  String get delivery_pickup_photo => 'Package photo';

  @override
  String get delivery_pickup_add_photo => 'Add a photo';

  @override
  String get delivery_pickup_confirm => 'Confirm pickup';

  @override
  String get delivery_dropoff_title => 'Delivery complete';

  @override
  String get delivery_dropoff_success => 'Package delivered successfully!';

  @override
  String delivery_dropoff_earned(Object amount) {
    return '$amount FCFA added to your balance';
  }

  @override
  String get delivery_dropoff_scan_client => 'Scan client QR code';

  @override
  String get delivery_dropoff_photo => 'Proof photo';

  @override
  String get delivery_dropoff_add_photo => 'Add a photo';

  @override
  String get delivery_dropoff_signature => 'Client signature';

  @override
  String get delivery_dropoff_signature_placeholder =>
      'Signature area (to integrate)';

  @override
  String get delivery_dropoff_finalize => 'Finalize delivery';

  @override
  String get wallet_balance => 'My balance';

  @override
  String get wallet_pending => 'Pending';

  @override
  String get wallet_withdraw => 'Withdraw';

  @override
  String get wallet_history => 'History';

  @override
  String get wallet_withdraw_to => 'Withdraw to';

  @override
  String get wallet_principal => 'Principal';

  @override
  String get chat_title => 'Chat';

  @override
  String get chat_placeholder => 'Write a message...';

  @override
  String get chat_negotiate => 'Negotiate';

  @override
  String get chat_offer => 'Make an offer';

  @override
  String get chat_accept => 'Accept';

  @override
  String get chat_refuse => 'Decline';

  @override
  String get chat_counter => 'Counter-offer';

  @override
  String chat_offer_price(Object price) {
    return 'Proposed price: $price';
  }

  @override
  String get chat_offer_original_price => 'Original price:';

  @override
  String get chat_offer_proposal => 'Proposal';

  @override
  String get chat_offer_waiting => 'Waiting for response';

  @override
  String get chat_offer_accepted => 'Offer accepted';

  @override
  String get chat_offer_refused => 'Offer declined';

  @override
  String get chat_offer_new_proposal => 'New proposal received';

  @override
  String get chat_support_title => 'Okiba Support';

  @override
  String get chat_support_online => 'Online';

  @override
  String chat_support_ticket(Object ticket) {
    return 'Ticket #$ticket';
  }

  @override
  String get chat_support_processing => 'Processing';

  @override
  String get chat_support_open => 'Open';

  @override
  String get chat_support_greeting => 'Hello, how can I help you?';

  @override
  String get chat_support_quick_reply_late => 'Late delivery';

  @override
  String get chat_support_quick_reply_defective => 'Defective product';

  @override
  String get chat_support_quick_reply_payment => 'Payment issue';

  @override
  String get chat_support_quick_reply_cancel => 'Cancel order';

  @override
  String get chat_support_quick_reply_other => 'Other';

  @override
  String get chat_support_input_placeholder => 'Write your message...';

  @override
  String get chat_support_view_ticket => 'View ticket';

  @override
  String get chat_support_attach_photo => 'Attach photo';

  @override
  String get chat_support_close_ticket => 'Close ticket';

  @override
  String get review_title => 'Review';

  @override
  String get review_rating => 'Rating';

  @override
  String get review_comment => 'Comment';

  @override
  String get review_photo => 'Add photo';

  @override
  String get review_submit => 'Submit';

  @override
  String get notifications_title => 'Notifications';

  @override
  String get notifications_empty => 'No notifications';

  @override
  String get notifications_mark_all_read => 'Mark all read';

  @override
  String get notifications_today => 'Today';

  @override
  String get notifications_yesterday => 'Yesterday';

  @override
  String get notifications_this_week => 'This week';

  @override
  String get notifications_earlier => 'Earlier';

  @override
  String get notifications_detail_title => 'Notification';

  @override
  String get notifications_detail_details => 'Details';

  @override
  String get notifications_detail_order => 'Order';

  @override
  String get notifications_detail_number => 'Number';

  @override
  String get notifications_detail_status => 'Status';

  @override
  String get notifications_detail_total => 'Total';

  @override
  String get notifications_detail_seller => 'Seller';

  @override
  String get notifications_detail_view_order => 'View order';

  @override
  String get notifications_type_order_confirmed => 'Order confirmed';

  @override
  String get notifications_type_delivery_in_progress => 'Delivery in progress';

  @override
  String get notifications_type_new_message => 'New message';

  @override
  String get notifications_type_payment_received => 'Payment received';

  @override
  String get notifications_type_new_review => 'New review';

  @override
  String get notifications_type_promotion => 'Promotion';

  @override
  String get notifications_type_low_stock => 'Low stock alert';

  @override
  String get notifications_type_welcome => 'Welcome to Okiba!';

  @override
  String get profile_title => 'My profile';

  @override
  String get profile_edit => 'Edit';

  @override
  String get profile_orders => 'My orders';

  @override
  String get profile_favorites => 'Favorites';

  @override
  String get profile_payment => 'Payment methods';

  @override
  String get profile_addresses => 'My addresses';

  @override
  String get profile_settings => 'Settings';

  @override
  String get profile_help => 'Help';

  @override
  String get profile_logout => 'Logout';

  @override
  String get profile_role_client => 'Client';

  @override
  String get profile_role_seller => 'Seller';

  @override
  String get profile_role_delivery => 'Delivery';

  @override
  String profile_logged_in_as(Object role) {
    return 'You are logged in as $role';
  }

  @override
  String get profile_notifications => 'Notifications';

  @override
  String get profile_language => 'Language';

  @override
  String get profile_low_data_mode => 'Low data mode';

  @override
  String get profile_privacy_security => 'Security';

  @override
  String get profile_social => 'Social';

  @override
  String get profile_referral => 'Referral';

  @override
  String profile_referral_earn(Object amount) {
    return 'Earn $amount per friend';
  }

  @override
  String get profile_support => 'Support';

  @override
  String get profile_about => 'About';

  @override
  String profile_version(Object version) {
    return 'Version $version';
  }

  @override
  String get profile_account => 'Account';

  @override
  String get profile_delete_account => 'Delete my account';

  @override
  String get profile_logout_action => 'Sign out';

  @override
  String get profile_edit_title => 'Edit profile';

  @override
  String get profile_edit_name => 'Full name';

  @override
  String get profile_edit_name_required => 'Name required';

  @override
  String get profile_edit_bio => 'Bio';

  @override
  String get profile_edit_phone => 'Phone';

  @override
  String get profile_edit_email => 'Email';

  @override
  String get profile_edit_location => 'Update my location';

  @override
  String get profile_language_title => 'Language';

  @override
  String get profile_language_choose => 'Choose your preferred language';

  @override
  String get profile_language_default => 'Default language';

  @override
  String get profile_low_data_title => 'Low data mode';

  @override
  String get profile_low_data_desc => 'Reduce mobile data consumption';

  @override
  String get profile_low_data_enable => 'Enable image compression';

  @override
  String get profile_low_data_low_res => 'Low resolution images';

  @override
  String get profile_low_data_no_auto_video => 'Disable auto-play videos';

  @override
  String get profile_low_data_offline => 'Download only on Wi-Fi';

  @override
  String get profile_low_data_saved => 'Data saved';

  @override
  String profile_low_data_saved_desc(Object mb, Object percent) {
    return '$mb MB • $percent% saved this week';
  }

  @override
  String get profile_notification_settings_title => 'Notification settings';

  @override
  String get profile_notif_push => 'Push';

  @override
  String get profile_notif_orders => 'Orders';

  @override
  String get profile_notif_orders_desc => 'Confirmation and status alerts';

  @override
  String get profile_notif_promotions => 'Promotions';

  @override
  String get profile_notif_promotions_desc => 'Offers and discounts';

  @override
  String get profile_notif_chat => 'Chat';

  @override
  String get profile_notif_chat_desc => 'New messages';

  @override
  String get profile_notif_delivery => 'Delivery';

  @override
  String get profile_notif_delivery_desc => 'Delivery updates';

  @override
  String get profile_notif_email => 'Email';

  @override
  String get profile_notif_email_confirmations => 'Order confirmations';

  @override
  String get profile_notif_email_confirmations_desc => 'Receipt by email';

  @override
  String get profile_notif_email_newsletter => 'Weekly newsletter';

  @override
  String get profile_notif_email_newsletter_desc => 'Week summary';

  @override
  String get profile_notif_sms => 'SMS';

  @override
  String get profile_notif_sms_delivery => 'Delivery notifications';

  @override
  String get profile_notif_sms_otp => 'OTP';

  @override
  String get profile_notif_sms_otp_desc => 'Verification codes';

  @override
  String get profile_privacy_title => 'Privacy & security';

  @override
  String get profile_privacy_password => 'Password';

  @override
  String profile_privacy_password_changed(Object time) {
    return 'Last changed $time ago';
  }

  @override
  String get profile_privacy_fingerprint => 'Fingerprint';

  @override
  String get profile_privacy_fingerprint_desc => 'Unlock with your fingerprint';

  @override
  String get profile_privacy_2fa => 'Two-factor authentication';

  @override
  String get profile_privacy_2fa_desc => 'Additional code on login';

  @override
  String get profile_privacy_privacy => 'Privacy';

  @override
  String get profile_privacy_share_data => 'Share my data';

  @override
  String get profile_privacy_share_data_desc => 'Improve your experience';

  @override
  String get profile_privacy_policy => 'Privacy policy';

  @override
  String get profile_privacy_download_data => 'Download my data';

  @override
  String get profile_privacy_devices => 'Connected devices';

  @override
  String get profile_privacy_change_password => 'Change password';

  @override
  String get profile_privacy_current_password => 'Current password';

  @override
  String get profile_privacy_new_password => 'New password';

  @override
  String get profile_privacy_confirm_password => 'Confirm password';

  @override
  String get profile_privacy_update_password => 'Update password';

  @override
  String get profile_payment_title => 'Payment methods';

  @override
  String get profile_payment_mobile_money => 'Mobile Money';

  @override
  String get profile_payment_cards => 'Bank cards';

  @override
  String get profile_payment_add_card => 'Add a card';

  @override
  String get profile_payment_card_hint => 'Visa, Mastercard';

  @override
  String get profile_payment_cash => 'Cash';

  @override
  String get profile_payment_cash_desc => 'Cash on delivery';

  @override
  String get profile_payment_default => 'Default';

  @override
  String get profile_address_title => 'My addresses';

  @override
  String get profile_address_default => 'Default';

  @override
  String get profile_address_edit => 'Edit';

  @override
  String get profile_address_delete => 'Delete';

  @override
  String get profile_address_set_default => 'Set as default';

  @override
  String get profile_address_add => 'Add an address';

  @override
  String get profile_address_edit_title => 'Edit address';

  @override
  String get profile_address_label_hint => 'Label (e.g. Home)';

  @override
  String get profile_address_full => 'Full address';

  @override
  String get profile_address_save => 'Save';

  @override
  String get profile_address_new => 'New address';

  @override
  String get profile_address_add_action => 'Add';

  @override
  String get profile_address_delete_confirm => 'Delete this address?';

  @override
  String profile_address_delete_sure(Object label) {
    return 'Are you sure you want to delete \"$label\"?';
  }

  @override
  String get profile_referral_title => 'Referral';

  @override
  String get profile_referral_subtitle => 'Refer your friends';

  @override
  String profile_referral_earn_per_friend(Object amount) {
    return 'You earn $amount per referred friend';
  }

  @override
  String get profile_referral_code => 'YOUR CODE';

  @override
  String get profile_referral_share => 'Share my code';

  @override
  String get profile_referral_friends => 'Friends referred';

  @override
  String get profile_referral_earned => 'Earned';

  @override
  String get profile_referral_pending => 'Pending';

  @override
  String get profile_referral_how_it_works => 'How it works';

  @override
  String get profile_referral_step1_title => 'Share your code';

  @override
  String get profile_referral_step1_desc =>
      'Send your referral code to friends';

  @override
  String get profile_referral_step2_title => 'They sign up';

  @override
  String get profile_referral_step2_desc =>
      'Your friend uses your code when registering';

  @override
  String get profile_referral_step3_title => 'You earn';

  @override
  String profile_referral_step3_desc(Object amount) {
    return 'After their first order, you receive $amount';
  }

  @override
  String get profile_referral_history => 'History';

  @override
  String get profile_referral_registered => 'Registered';

  @override
  String get profile_referral_pending_status => '—';

  @override
  String get profile_about_title => 'About';

  @override
  String profile_about_version(Object build, Object version) {
    return 'Version $version (build $build)';
  }

  @override
  String get profile_about_terms => 'Terms of service';

  @override
  String get profile_about_privacy => 'Privacy policy';

  @override
  String get profile_about_legal => 'Legal notice';

  @override
  String get profile_about_licenses => 'Open source licenses';

  @override
  String get profile_about_rate => 'Rate the app';

  @override
  String get profile_about_report => 'Report a bug';

  @override
  String get profile_about_made_in => 'Made with ❤ in Gabon';

  @override
  String get profile_delete_account_title => 'Delete my account';

  @override
  String get profile_delete_account_warning => 'Warning';

  @override
  String get profile_delete_account_irreversible =>
      'This action is irreversible. All your data will be deleted after 30 days.';

  @override
  String get profile_delete_account_why => 'Why are you deleting your account?';

  @override
  String get profile_delete_account_not_using => 'I no longer use the app';

  @override
  String get profile_delete_account_too_many_notif => 'Too many notifications';

  @override
  String get profile_delete_account_delivery_issues => 'Delivery issues';

  @override
  String get profile_delete_account_payment_issues => 'Payment issues';

  @override
  String get profile_delete_account_new_account =>
      'I\'m creating a new account';

  @override
  String get profile_delete_account_other => 'Other';

  @override
  String get profile_delete_account_understand =>
      'I understand this action is irreversible';

  @override
  String get profile_delete_account_button => 'Delete my account';

  @override
  String get profile_delete_account_last_step => 'Final step';

  @override
  String get profile_delete_account_last_step_desc =>
      'Your account will be permanently deleted after 30 days.';

  @override
  String get profile_delete_account_confirm => 'Confirm deletion';

  @override
  String get profile_accessibility_title => 'Accessibility';

  @override
  String get profile_accessibility_display => 'Display';

  @override
  String get profile_accessibility_text_size => 'Text size';

  @override
  String get profile_accessibility_high_contrast => 'High contrast';

  @override
  String get profile_accessibility_high_contrast_desc => 'Improves readability';

  @override
  String get profile_accessibility_reduce_animations => 'Reduce animations';

  @override
  String get profile_accessibility_reduce_animations_desc => 'Decreases motion';

  @override
  String get profile_accessibility_large_touch => 'Large touch targets';

  @override
  String get profile_accessibility_large_touch_desc =>
      'Minimum 56dp for buttons';

  @override
  String get profile_accessibility_preview => 'Preview';

  @override
  String get profile_accessibility_preview_text =>
      'This is a sample text with the selected size and settings.';

  @override
  String get settings_title => 'Settings';

  @override
  String get settings_language => 'Language';

  @override
  String get settings_language_fr => 'Français';

  @override
  String get settings_language_en => 'English';

  @override
  String get settings_dark_mode => 'Dark mode';

  @override
  String get settings_low_bandwidth => 'Low bandwidth mode';

  @override
  String get settings_notifications => 'Notifications';

  @override
  String get settings_about => 'About';

  @override
  String get help_title => 'Help';

  @override
  String get help_need_help => 'Need help?';

  @override
  String get help_team_here => 'Our team is here for you';

  @override
  String get help_contact => 'Contact support';

  @override
  String get help_faq => 'Frequently asked questions';

  @override
  String get help_faq_order => 'How do I place an order?';

  @override
  String get help_faq_order_ans =>
      'Select a product, add it to your cart, and proceed to checkout.';

  @override
  String get help_faq_payment => 'What payment methods are accepted?';

  @override
  String get help_faq_payment_ans =>
      'We accept Orange Money, MTN MoMo, Airtel Money, card, and cash on delivery.';

  @override
  String get help_faq_delivery => 'How does delivery work?';

  @override
  String get help_faq_delivery_ans =>
      'Delivery is handled by our partner delivery drivers.';

  @override
  String get help_faq_return => 'Can I return a product?';

  @override
  String get help_faq_return_ans => 'Yes, within 14 days of receipt.';

  @override
  String get help_faq_seller => 'How do I become a seller?';

  @override
  String get help_faq_seller_ans =>
      'Go to your profile and select \"Become a seller\".';

  @override
  String get help_contact_email => 'Email';

  @override
  String get help_contact_whatsapp => 'WhatsApp';

  @override
  String get help_contact_call => 'Call';

  @override
  String get admin_title => 'Admin';

  @override
  String get admin_overview => 'Overview';

  @override
  String get admin_users => 'Users';

  @override
  String get admin_orders => 'Orders';

  @override
  String get admin_revenue => 'Revenue';

  @override
  String get admin_disputes => 'Disputes';

  @override
  String get admin_recent_orders => 'Recent orders';

  @override
  String get admin_actions => 'Actions';

  @override
  String get admin_kyc => 'KYC';

  @override
  String get admin_orders_title => 'Orders';

  @override
  String get admin_orders_all => 'All';

  @override
  String get admin_orders_disputes => 'Disputes';

  @override
  String get admin_orders_refunds => 'Refunds';

  @override
  String get admin_orders_reason_not_conforming => 'Product not as described';

  @override
  String get admin_orders_reason_not_received => 'Delivery not received';

  @override
  String get admin_orders_reason_damaged => 'Damaged item';

  @override
  String get admin_orders_pending => 'Pending';

  @override
  String get admin_orders_resolved => 'Resolved';

  @override
  String get admin_orders_refunded => 'Refunded';

  @override
  String get admin_orders_processing => 'Processing';

  @override
  String get admin_orders_reason => 'Reason:';

  @override
  String get admin_orders_resolve => 'Resolve';

  @override
  String get admin_orders_refund => 'Refund';

  @override
  String get admin_users_title => 'Users';

  @override
  String get admin_users_total => 'Total';

  @override
  String get admin_users_clients => 'Clients';

  @override
  String get admin_users_sellers => 'Sellers';

  @override
  String get admin_users_drivers => 'Delivery';

  @override
  String get admin_users_all => 'All';

  @override
  String get admin_users_active => 'Active';

  @override
  String get admin_users_suspended => 'Suspended';

  @override
  String get admin_users_pending_kyc => 'Pending KYC';

  @override
  String get admin_users_view_profile => 'View profile';

  @override
  String get admin_users_suspend => 'Suspend';

  @override
  String get admin_users_reactivate => 'Reactivate';

  @override
  String get admin_users_verify_kyc => 'Verify KYC';

  @override
  String get admin_users_delete_user => 'Delete';

  @override
  String get admin_kyc_title => 'KYC verification';

  @override
  String get admin_kyc_pending => 'Pending';

  @override
  String get admin_kyc_approved => 'Approved';

  @override
  String get admin_kyc_rejected => 'Rejected';

  @override
  String admin_kyc_submitted(Object date) {
    return 'Submitted $date';
  }

  @override
  String get admin_kyc_selfie => 'Selfie';

  @override
  String get admin_kyc_id_front => 'ID front';

  @override
  String get admin_kyc_id_back => 'ID back';

  @override
  String get admin_kyc_approve => 'Approve';

  @override
  String get admin_kyc_reject => 'Reject';

  @override
  String get admin_kyc_reject_title => 'Reject verification';

  @override
  String admin_kyc_reject_reason(Object name) {
    return 'Rejection reason for $name:';
  }

  @override
  String get admin_kyc_reject_hint => 'Illegible document, missing photo...';

  @override
  String get general_confirm => 'Confirm';

  @override
  String get general_cancel => 'Cancel';

  @override
  String get general_save => 'Save';

  @override
  String get general_delete => 'Delete';

  @override
  String get general_search => 'Search';

  @override
  String get general_loading => 'Loading...';

  @override
  String get general_error => 'An error occurred';

  @override
  String get general_retry => 'Retry';

  @override
  String get general_no_internet => 'No Internet connection';

  @override
  String get general_offline => 'Offline mode';

  @override
  String get general_filters => 'Filters';

  @override
  String get general_sort => 'Sort';

  @override
  String get general_close => 'Close';

  @override
  String get general_yes => 'Yes';

  @override
  String get general_no => 'No';

  @override
  String get general_ok => 'OK';

  @override
  String get general_success => 'Success';

  @override
  String get general_submit => 'Submit';

  @override
  String get general_next => 'Next';

  @override
  String get general_previous => 'Previous';

  @override
  String get general_finish => 'Finish';

  @override
  String get general_skip => 'Skip';

  @override
  String get general_share => 'Share';

  @override
  String get general_copy => 'Copy';

  @override
  String get general_see_all => 'See all';

  @override
  String get general_edit => 'Edit';

  @override
  String get general_add => 'Add';

  @override
  String get filter_price => 'Price';

  @override
  String get filter_category => 'Category';

  @override
  String get filter_zone => 'Zone';

  @override
  String get filter_rating => 'Minimum rating';

  @override
  String get filter_seller_type => 'Seller type';

  @override
  String get filter_free_delivery => 'Free delivery';

  @override
  String get filter_apply => 'Apply';

  @override
  String get currency_fcfa => 'FCFA';

  @override
  String time_min_ago(Object minutes) {
    return '$minutes min ago';
  }

  @override
  String time_h_ago(Object hours) {
    return '${hours}h ago';
  }

  @override
  String time_d_ago(Object days) {
    return '${days}d ago';
  }

  @override
  String get tutorial_title => 'Tutorial';

  @override
  String get tutorial_step1_title => 'Home';

  @override
  String get tutorial_step1_desc =>
      'Browse products near you, discover new items, and save your favorites.';

  @override
  String get tutorial_step2_title => 'Order';

  @override
  String get tutorial_step2_desc =>
      'Add to cart, negotiate the price, and checkout securely.';

  @override
  String get tutorial_step3_title => 'Payment';

  @override
  String get tutorial_step3_desc =>
      'Pay with Orange Money, MTN MoMo, Airtel Money, or cash.';

  @override
  String get tutorial_step4_title => 'Tracking';

  @override
  String get tutorial_step4_desc =>
      'Track your order in real-time and receive delivery updates.';

  @override
  String get whats_new_title => 'What\'s New';

  @override
  String get whats_new_feature1_title => 'New Boutique';

  @override
  String get whats_new_feature1_desc =>
      'Sellers now have their own customized storefront to showcase their products.';

  @override
  String get whats_new_feature2_title => 'Quick Sell Mode';

  @override
  String get whats_new_feature2_desc =>
      'Sell in 2 minutes: photo, description, price — and you\'re live!';

  @override
  String get whats_new_feature3_title => 'Real-time Tracking';

  @override
  String get whats_new_feature3_desc =>
      'Follow your delivery driver on the map with live updates.';

  @override
  String get whats_new_discover => 'Discover';

  @override
  String get rate_title => 'Rate Okiba';

  @override
  String get rate_question => 'Do you like Okiba?';

  @override
  String get rate_desc => 'Your feedback helps us improve';

  @override
  String get rate_sorry => 'We\'re sorry. Tell us how to improve:';

  @override
  String get rate_thanks => 'Thanks! How can we do better?';

  @override
  String get rate_great => 'Great! Thank you for your support!';

  @override
  String get rate_store => 'Rate on the Store';

  @override
  String get rate_send => 'Send';

  @override
  String get rate_thank_you => 'Thank you!';

  @override
  String get rate_feedback_recorded => 'Your feedback has been recorded.';

  @override
  String get rate_close => 'Close';

  @override
  String get app_update_title => 'Update available';

  @override
  String app_update_new_version(Object version) {
    return 'Version $version available';
  }

  @override
  String app_update_current(Object current) {
    return 'You are currently using version $current';
  }

  @override
  String get app_update_button => 'Update';

  @override
  String get app_update_later => 'Later';

  @override
  String app_update_whats_new_title(Object version) {
    return 'What\'s new in version $version';
  }

  @override
  String get app_update_feature_boutique => 'New seller boutique design';

  @override
  String get app_update_feature_rapid =>
      'Quick sell mode: publish in 2 minutes';

  @override
  String get app_update_feature_tracking =>
      'Real-time delivery tracking on map';

  @override
  String get app_update_feature_airtel => 'Airtel Money payment now available';

  @override
  String get app_update_feature_perf =>
      'Performance improvements and bug fixes';
}

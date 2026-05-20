import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @app_name.
  ///
  /// In en, this message translates to:
  /// **'Okiba'**
  String get app_name;

  /// No description provided for @app_tagline.
  ///
  /// In en, this message translates to:
  /// **'Buy, sell, get delivered'**
  String get app_tagline;

  /// No description provided for @nav_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get nav_home;

  /// No description provided for @nav_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get nav_search;

  /// No description provided for @nav_cart.
  ///
  /// In en, this message translates to:
  /// **'Cart'**
  String get nav_cart;

  /// No description provided for @nav_orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get nav_orders;

  /// No description provided for @nav_profile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get nav_profile;

  /// No description provided for @onboarding_title_1.
  ///
  /// In en, this message translates to:
  /// **'Shop Everything'**
  String get onboarding_title_1;

  /// No description provided for @onboarding_desc_1.
  ///
  /// In en, this message translates to:
  /// **'Thousands of products near you'**
  String get onboarding_desc_1;

  /// No description provided for @onboarding_title_2.
  ///
  /// In en, this message translates to:
  /// **'Sell Easily'**
  String get onboarding_title_2;

  /// No description provided for @onboarding_desc_2.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp, store or in 30 seconds'**
  String get onboarding_desc_2;

  /// No description provided for @onboarding_title_3.
  ///
  /// In en, this message translates to:
  /// **'Deliver & Earn'**
  String get onboarding_title_3;

  /// No description provided for @onboarding_desc_3.
  ///
  /// In en, this message translates to:
  /// **'Become a delivery person and earn money'**
  String get onboarding_desc_3;

  /// No description provided for @onboarding_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get onboarding_skip;

  /// No description provided for @onboarding_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get onboarding_next;

  /// No description provided for @onboarding_start.
  ///
  /// In en, this message translates to:
  /// **'Get Started'**
  String get onboarding_start;

  /// No description provided for @auth_login_title.
  ///
  /// In en, this message translates to:
  /// **'Login'**
  String get auth_login_title;

  /// No description provided for @auth_phone_hint.
  ///
  /// In en, this message translates to:
  /// **'Phone number'**
  String get auth_phone_hint;

  /// No description provided for @auth_phone_format.
  ///
  /// In en, this message translates to:
  /// **'+241 XX XX XX XX'**
  String get auth_phone_format;

  /// No description provided for @auth_send_code.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get auth_send_code;

  /// No description provided for @auth_verify_title.
  ///
  /// In en, this message translates to:
  /// **'Verification'**
  String get auth_verify_title;

  /// No description provided for @auth_code_hint.
  ///
  /// In en, this message translates to:
  /// **'Verification code'**
  String get auth_code_hint;

  /// No description provided for @auth_verify.
  ///
  /// In en, this message translates to:
  /// **'Verify'**
  String get auth_verify;

  /// No description provided for @auth_resend.
  ///
  /// In en, this message translates to:
  /// **'Resend code'**
  String get auth_resend;

  /// No description provided for @auth_resend_in.
  ///
  /// In en, this message translates to:
  /// **'Resend in {seconds}s'**
  String auth_resend_in(Object seconds);

  /// No description provided for @auth_email_title.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get auth_email_title;

  /// No description provided for @auth_email_hint.
  ///
  /// In en, this message translates to:
  /// **'Email address'**
  String get auth_email_hint;

  /// No description provided for @auth_password_hint.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get auth_password_hint;

  /// No description provided for @auth_forgot_password.
  ///
  /// In en, this message translates to:
  /// **'Forgot password?'**
  String get auth_forgot_password;

  /// No description provided for @auth_no_account.
  ///
  /// In en, this message translates to:
  /// **'Don\'t have an account?'**
  String get auth_no_account;

  /// No description provided for @auth_has_account.
  ///
  /// In en, this message translates to:
  /// **'Already have an account?'**
  String get auth_has_account;

  /// No description provided for @auth_register.
  ///
  /// In en, this message translates to:
  /// **'Register'**
  String get auth_register;

  /// No description provided for @auth_register_title.
  ///
  /// In en, this message translates to:
  /// **'Create account'**
  String get auth_register_title;

  /// No description provided for @auth_name_hint.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get auth_name_hint;

  /// No description provided for @auth_login_button.
  ///
  /// In en, this message translates to:
  /// **'Log in'**
  String get auth_login_button;

  /// No description provided for @auth_login_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Log in to your account'**
  String get auth_login_subtitle;

  /// No description provided for @auth_invalid_phone.
  ///
  /// In en, this message translates to:
  /// **'Invalid phone number'**
  String get auth_invalid_phone;

  /// No description provided for @auth_password_required.
  ///
  /// In en, this message translates to:
  /// **'Password required'**
  String get auth_password_required;

  /// No description provided for @auth_phone_register_hint.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get auth_phone_register_hint;

  /// No description provided for @auth_continue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get auth_continue;

  /// No description provided for @auth_register_email.
  ///
  /// In en, this message translates to:
  /// **'Register with email'**
  String get auth_register_email;

  /// No description provided for @auth_email_register_title.
  ///
  /// In en, this message translates to:
  /// **'Email registration'**
  String get auth_email_register_title;

  /// No description provided for @auth_email_register_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Create your account with an email'**
  String get auth_email_register_subtitle;

  /// No description provided for @auth_email_label.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get auth_email_label;

  /// No description provided for @auth_email_invalid.
  ///
  /// In en, this message translates to:
  /// **'Invalid email'**
  String get auth_email_invalid;

  /// No description provided for @auth_password_min_chars.
  ///
  /// In en, this message translates to:
  /// **'Minimum 8 characters'**
  String get auth_password_min_chars;

  /// No description provided for @auth_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get auth_confirm_password;

  /// No description provided for @auth_passwords_no_match.
  ///
  /// In en, this message translates to:
  /// **'Passwords do not match'**
  String get auth_passwords_no_match;

  /// No description provided for @auth_email_verify_title.
  ///
  /// In en, this message translates to:
  /// **'Check your email'**
  String get auth_email_verify_title;

  /// No description provided for @auth_email_verify_desc.
  ///
  /// In en, this message translates to:
  /// **'A verification link has been sent\nto your email address.'**
  String get auth_email_verify_desc;

  /// No description provided for @auth_email_verified.
  ///
  /// In en, this message translates to:
  /// **'I\'ve verified'**
  String get auth_email_verified;

  /// No description provided for @auth_email_not_received.
  ///
  /// In en, this message translates to:
  /// **'Didn\'t receive anything? '**
  String get auth_email_not_received;

  /// No description provided for @auth_otp_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter the code sent by SMS'**
  String get auth_otp_subtitle;

  /// No description provided for @auth_otp_not_received.
  ///
  /// In en, this message translates to:
  /// **'Code not received? '**
  String get auth_otp_not_received;

  /// No description provided for @auth_forgot_password_title.
  ///
  /// In en, this message translates to:
  /// **'Forgot password'**
  String get auth_forgot_password_title;

  /// No description provided for @auth_reset_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your number to reset'**
  String get auth_reset_subtitle;

  /// No description provided for @auth_reset_sms_info.
  ///
  /// In en, this message translates to:
  /// **'A reset code will be sent via SMS.'**
  String get auth_reset_sms_info;

  /// No description provided for @auth_new_password_title.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get auth_new_password_title;

  /// No description provided for @auth_new_password_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose a secure password'**
  String get auth_new_password_subtitle;

  /// No description provided for @auth_new_password_hint.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get auth_new_password_hint;

  /// No description provided for @auth_register_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Enter your phone number'**
  String get auth_register_subtitle;

  /// No description provided for @role_title.
  ///
  /// In en, this message translates to:
  /// **'What do you want to do?'**
  String get role_title;

  /// No description provided for @role_question.
  ///
  /// In en, this message translates to:
  /// **'Who are you?'**
  String get role_question;

  /// No description provided for @role_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose your main profile'**
  String get role_subtitle;

  /// No description provided for @seller_type_title.
  ///
  /// In en, this message translates to:
  /// **'Selling mode'**
  String get seller_type_title;

  /// No description provided for @seller_type_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Choose how to sell your products'**
  String get seller_type_subtitle;

  /// No description provided for @profile_setup_title.
  ///
  /// In en, this message translates to:
  /// **'Your profile'**
  String get profile_setup_title;

  /// No description provided for @profile_setup_subtitle.
  ///
  /// In en, this message translates to:
  /// **'One last step'**
  String get profile_setup_subtitle;

  /// No description provided for @profile_name_required.
  ///
  /// In en, this message translates to:
  /// **'Name required'**
  String get profile_name_required;

  /// No description provided for @profile_bio_hint.
  ///
  /// In en, this message translates to:
  /// **'Bio (optional)'**
  String get profile_bio_hint;

  /// No description provided for @profile_share_location.
  ///
  /// In en, this message translates to:
  /// **'Share my location'**
  String get profile_share_location;

  /// No description provided for @kyc_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Take a photo of yourself and your ID'**
  String get kyc_subtitle;

  /// No description provided for @kyc_verified.
  ///
  /// In en, this message translates to:
  /// **'Identity verified'**
  String get kyc_verified;

  /// No description provided for @kyc_redirecting.
  ///
  /// In en, this message translates to:
  /// **'Redirecting...'**
  String get kyc_redirecting;

  /// No description provided for @kyc_verifying.
  ///
  /// In en, this message translates to:
  /// **'Verifying...'**
  String get kyc_verifying;

  /// No description provided for @kyc_analyzing.
  ///
  /// In en, this message translates to:
  /// **'Photo analysis and image\nquality detection'**
  String get kyc_analyzing;

  /// No description provided for @kyc_take_photo.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get kyc_take_photo;

  /// No description provided for @kyc_step_selfie_title.
  ///
  /// In en, this message translates to:
  /// **'Verification selfie'**
  String get kyc_step_selfie_title;

  /// No description provided for @kyc_step_id_front_title.
  ///
  /// In en, this message translates to:
  /// **'ID card — Front'**
  String get kyc_step_id_front_title;

  /// No description provided for @kyc_step_id_back_title.
  ///
  /// In en, this message translates to:
  /// **'ID card — Back'**
  String get kyc_step_id_back_title;

  /// No description provided for @kyc_step_selfie_desc.
  ///
  /// In en, this message translates to:
  /// **'Place your face in the frame\nand make sure the lighting is good'**
  String get kyc_step_selfie_desc;

  /// No description provided for @kyc_step_id_front_desc.
  ///
  /// In en, this message translates to:
  /// **'Take a photo of the front of your\npassport, national ID or driver\'s license'**
  String get kyc_step_id_front_desc;

  /// No description provided for @kyc_step_id_back_desc.
  ///
  /// In en, this message translates to:
  /// **'Flip the card and take\na photo of the back'**
  String get kyc_step_id_back_desc;

  /// No description provided for @kyc_verify_identity.
  ///
  /// In en, this message translates to:
  /// **'Verify my identity'**
  String get kyc_verify_identity;

  /// No description provided for @kyc_step_selfie_short.
  ///
  /// In en, this message translates to:
  /// **'Selfie'**
  String get kyc_step_selfie_short;

  /// No description provided for @kyc_step_front_short.
  ///
  /// In en, this message translates to:
  /// **'Front'**
  String get kyc_step_front_short;

  /// No description provided for @kyc_step_back_short.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get kyc_step_back_short;

  /// No description provided for @kyc_step_selfie_label.
  ///
  /// In en, this message translates to:
  /// **'Selfie'**
  String get kyc_step_selfie_label;

  /// No description provided for @kyc_step_id_front_label.
  ///
  /// In en, this message translates to:
  /// **'ID Front'**
  String get kyc_step_id_front_label;

  /// No description provided for @kyc_step_id_back_label.
  ///
  /// In en, this message translates to:
  /// **'ID Back'**
  String get kyc_step_id_back_label;

  /// No description provided for @seller_type_badge_recommended.
  ///
  /// In en, this message translates to:
  /// **'Recommended'**
  String get seller_type_badge_recommended;

  /// No description provided for @seller_type_feature_no_shop.
  ///
  /// In en, this message translates to:
  /// **'No shop to manage'**
  String get seller_type_feature_no_shop;

  /// No description provided for @seller_type_feature_whatsapp.
  ///
  /// In en, this message translates to:
  /// **'Share via WhatsApp link'**
  String get seller_type_feature_whatsapp;

  /// No description provided for @seller_type_feature_orders.
  ///
  /// In en, this message translates to:
  /// **'Orders by message'**
  String get seller_type_feature_orders;

  /// No description provided for @seller_type_feature_beginner.
  ///
  /// In en, this message translates to:
  /// **'Ideal to start'**
  String get seller_type_feature_beginner;

  /// No description provided for @seller_type_feature_catalog.
  ///
  /// In en, this message translates to:
  /// **'Full catalog'**
  String get seller_type_feature_catalog;

  /// No description provided for @seller_type_feature_stock.
  ///
  /// In en, this message translates to:
  /// **'Stock management'**
  String get seller_type_feature_stock;

  /// No description provided for @seller_type_feature_variants.
  ///
  /// In en, this message translates to:
  /// **'Product variants'**
  String get seller_type_feature_variants;

  /// No description provided for @seller_type_feature_analytics.
  ///
  /// In en, this message translates to:
  /// **'Advanced analytics'**
  String get seller_type_feature_analytics;

  /// No description provided for @seller_type_feature_quick.
  ///
  /// In en, this message translates to:
  /// **'Publish in 30s'**
  String get seller_type_feature_quick;

  /// No description provided for @seller_type_feature_photos.
  ///
  /// In en, this message translates to:
  /// **'Photos + description'**
  String get seller_type_feature_photos;

  /// No description provided for @seller_type_feature_price.
  ///
  /// In en, this message translates to:
  /// **'Suggested price'**
  String get seller_type_feature_price;

  /// No description provided for @seller_type_feature_wardrobe.
  ///
  /// In en, this message translates to:
  /// **'Perfect for decluttering'**
  String get seller_type_feature_wardrobe;

  /// No description provided for @onboarding_slide_1_title.
  ///
  /// In en, this message translates to:
  /// **'Shop locally'**
  String get onboarding_slide_1_title;

  /// No description provided for @onboarding_slide_1_desc.
  ///
  /// In en, this message translates to:
  /// **'Order from local merchants\nand support the Gabonese economy.'**
  String get onboarding_slide_1_desc;

  /// No description provided for @onboarding_slide_2_title.
  ///
  /// In en, this message translates to:
  /// **'Sell easily'**
  String get onboarding_slide_2_title;

  /// No description provided for @onboarding_slide_2_desc.
  ///
  /// In en, this message translates to:
  /// **'Create your online store in 2 minutes.\nNo stock? No problem.'**
  String get onboarding_slide_2_desc;

  /// No description provided for @onboarding_slide_3_title.
  ///
  /// In en, this message translates to:
  /// **'Fast delivery'**
  String get onboarding_slide_3_title;

  /// No description provided for @onboarding_slide_3_desc.
  ///
  /// In en, this message translates to:
  /// **'Track your order in real time.\nDelivered in 2 hours to your door.'**
  String get onboarding_slide_3_desc;

  /// No description provided for @welcome_subtitle.
  ///
  /// In en, this message translates to:
  /// **'THE GABONESE MARKET'**
  String get welcome_subtitle;

  /// No description provided for @welcome_tagline.
  ///
  /// In en, this message translates to:
  /// **'Buy and sell easily\nin Gabon'**
  String get welcome_tagline;

  /// No description provided for @auth_send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get auth_send;

  /// No description provided for @role_buy.
  ///
  /// In en, this message translates to:
  /// **'Buy'**
  String get role_buy;

  /// No description provided for @role_buy_desc.
  ///
  /// In en, this message translates to:
  /// **'Browse and buy products'**
  String get role_buy_desc;

  /// No description provided for @role_sell.
  ///
  /// In en, this message translates to:
  /// **'Sell'**
  String get role_sell;

  /// No description provided for @role_sell_desc.
  ///
  /// In en, this message translates to:
  /// **'List your products'**
  String get role_sell_desc;

  /// No description provided for @role_sell_whatsapp.
  ///
  /// In en, this message translates to:
  /// **'Via WhatsApp'**
  String get role_sell_whatsapp;

  /// No description provided for @role_sell_shop.
  ///
  /// In en, this message translates to:
  /// **'Open a shop'**
  String get role_sell_shop;

  /// No description provided for @role_sell_rapid.
  ///
  /// In en, this message translates to:
  /// **'Quick sell'**
  String get role_sell_rapid;

  /// No description provided for @role_deliver.
  ///
  /// In en, this message translates to:
  /// **'Deliver'**
  String get role_deliver;

  /// No description provided for @role_deliver_desc.
  ///
  /// In en, this message translates to:
  /// **'Earn money delivering'**
  String get role_deliver_desc;

  /// No description provided for @role_sell_type_title.
  ///
  /// In en, this message translates to:
  /// **'Choose your seller mode'**
  String get role_sell_type_title;

  /// No description provided for @role_sell_type_whatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp Mode'**
  String get role_sell_type_whatsapp;

  /// No description provided for @role_sell_type_whatsapp_desc.
  ///
  /// In en, this message translates to:
  /// **'Share links via WhatsApp, no shop needed'**
  String get role_sell_type_whatsapp_desc;

  /// No description provided for @role_sell_type_boutique.
  ///
  /// In en, this message translates to:
  /// **'Boutique'**
  String get role_sell_type_boutique;

  /// No description provided for @role_sell_type_boutique_desc.
  ///
  /// In en, this message translates to:
  /// **'Full storefront with catalog'**
  String get role_sell_type_boutique_desc;

  /// No description provided for @role_sell_type_rapid.
  ///
  /// In en, this message translates to:
  /// **'Quick Sell'**
  String get role_sell_type_rapid;

  /// No description provided for @role_sell_type_rapid_desc.
  ///
  /// In en, this message translates to:
  /// **'Sell in 2 minutes with a photo'**
  String get role_sell_type_rapid_desc;

  /// No description provided for @kyc_title.
  ///
  /// In en, this message translates to:
  /// **'Identity verification'**
  String get kyc_title;

  /// No description provided for @kyc_selfie.
  ///
  /// In en, this message translates to:
  /// **'Take a selfie'**
  String get kyc_selfie;

  /// No description provided for @kyc_id_front.
  ///
  /// In en, this message translates to:
  /// **'ID card (front)'**
  String get kyc_id_front;

  /// No description provided for @kyc_id_back.
  ///
  /// In en, this message translates to:
  /// **'ID card (back)'**
  String get kyc_id_back;

  /// No description provided for @kyc_submit.
  ///
  /// In en, this message translates to:
  /// **'Submit for verification'**
  String get kyc_submit;

  /// No description provided for @kyc_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending verification'**
  String get kyc_pending;

  /// No description provided for @kyc_approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get kyc_approved;

  /// No description provided for @kyc_rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get kyc_rejected;

  /// No description provided for @product_add_to_cart.
  ///
  /// In en, this message translates to:
  /// **'Add to cart'**
  String get product_add_to_cart;

  /// No description provided for @product_buy_now.
  ///
  /// In en, this message translates to:
  /// **'Buy now'**
  String get product_buy_now;

  /// No description provided for @product_negotiate.
  ///
  /// In en, this message translates to:
  /// **'Negotiate price'**
  String get product_negotiate;

  /// No description provided for @product_call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get product_call;

  /// No description provided for @product_whatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get product_whatsapp;

  /// No description provided for @product_verified.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get product_verified;

  /// No description provided for @product_nearby.
  ///
  /// In en, this message translates to:
  /// **'Near you'**
  String get product_nearby;

  /// No description provided for @product_free_delivery.
  ///
  /// In en, this message translates to:
  /// **'Free delivery'**
  String get product_free_delivery;

  /// No description provided for @product_in_stock.
  ///
  /// In en, this message translates to:
  /// **'In stock'**
  String get product_in_stock;

  /// No description provided for @product_out_of_stock.
  ///
  /// In en, this message translates to:
  /// **'Out of stock'**
  String get product_out_of_stock;

  /// No description provided for @product_condition.
  ///
  /// In en, this message translates to:
  /// **'Condition'**
  String get product_condition;

  /// No description provided for @product_condition_new.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get product_condition_new;

  /// No description provided for @product_condition_very_good.
  ///
  /// In en, this message translates to:
  /// **'Very good'**
  String get product_condition_very_good;

  /// No description provided for @product_condition_good.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get product_condition_good;

  /// No description provided for @product_condition_renovate.
  ///
  /// In en, this message translates to:
  /// **'To renovate'**
  String get product_condition_renovate;

  /// No description provided for @product_reviews.
  ///
  /// In en, this message translates to:
  /// **'reviews'**
  String get product_reviews;

  /// No description provided for @product_seller.
  ///
  /// In en, this message translates to:
  /// **'Seller'**
  String get product_seller;

  /// No description provided for @product_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get product_description;

  /// No description provided for @product_favorite_add.
  ///
  /// In en, this message translates to:
  /// **'Add to favorites'**
  String get product_favorite_add;

  /// No description provided for @product_favorite_remove.
  ///
  /// In en, this message translates to:
  /// **'Remove from favorites'**
  String get product_favorite_remove;

  /// No description provided for @category_title.
  ///
  /// In en, this message translates to:
  /// **'Categories'**
  String get category_title;

  /// No description provided for @category_products_title.
  ///
  /// In en, this message translates to:
  /// **'Products in {category}'**
  String category_products_title(Object category);

  /// No description provided for @search_title.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search_title;

  /// No description provided for @search_hint.
  ///
  /// In en, this message translates to:
  /// **'Search products...'**
  String get search_hint;

  /// No description provided for @search_no_results.
  ///
  /// In en, this message translates to:
  /// **'No results found'**
  String get search_no_results;

  /// No description provided for @search_no_results_desc.
  ///
  /// In en, this message translates to:
  /// **'Try a different search term'**
  String get search_no_results_desc;

  /// No description provided for @seller_profile_title.
  ///
  /// In en, this message translates to:
  /// **'Seller profile'**
  String get seller_profile_title;

  /// No description provided for @seller_profile_products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get seller_profile_products;

  /// No description provided for @seller_profile_reviews.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get seller_profile_reviews;

  /// No description provided for @reviews_title.
  ///
  /// In en, this message translates to:
  /// **'Reviews'**
  String get reviews_title;

  /// No description provided for @reviews_empty.
  ///
  /// In en, this message translates to:
  /// **'No reviews yet'**
  String get reviews_empty;

  /// No description provided for @reviews_empty_desc.
  ///
  /// In en, this message translates to:
  /// **'Be the first to leave a review'**
  String get reviews_empty_desc;

  /// No description provided for @cart_title.
  ///
  /// In en, this message translates to:
  /// **'My cart'**
  String get cart_title;

  /// No description provided for @cart_empty.
  ///
  /// In en, this message translates to:
  /// **'Your cart is empty'**
  String get cart_empty;

  /// No description provided for @cart_empty_desc.
  ///
  /// In en, this message translates to:
  /// **'Add products to get started'**
  String get cart_empty_desc;

  /// No description provided for @cart_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get cart_total;

  /// No description provided for @cart_checkout.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get cart_checkout;

  /// No description provided for @cart_clear.
  ///
  /// In en, this message translates to:
  /// **'Clear cart'**
  String get cart_clear;

  /// No description provided for @cart_item_edit_title.
  ///
  /// In en, this message translates to:
  /// **'Edit item'**
  String get cart_item_edit_title;

  /// No description provided for @cart_item_quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get cart_item_quantity;

  /// No description provided for @cart_item_note.
  ///
  /// In en, this message translates to:
  /// **'Note for seller'**
  String get cart_item_note;

  /// No description provided for @cart_item_variant.
  ///
  /// In en, this message translates to:
  /// **'Variant'**
  String get cart_item_variant;

  /// No description provided for @checkout_title.
  ///
  /// In en, this message translates to:
  /// **'Checkout'**
  String get checkout_title;

  /// No description provided for @checkout_address.
  ///
  /// In en, this message translates to:
  /// **'Delivery address'**
  String get checkout_address;

  /// No description provided for @checkout_address_hint.
  ///
  /// In en, this message translates to:
  /// **'Neighborhood + landmark'**
  String get checkout_address_hint;

  /// No description provided for @checkout_use_gps.
  ///
  /// In en, this message translates to:
  /// **'Use my location'**
  String get checkout_use_gps;

  /// No description provided for @checkout_delivery_mode.
  ///
  /// In en, this message translates to:
  /// **'Delivery mode'**
  String get checkout_delivery_mode;

  /// No description provided for @checkout_standard.
  ///
  /// In en, this message translates to:
  /// **'Standard (2-3 days)'**
  String get checkout_standard;

  /// No description provided for @checkout_express.
  ///
  /// In en, this message translates to:
  /// **'Express (24h)'**
  String get checkout_express;

  /// No description provided for @checkout_pickup.
  ///
  /// In en, this message translates to:
  /// **'Pickup from seller'**
  String get checkout_pickup;

  /// No description provided for @checkout_payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get checkout_payment;

  /// No description provided for @checkout_orange_money.
  ///
  /// In en, this message translates to:
  /// **'Orange Money'**
  String get checkout_orange_money;

  /// No description provided for @checkout_mtn_momo.
  ///
  /// In en, this message translates to:
  /// **'MTN Mobile Money'**
  String get checkout_mtn_momo;

  /// No description provided for @checkout_airtel_money.
  ///
  /// In en, this message translates to:
  /// **'Airtel Money'**
  String get checkout_airtel_money;

  /// No description provided for @checkout_cash.
  ///
  /// In en, this message translates to:
  /// **'Cash on delivery'**
  String get checkout_cash;

  /// No description provided for @checkout_card.
  ///
  /// In en, this message translates to:
  /// **'Bank card'**
  String get checkout_card;

  /// No description provided for @checkout_summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get checkout_summary;

  /// No description provided for @checkout_pay.
  ///
  /// In en, this message translates to:
  /// **'Pay {amount}'**
  String checkout_pay(Object amount);

  /// No description provided for @checkout_success.
  ///
  /// In en, this message translates to:
  /// **'Order confirmed!'**
  String get checkout_success;

  /// No description provided for @checkout_success_desc.
  ///
  /// In en, this message translates to:
  /// **'You will receive a notification when your package is shipped.'**
  String get checkout_success_desc;

  /// No description provided for @checkout_failed.
  ///
  /// In en, this message translates to:
  /// **'Payment failed'**
  String get checkout_failed;

  /// No description provided for @checkout_failed_desc.
  ///
  /// In en, this message translates to:
  /// **'Please try again with another method.'**
  String get checkout_failed_desc;

  /// No description provided for @checkout_processing_title.
  ///
  /// In en, this message translates to:
  /// **'Processing payment'**
  String get checkout_processing_title;

  /// No description provided for @checkout_processing_desc.
  ///
  /// In en, this message translates to:
  /// **'Please wait while we confirm your payment...'**
  String get checkout_processing_desc;

  /// No description provided for @checkout_review_title.
  ///
  /// In en, this message translates to:
  /// **'Review your order'**
  String get checkout_review_title;

  /// No description provided for @checkout_review_items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get checkout_review_items;

  /// No description provided for @checkout_review_delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get checkout_review_delivery;

  /// No description provided for @checkout_review_payment.
  ///
  /// In en, this message translates to:
  /// **'Payment method'**
  String get checkout_review_payment;

  /// No description provided for @checkout_review_place.
  ///
  /// In en, this message translates to:
  /// **'Place order'**
  String get checkout_review_place;

  /// No description provided for @checkout_negotiate_title.
  ///
  /// In en, this message translates to:
  /// **'Negotiate price'**
  String get checkout_negotiate_title;

  /// No description provided for @checkout_negotiate_your_price.
  ///
  /// In en, this message translates to:
  /// **'Your proposed price'**
  String get checkout_negotiate_your_price;

  /// No description provided for @checkout_negotiate_message.
  ///
  /// In en, this message translates to:
  /// **'Message to seller'**
  String get checkout_negotiate_message;

  /// No description provided for @order_status_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get order_status_pending;

  /// No description provided for @order_status_confirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get order_status_confirmed;

  /// No description provided for @order_status_preparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing'**
  String get order_status_preparing;

  /// No description provided for @order_status_ready.
  ///
  /// In en, this message translates to:
  /// **'Ready'**
  String get order_status_ready;

  /// No description provided for @order_status_assigned.
  ///
  /// In en, this message translates to:
  /// **'Delivery assigned'**
  String get order_status_assigned;

  /// No description provided for @order_status_in_transit.
  ///
  /// In en, this message translates to:
  /// **'In transit'**
  String get order_status_in_transit;

  /// No description provided for @order_status_delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get order_status_delivered;

  /// No description provided for @order_status_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get order_status_cancelled;

  /// No description provided for @order_track.
  ///
  /// In en, this message translates to:
  /// **'Track my order'**
  String get order_track;

  /// No description provided for @order_details.
  ///
  /// In en, this message translates to:
  /// **'Order details'**
  String get order_details;

  /// No description provided for @order_number.
  ///
  /// In en, this message translates to:
  /// **'Order number'**
  String get order_number;

  /// No description provided for @order_date.
  ///
  /// In en, this message translates to:
  /// **'Order date'**
  String get order_date;

  /// No description provided for @order_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get order_total;

  /// No description provided for @order_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get order_status;

  /// No description provided for @order_tracking_title.
  ///
  /// In en, this message translates to:
  /// **'Order tracking'**
  String get order_tracking_title;

  /// No description provided for @order_tracking_map.
  ///
  /// In en, this message translates to:
  /// **'Follow your delivery on the map'**
  String get order_tracking_map;

  /// No description provided for @order_rate_title.
  ///
  /// In en, this message translates to:
  /// **'Rate your order'**
  String get order_rate_title;

  /// No description provided for @order_rate_seller.
  ///
  /// In en, this message translates to:
  /// **'Rate the seller'**
  String get order_rate_seller;

  /// No description provided for @order_rate_delivery.
  ///
  /// In en, this message translates to:
  /// **'Rate the delivery'**
  String get order_rate_delivery;

  /// No description provided for @order_rate_comment.
  ///
  /// In en, this message translates to:
  /// **'Add a comment'**
  String get order_rate_comment;

  /// No description provided for @order_dispute_title.
  ///
  /// In en, this message translates to:
  /// **'Open a dispute'**
  String get order_dispute_title;

  /// No description provided for @order_dispute_reason.
  ///
  /// In en, this message translates to:
  /// **'Reason'**
  String get order_dispute_reason;

  /// No description provided for @order_dispute_evidence.
  ///
  /// In en, this message translates to:
  /// **'Upload evidence'**
  String get order_dispute_evidence;

  /// No description provided for @order_dispute_submit.
  ///
  /// In en, this message translates to:
  /// **'Submit dispute'**
  String get order_dispute_submit;

  /// No description provided for @order_favorites_title.
  ///
  /// In en, this message translates to:
  /// **'My favorites'**
  String get order_favorites_title;

  /// No description provided for @order_favorites_empty.
  ///
  /// In en, this message translates to:
  /// **'No favorites yet'**
  String get order_favorites_empty;

  /// No description provided for @seller_dashboard.
  ///
  /// In en, this message translates to:
  /// **'Dashboard'**
  String get seller_dashboard;

  /// No description provided for @seller_products.
  ///
  /// In en, this message translates to:
  /// **'My products'**
  String get seller_products;

  /// No description provided for @seller_orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get seller_orders;

  /// No description provided for @seller_wallet.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get seller_wallet;

  /// No description provided for @seller_add_product.
  ///
  /// In en, this message translates to:
  /// **'Add product'**
  String get seller_add_product;

  /// No description provided for @seller_sales_today.
  ///
  /// In en, this message translates to:
  /// **'Today\'s sales'**
  String get seller_sales_today;

  /// No description provided for @seller_sales_week.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get seller_sales_week;

  /// No description provided for @seller_sales_month.
  ///
  /// In en, this message translates to:
  /// **'This month'**
  String get seller_sales_month;

  /// No description provided for @seller_stock_alert.
  ///
  /// In en, this message translates to:
  /// **'Stock alert'**
  String get seller_stock_alert;

  /// No description provided for @seller_member_since.
  ///
  /// In en, this message translates to:
  /// **'Member since'**
  String get seller_member_since;

  /// No description provided for @seller_whatsapp_title.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp selling'**
  String get seller_whatsapp_title;

  /// No description provided for @seller_whatsapp_new.
  ///
  /// In en, this message translates to:
  /// **'New product link'**
  String get seller_whatsapp_new;

  /// No description provided for @seller_whatsapp_share.
  ///
  /// In en, this message translates to:
  /// **'Share on WhatsApp'**
  String get seller_whatsapp_share;

  /// No description provided for @seller_whatsapp_copy_link.
  ///
  /// In en, this message translates to:
  /// **'Copy link'**
  String get seller_whatsapp_copy_link;

  /// No description provided for @seller_whatsapp_views.
  ///
  /// In en, this message translates to:
  /// **'Views'**
  String get seller_whatsapp_views;

  /// No description provided for @seller_whatsapp_connected.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp connected'**
  String get seller_whatsapp_connected;

  /// No description provided for @seller_whatsapp_desc.
  ///
  /// In en, this message translates to:
  /// **'Share your catalog and manage orders from WhatsApp'**
  String get seller_whatsapp_desc;

  /// No description provided for @seller_whatsapp_orders_new.
  ///
  /// In en, this message translates to:
  /// **'New orders'**
  String get seller_whatsapp_orders_new;

  /// No description provided for @seller_whatsapp_messages.
  ///
  /// In en, this message translates to:
  /// **'Messages received'**
  String get seller_whatsapp_messages;

  /// No description provided for @seller_whatsapp_catalog.
  ///
  /// In en, this message translates to:
  /// **'Catalog'**
  String get seller_whatsapp_catalog;

  /// No description provided for @seller_whatsapp_share_catalog.
  ///
  /// In en, this message translates to:
  /// **'Share my WhatsApp catalog'**
  String get seller_whatsapp_share_catalog;

  /// No description provided for @seller_whatsapp_stats.
  ///
  /// In en, this message translates to:
  /// **'View stats'**
  String get seller_whatsapp_stats;

  /// No description provided for @seller_whatsapp_product_create.
  ///
  /// In en, this message translates to:
  /// **'New WhatsApp product'**
  String get seller_whatsapp_product_create;

  /// No description provided for @seller_whatsapp_product_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit product'**
  String get seller_whatsapp_product_edit;

  /// No description provided for @seller_whatsapp_product_detail.
  ///
  /// In en, this message translates to:
  /// **'Product detail'**
  String get seller_whatsapp_product_detail;

  /// No description provided for @seller_whatsapp_photos.
  ///
  /// In en, this message translates to:
  /// **'Photos (1-5)'**
  String get seller_whatsapp_photos;

  /// No description provided for @seller_whatsapp_name.
  ///
  /// In en, this message translates to:
  /// **'Product name'**
  String get seller_whatsapp_name;

  /// No description provided for @seller_whatsapp_name_required.
  ///
  /// In en, this message translates to:
  /// **'Name required'**
  String get seller_whatsapp_name_required;

  /// No description provided for @seller_whatsapp_price_required.
  ///
  /// In en, this message translates to:
  /// **'Price required'**
  String get seller_whatsapp_price_required;

  /// No description provided for @seller_whatsapp_created.
  ///
  /// In en, this message translates to:
  /// **'Product created successfully!'**
  String get seller_whatsapp_created;

  /// No description provided for @seller_whatsapp_updated.
  ///
  /// In en, this message translates to:
  /// **'Product updated'**
  String get seller_whatsapp_updated;

  /// No description provided for @seller_whatsapp_delete_confirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this product?'**
  String get seller_whatsapp_delete_confirm;

  /// No description provided for @seller_whatsapp_delete_irreversible.
  ///
  /// In en, this message translates to:
  /// **'This action is irreversible.'**
  String get seller_whatsapp_delete_irreversible;

  /// No description provided for @seller_whatsapp_published.
  ///
  /// In en, this message translates to:
  /// **'Published'**
  String get seller_whatsapp_published;

  /// No description provided for @seller_whatsapp_visible.
  ///
  /// In en, this message translates to:
  /// **'Visible in your catalog'**
  String get seller_whatsapp_visible;

  /// No description provided for @seller_whatsapp_qr_code.
  ///
  /// In en, this message translates to:
  /// **'View QR code'**
  String get seller_whatsapp_qr_code;

  /// No description provided for @seller_whatsapp_orders_title.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp orders'**
  String get seller_whatsapp_orders_title;

  /// No description provided for @seller_whatsapp_order_detail.
  ///
  /// In en, this message translates to:
  /// **'Order detail'**
  String get seller_whatsapp_order_detail;

  /// No description provided for @seller_whatsapp_order_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm order'**
  String get seller_whatsapp_order_confirm;

  /// No description provided for @seller_whatsapp_contact_whatsapp.
  ///
  /// In en, this message translates to:
  /// **'Contact on WhatsApp'**
  String get seller_whatsapp_contact_whatsapp;

  /// No description provided for @seller_whatsapp_mark_delivered.
  ///
  /// In en, this message translates to:
  /// **'Mark as delivered'**
  String get seller_whatsapp_mark_delivered;

  /// No description provided for @seller_whatsapp_cancel_order.
  ///
  /// In en, this message translates to:
  /// **'Cancel order'**
  String get seller_whatsapp_cancel_order;

  /// No description provided for @seller_whatsapp_stats_title.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get seller_whatsapp_stats_title;

  /// No description provided for @seller_whatsapp_period_7d.
  ///
  /// In en, this message translates to:
  /// **'7 days'**
  String get seller_whatsapp_period_7d;

  /// No description provided for @seller_whatsapp_period_30d.
  ///
  /// In en, this message translates to:
  /// **'30 days'**
  String get seller_whatsapp_period_30d;

  /// No description provided for @seller_whatsapp_period_90d.
  ///
  /// In en, this message translates to:
  /// **'90 days'**
  String get seller_whatsapp_period_90d;

  /// No description provided for @seller_whatsapp_clicks.
  ///
  /// In en, this message translates to:
  /// **'Clicks'**
  String get seller_whatsapp_clicks;

  /// No description provided for @seller_whatsapp_orders_count.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get seller_whatsapp_orders_count;

  /// No description provided for @seller_whatsapp_sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get seller_whatsapp_sales;

  /// No description provided for @seller_whatsapp_conversion_rate.
  ///
  /// In en, this message translates to:
  /// **'Conversion rate'**
  String get seller_whatsapp_conversion_rate;

  /// No description provided for @seller_whatsapp_top_products.
  ///
  /// In en, this message translates to:
  /// **'Most viewed products'**
  String get seller_whatsapp_top_products;

  /// No description provided for @seller_rapid_publish.
  ///
  /// In en, this message translates to:
  /// **'Publish quickly'**
  String get seller_rapid_publish;

  /// No description provided for @seller_rapid_photo.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get seller_rapid_photo;

  /// No description provided for @seller_rapid_price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get seller_rapid_price;

  /// No description provided for @seller_rapid_category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get seller_rapid_category;

  /// No description provided for @seller_rapid_condition.
  ///
  /// In en, this message translates to:
  /// **'Condition'**
  String get seller_rapid_condition;

  /// No description provided for @seller_rapid_published.
  ///
  /// In en, this message translates to:
  /// **'Published!'**
  String get seller_rapid_published;

  /// No description provided for @seller_rapid_title.
  ///
  /// In en, this message translates to:
  /// **'Quick sell'**
  String get seller_rapid_title;

  /// No description provided for @seller_rapid_desc.
  ///
  /// In en, this message translates to:
  /// **'Take a photo, describe your product, and publish instantly.'**
  String get seller_rapid_desc;

  /// No description provided for @seller_rapid_post_ad.
  ///
  /// In en, this message translates to:
  /// **'Post an ad'**
  String get seller_rapid_post_ad;

  /// No description provided for @seller_rapid_active_ads.
  ///
  /// In en, this message translates to:
  /// **'Active ads'**
  String get seller_rapid_active_ads;

  /// No description provided for @seller_rapid_total_views.
  ///
  /// In en, this message translates to:
  /// **'Total views'**
  String get seller_rapid_total_views;

  /// No description provided for @seller_rapid_messages.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get seller_rapid_messages;

  /// No description provided for @seller_rapid_explore_feed.
  ///
  /// In en, this message translates to:
  /// **'Explore feed'**
  String get seller_rapid_explore_feed;

  /// No description provided for @seller_rapid_feed_title.
  ///
  /// In en, this message translates to:
  /// **'Quick feed'**
  String get seller_rapid_feed_title;

  /// No description provided for @seller_rapid_feed_search.
  ///
  /// In en, this message translates to:
  /// **'Search the feed...'**
  String get seller_rapid_feed_search;

  /// No description provided for @seller_rapid_filter_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get seller_rapid_filter_all;

  /// No description provided for @seller_rapid_filter_fashion.
  ///
  /// In en, this message translates to:
  /// **'Fashion'**
  String get seller_rapid_filter_fashion;

  /// No description provided for @seller_rapid_filter_tech.
  ///
  /// In en, this message translates to:
  /// **'Tech'**
  String get seller_rapid_filter_tech;

  /// No description provided for @seller_rapid_filter_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get seller_rapid_filter_home;

  /// No description provided for @seller_rapid_filter_services.
  ///
  /// In en, this message translates to:
  /// **'Services'**
  String get seller_rapid_filter_services;

  /// No description provided for @seller_rapid_filter_food.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get seller_rapid_filter_food;

  /// No description provided for @seller_rapid_ad_title.
  ///
  /// In en, this message translates to:
  /// **'Ad title'**
  String get seller_rapid_ad_title;

  /// No description provided for @seller_rapid_ad_title_required.
  ///
  /// In en, this message translates to:
  /// **'Title required'**
  String get seller_rapid_ad_title_required;

  /// No description provided for @seller_rapid_price_required.
  ///
  /// In en, this message translates to:
  /// **'Price required'**
  String get seller_rapid_price_required;

  /// No description provided for @seller_rapid_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get seller_rapid_description;

  /// No description provided for @seller_rapid_category_select.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get seller_rapid_category_select;

  /// No description provided for @seller_rapid_condition_normal.
  ///
  /// In en, this message translates to:
  /// **'Normal use'**
  String get seller_rapid_condition_normal;

  /// No description provided for @seller_rapid_promotions_title.
  ///
  /// In en, this message translates to:
  /// **'Promotions'**
  String get seller_rapid_promotions_title;

  /// No description provided for @seller_rapid_promotions_boost.
  ///
  /// In en, this message translates to:
  /// **'Boost your listings'**
  String get seller_rapid_promotions_boost;

  /// No description provided for @seller_rapid_promotions_boost_desc.
  ///
  /// In en, this message translates to:
  /// **'Boosted listings get up to 5x more views.'**
  String get seller_rapid_promotions_boost_desc;

  /// No description provided for @seller_rapid_promotions_featured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get seller_rapid_promotions_featured;

  /// No description provided for @seller_rapid_promotions_featured_7d.
  ///
  /// In en, this message translates to:
  /// **'7 days - {price}'**
  String seller_rapid_promotions_featured_7d(Object price);

  /// No description provided for @seller_rapid_promotions_featured_30d.
  ///
  /// In en, this message translates to:
  /// **'30 days - {price}'**
  String seller_rapid_promotions_featured_30d(Object price);

  /// No description provided for @seller_rapid_promotions_urgent.
  ///
  /// In en, this message translates to:
  /// **'Urgent badge'**
  String get seller_rapid_promotions_urgent;

  /// No description provided for @seller_rapid_promotions_urgent_desc.
  ///
  /// In en, this message translates to:
  /// **'Until sold - {price}'**
  String seller_rapid_promotions_urgent_desc(Object price);

  /// No description provided for @seller_rapid_promotions_new.
  ///
  /// In en, this message translates to:
  /// **'New badge'**
  String get seller_rapid_promotions_new;

  /// No description provided for @seller_rapid_promotions_new_desc.
  ///
  /// In en, this message translates to:
  /// **'7 days - {price}'**
  String seller_rapid_promotions_new_desc(Object price);

  /// No description provided for @seller_rapid_promotions_pack.
  ///
  /// In en, this message translates to:
  /// **'Visibility+ pack'**
  String get seller_rapid_promotions_pack;

  /// No description provided for @seller_rapid_promotions_pack_desc.
  ///
  /// In en, this message translates to:
  /// **'30 days - {price}'**
  String seller_rapid_promotions_pack_desc(Object price);

  /// No description provided for @seller_rapid_promotions_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get seller_rapid_promotions_active;

  /// No description provided for @seller_rapid_promotions_activate.
  ///
  /// In en, this message translates to:
  /// **'Activate this promotion'**
  String get seller_rapid_promotions_activate;

  /// No description provided for @seller_rapid_flash_title.
  ///
  /// In en, this message translates to:
  /// **'Flash sales'**
  String get seller_rapid_flash_title;

  /// No description provided for @seller_rapid_flash_create.
  ///
  /// In en, this message translates to:
  /// **'Create'**
  String get seller_rapid_flash_create;

  /// No description provided for @seller_rapid_flash_ongoing.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get seller_rapid_flash_ongoing;

  /// No description provided for @seller_rapid_flash_upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get seller_rapid_flash_upcoming;

  /// No description provided for @seller_rapid_flash_ended.
  ///
  /// In en, this message translates to:
  /// **'Ended'**
  String get seller_rapid_flash_ended;

  /// No description provided for @seller_rapid_flash_new.
  ///
  /// In en, this message translates to:
  /// **'New flash sale'**
  String get seller_rapid_flash_new;

  /// No description provided for @seller_rapid_flash_name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get seller_rapid_flash_name;

  /// No description provided for @seller_rapid_flash_discount.
  ///
  /// In en, this message translates to:
  /// **'Discount (%)'**
  String get seller_rapid_flash_discount;

  /// No description provided for @seller_rapid_flash_duration.
  ///
  /// In en, this message translates to:
  /// **'Duration (hours)'**
  String get seller_rapid_flash_duration;

  /// No description provided for @seller_rapid_flash_schedule.
  ///
  /// In en, this message translates to:
  /// **'Schedule'**
  String get seller_rapid_flash_schedule;

  /// No description provided for @seller_rapid_messages_title.
  ///
  /// In en, this message translates to:
  /// **'Messages'**
  String get seller_rapid_messages_title;

  /// No description provided for @seller_rapid_analytics_title.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get seller_rapid_analytics_title;

  /// No description provided for @seller_rapid_analytics_ads.
  ///
  /// In en, this message translates to:
  /// **'Ads'**
  String get seller_rapid_analytics_ads;

  /// No description provided for @seller_rapid_analytics_contacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get seller_rapid_analytics_contacts;

  /// No description provided for @seller_rapid_analytics_views_per_ad.
  ///
  /// In en, this message translates to:
  /// **'Views/ad'**
  String get seller_rapid_analytics_views_per_ad;

  /// No description provided for @seller_rapid_analytics_perf_title.
  ///
  /// In en, this message translates to:
  /// **'Performance per ad'**
  String get seller_rapid_analytics_perf_title;

  /// No description provided for @seller_rapid_analytics_tips_title.
  ///
  /// In en, this message translates to:
  /// **'Tips'**
  String get seller_rapid_analytics_tips_title;

  /// No description provided for @seller_rapid_analytics_tip_photos.
  ///
  /// In en, this message translates to:
  /// **'Add quality photos for more views'**
  String get seller_rapid_analytics_tip_photos;

  /// No description provided for @seller_rapid_analytics_tip_reply.
  ///
  /// In en, this message translates to:
  /// **'Reply quickly to messages for more sales'**
  String get seller_rapid_analytics_tip_reply;

  /// No description provided for @seller_rapid_analytics_tip_boost.
  ///
  /// In en, this message translates to:
  /// **'Use promotions to boost your listings'**
  String get seller_rapid_analytics_tip_boost;

  /// No description provided for @seller_rapid_product_detail_title.
  ///
  /// In en, this message translates to:
  /// **'Ad'**
  String get seller_rapid_product_detail_title;

  /// No description provided for @seller_rapid_product_detail_featured.
  ///
  /// In en, this message translates to:
  /// **'Featured'**
  String get seller_rapid_product_detail_featured;

  /// No description provided for @seller_rapid_product_detail_member_since.
  ///
  /// In en, this message translates to:
  /// **'Member since {date}'**
  String seller_rapid_product_detail_member_since(Object date);

  /// No description provided for @seller_rapid_product_detail_views.
  ///
  /// In en, this message translates to:
  /// **'views'**
  String get seller_rapid_product_detail_views;

  /// No description provided for @seller_rapid_product_detail_favs.
  ///
  /// In en, this message translates to:
  /// **'favorites'**
  String get seller_rapid_product_detail_favs;

  /// No description provided for @seller_rapid_product_detail_messages_count.
  ///
  /// In en, this message translates to:
  /// **'messages'**
  String get seller_rapid_product_detail_messages_count;

  /// No description provided for @seller_rapid_product_detail_contact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get seller_rapid_product_detail_contact;

  /// No description provided for @seller_rapid_period_7d.
  ///
  /// In en, this message translates to:
  /// **'7 days'**
  String get seller_rapid_period_7d;

  /// No description provided for @seller_rapid_period_30d.
  ///
  /// In en, this message translates to:
  /// **'30 days'**
  String get seller_rapid_period_30d;

  /// No description provided for @seller_rapid_period_90d.
  ///
  /// In en, this message translates to:
  /// **'90 days'**
  String get seller_rapid_period_90d;

  /// No description provided for @boutique_title.
  ///
  /// In en, this message translates to:
  /// **'My boutique'**
  String get boutique_title;

  /// No description provided for @boutique_overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get boutique_overview;

  /// No description provided for @boutique_products.
  ///
  /// In en, this message translates to:
  /// **'Products'**
  String get boutique_products;

  /// No description provided for @boutique_commands.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get boutique_commands;

  /// No description provided for @boutique_sales.
  ///
  /// In en, this message translates to:
  /// **'Sales'**
  String get boutique_sales;

  /// No description provided for @boutique_rating.
  ///
  /// In en, this message translates to:
  /// **'Average rating'**
  String get boutique_rating;

  /// No description provided for @boutique_actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get boutique_actions;

  /// No description provided for @boutique_add_product.
  ///
  /// In en, this message translates to:
  /// **'Add\nproduct'**
  String get boutique_add_product;

  /// No description provided for @boutique_manage_stock.
  ///
  /// In en, this message translates to:
  /// **'Manage\nstock'**
  String get boutique_manage_stock;

  /// No description provided for @boutique_view_reviews.
  ///
  /// In en, this message translates to:
  /// **'View\nreviews'**
  String get boutique_view_reviews;

  /// No description provided for @boutique_recent_products.
  ///
  /// In en, this message translates to:
  /// **'Recent products'**
  String get boutique_recent_products;

  /// No description provided for @boutique_manage.
  ///
  /// In en, this message translates to:
  /// **'Manage'**
  String get boutique_manage;

  /// No description provided for @boutique_out_of_stock.
  ///
  /// In en, this message translates to:
  /// **'Out of stock'**
  String get boutique_out_of_stock;

  /// No description provided for @boutique_performance.
  ///
  /// In en, this message translates to:
  /// **'Performance'**
  String get boutique_performance;

  /// No description provided for @boutique_views_this_week.
  ///
  /// In en, this message translates to:
  /// **'Views this week'**
  String get boutique_views_this_week;

  /// No description provided for @boutique_conversion_rate.
  ///
  /// In en, this message translates to:
  /// **'Conversion rate'**
  String get boutique_conversion_rate;

  /// No description provided for @boutique_response_time.
  ///
  /// In en, this message translates to:
  /// **'Response time'**
  String get boutique_response_time;

  /// No description provided for @boutique_analytics_title.
  ///
  /// In en, this message translates to:
  /// **'Analytics'**
  String get boutique_analytics_title;

  /// No description provided for @boutique_analytics_revenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get boutique_analytics_revenue;

  /// No description provided for @boutique_analytics_vs_previous.
  ///
  /// In en, this message translates to:
  /// **'+{percent}% vs previous period'**
  String boutique_analytics_vs_previous(Object percent);

  /// No description provided for @boutique_analytics_orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get boutique_analytics_orders;

  /// No description provided for @boutique_analytics_views.
  ///
  /// In en, this message translates to:
  /// **'Views'**
  String get boutique_analytics_views;

  /// No description provided for @boutique_analytics_conversion.
  ///
  /// In en, this message translates to:
  /// **'Conv. rate'**
  String get boutique_analytics_conversion;

  /// No description provided for @boutique_analytics_avg_cart.
  ///
  /// In en, this message translates to:
  /// **'Avg. cart'**
  String get boutique_analytics_avg_cart;

  /// No description provided for @boutique_analytics_popular.
  ///
  /// In en, this message translates to:
  /// **'Popular products'**
  String get boutique_analytics_popular;

  /// No description provided for @boutique_analytics_sales.
  ///
  /// In en, this message translates to:
  /// **'sales'**
  String get boutique_analytics_sales;

  /// No description provided for @boutique_period_7d.
  ///
  /// In en, this message translates to:
  /// **'7 days'**
  String get boutique_period_7d;

  /// No description provided for @boutique_period_30d.
  ///
  /// In en, this message translates to:
  /// **'30 days'**
  String get boutique_period_30d;

  /// No description provided for @boutique_period_90d.
  ///
  /// In en, this message translates to:
  /// **'90 days'**
  String get boutique_period_90d;

  /// No description provided for @boutique_period_1y.
  ///
  /// In en, this message translates to:
  /// **'1 year'**
  String get boutique_period_1y;

  /// No description provided for @boutique_catalog_title.
  ///
  /// In en, this message translates to:
  /// **'Catalog'**
  String get boutique_catalog_title;

  /// No description provided for @boutique_catalog_search.
  ///
  /// In en, this message translates to:
  /// **'Search product...'**
  String get boutique_catalog_search;

  /// No description provided for @boutique_catalog_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get boutique_catalog_all;

  /// No description provided for @boutique_catalog_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get boutique_catalog_active;

  /// No description provided for @boutique_catalog_out_of_stock.
  ///
  /// In en, this message translates to:
  /// **'Out of stock'**
  String get boutique_catalog_out_of_stock;

  /// No description provided for @boutique_catalog_draft.
  ///
  /// In en, this message translates to:
  /// **'Draft'**
  String get boutique_catalog_draft;

  /// No description provided for @boutique_catalog_sort_name_az.
  ///
  /// In en, this message translates to:
  /// **'Name (A-Z)'**
  String get boutique_catalog_sort_name_az;

  /// No description provided for @boutique_catalog_sort_price_asc.
  ///
  /// In en, this message translates to:
  /// **'Price (low to high)'**
  String get boutique_catalog_sort_price_asc;

  /// No description provided for @boutique_catalog_sort_price_desc.
  ///
  /// In en, this message translates to:
  /// **'Price (high to low)'**
  String get boutique_catalog_sort_price_desc;

  /// No description provided for @boutique_catalog_sort_stock.
  ///
  /// In en, this message translates to:
  /// **'Stock (low → high)'**
  String get boutique_catalog_sort_stock;

  /// No description provided for @boutique_catalog_sort_recent.
  ///
  /// In en, this message translates to:
  /// **'Most recent'**
  String get boutique_catalog_sort_recent;

  /// No description provided for @boutique_inventory_title.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get boutique_inventory_title;

  /// No description provided for @boutique_inventory_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get boutique_inventory_total;

  /// No description provided for @boutique_inventory_low.
  ///
  /// In en, this message translates to:
  /// **'Low stock'**
  String get boutique_inventory_low;

  /// No description provided for @boutique_inventory_rupture.
  ///
  /// In en, this message translates to:
  /// **'Out of stock'**
  String get boutique_inventory_rupture;

  /// No description provided for @boutique_inventory_excess.
  ///
  /// In en, this message translates to:
  /// **'Overstock'**
  String get boutique_inventory_excess;

  /// No description provided for @boutique_inventory_adjust.
  ///
  /// In en, this message translates to:
  /// **'Adjust stock'**
  String get boutique_inventory_adjust;

  /// No description provided for @boutique_inventory_new_stock.
  ///
  /// In en, this message translates to:
  /// **'New stock'**
  String get boutique_inventory_new_stock;

  /// No description provided for @boutique_inventory_quantity.
  ///
  /// In en, this message translates to:
  /// **'Quantity'**
  String get boutique_inventory_quantity;

  /// No description provided for @boutique_inventory_confirm.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get boutique_inventory_confirm;

  /// No description provided for @boutique_orders_title.
  ///
  /// In en, this message translates to:
  /// **'Boutique orders'**
  String get boutique_orders_title;

  /// No description provided for @boutique_orders_ongoing.
  ///
  /// In en, this message translates to:
  /// **'Ongoing'**
  String get boutique_orders_ongoing;

  /// No description provided for @boutique_orders_shipped.
  ///
  /// In en, this message translates to:
  /// **'Shipped'**
  String get boutique_orders_shipped;

  /// No description provided for @boutique_orders_delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get boutique_orders_delivered;

  /// No description provided for @boutique_orders_cancelled.
  ///
  /// In en, this message translates to:
  /// **'Cancelled'**
  String get boutique_orders_cancelled;

  /// No description provided for @boutique_order_detail_title.
  ///
  /// In en, this message translates to:
  /// **'Order detail'**
  String get boutique_order_detail_title;

  /// No description provided for @boutique_order_detail_placed.
  ///
  /// In en, this message translates to:
  /// **'Order placed'**
  String get boutique_order_detail_placed;

  /// No description provided for @boutique_order_detail_paid.
  ///
  /// In en, this message translates to:
  /// **'Payment confirmed'**
  String get boutique_order_detail_paid;

  /// No description provided for @boutique_order_detail_preparing.
  ///
  /// In en, this message translates to:
  /// **'Preparing'**
  String get boutique_order_detail_preparing;

  /// No description provided for @boutique_order_detail_in_transit.
  ///
  /// In en, this message translates to:
  /// **'In transit'**
  String get boutique_order_detail_in_transit;

  /// No description provided for @boutique_order_detail_items.
  ///
  /// In en, this message translates to:
  /// **'Items'**
  String get boutique_order_detail_items;

  /// No description provided for @boutique_order_detail_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get boutique_order_detail_total;

  /// No description provided for @boutique_order_detail_payment.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get boutique_order_detail_payment;

  /// No description provided for @boutique_order_detail_paid_status.
  ///
  /// In en, this message translates to:
  /// **'Paid'**
  String get boutique_order_detail_paid_status;

  /// No description provided for @boutique_order_detail_tracking.
  ///
  /// In en, this message translates to:
  /// **'Tracking'**
  String get boutique_order_detail_tracking;

  /// No description provided for @boutique_order_detail_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get boutique_order_detail_confirm;

  /// No description provided for @boutique_order_detail_ship.
  ///
  /// In en, this message translates to:
  /// **'Ship'**
  String get boutique_order_detail_ship;

  /// No description provided for @boutique_order_detail_cancel_order.
  ///
  /// In en, this message translates to:
  /// **'Cancel order'**
  String get boutique_order_detail_cancel_order;

  /// No description provided for @boutique_product_create_title.
  ///
  /// In en, this message translates to:
  /// **'New product'**
  String get boutique_product_create_title;

  /// No description provided for @boutique_product_create_publish.
  ///
  /// In en, this message translates to:
  /// **'Publish'**
  String get boutique_product_create_publish;

  /// No description provided for @boutique_product_create_photos.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get boutique_product_create_photos;

  /// No description provided for @boutique_product_create_name.
  ///
  /// In en, this message translates to:
  /// **'Product name'**
  String get boutique_product_create_name;

  /// No description provided for @boutique_product_create_name_required.
  ///
  /// In en, this message translates to:
  /// **'Required'**
  String get boutique_product_create_name_required;

  /// No description provided for @boutique_product_create_price.
  ///
  /// In en, this message translates to:
  /// **'Price (FCFA)'**
  String get boutique_product_create_price;

  /// No description provided for @boutique_product_create_sku.
  ///
  /// In en, this message translates to:
  /// **'SKU'**
  String get boutique_product_create_sku;

  /// No description provided for @boutique_product_create_stock.
  ///
  /// In en, this message translates to:
  /// **'Stock'**
  String get boutique_product_create_stock;

  /// No description provided for @boutique_product_create_weight.
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get boutique_product_create_weight;

  /// No description provided for @boutique_product_create_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get boutique_product_create_description;

  /// No description provided for @boutique_product_create_variants.
  ///
  /// In en, this message translates to:
  /// **'This product has variants'**
  String get boutique_product_create_variants;

  /// No description provided for @boutique_product_create_variants_hint.
  ///
  /// In en, this message translates to:
  /// **'Size, color, etc.'**
  String get boutique_product_create_variants_hint;

  /// No description provided for @boutique_product_create_variants_add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get boutique_product_create_variants_add;

  /// No description provided for @boutique_product_create_variants_stock.
  ///
  /// In en, this message translates to:
  /// **'Stock:'**
  String get boutique_product_create_variants_stock;

  /// No description provided for @boutique_product_create_category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get boutique_product_create_category;

  /// No description provided for @boutique_product_create_cat_fashion.
  ///
  /// In en, this message translates to:
  /// **'Fashion'**
  String get boutique_product_create_cat_fashion;

  /// No description provided for @boutique_product_create_cat_electronics.
  ///
  /// In en, this message translates to:
  /// **'Electronics'**
  String get boutique_product_create_cat_electronics;

  /// No description provided for @boutique_product_create_cat_home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get boutique_product_create_cat_home;

  /// No description provided for @boutique_product_create_cat_beauty.
  ///
  /// In en, this message translates to:
  /// **'Beauty'**
  String get boutique_product_create_cat_beauty;

  /// No description provided for @boutique_product_create_cat_food.
  ///
  /// In en, this message translates to:
  /// **'Food'**
  String get boutique_product_create_cat_food;

  /// No description provided for @boutique_product_create_cat_sports.
  ///
  /// In en, this message translates to:
  /// **'Sports'**
  String get boutique_product_create_cat_sports;

  /// No description provided for @boutique_product_edit_title.
  ///
  /// In en, this message translates to:
  /// **'Edit product'**
  String get boutique_product_edit_title;

  /// No description provided for @boutique_product_edit_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get boutique_product_edit_save;

  /// No description provided for @boutique_product_edit_active.
  ///
  /// In en, this message translates to:
  /// **'Product active'**
  String get boutique_product_edit_active;

  /// No description provided for @boutique_product_edit_visible.
  ///
  /// In en, this message translates to:
  /// **'Visible in shop'**
  String get boutique_product_edit_visible;

  /// No description provided for @boutique_product_edit_hidden.
  ///
  /// In en, this message translates to:
  /// **'Hidden'**
  String get boutique_product_edit_hidden;

  /// No description provided for @boutique_product_edit_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete this product'**
  String get boutique_product_edit_delete;

  /// No description provided for @boutique_product_edit_delete_confirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this product?'**
  String get boutique_product_edit_delete_confirm;

  /// No description provided for @boutique_product_edit_delete_irreversible.
  ///
  /// In en, this message translates to:
  /// **'This action is irreversible.'**
  String get boutique_product_edit_delete_irreversible;

  /// No description provided for @boutique_wallet_title.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get boutique_wallet_title;

  /// No description provided for @boutique_wallet_balance.
  ///
  /// In en, this message translates to:
  /// **'Available balance'**
  String get boutique_wallet_balance;

  /// No description provided for @boutique_wallet_vs_last_month.
  ///
  /// In en, this message translates to:
  /// **'+{percent}% vs last month'**
  String boutique_wallet_vs_last_month(Object percent);

  /// No description provided for @boutique_wallet_withdraw.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal'**
  String get boutique_wallet_withdraw;

  /// No description provided for @boutique_wallet_orange_money.
  ///
  /// In en, this message translates to:
  /// **'Orange Money'**
  String get boutique_wallet_orange_money;

  /// No description provided for @boutique_wallet_bank.
  ///
  /// In en, this message translates to:
  /// **'Bank account'**
  String get boutique_wallet_bank;

  /// No description provided for @boutique_wallet_make_withdrawal.
  ///
  /// In en, this message translates to:
  /// **'Make a withdrawal'**
  String get boutique_wallet_make_withdrawal;

  /// No description provided for @boutique_wallet_recent.
  ///
  /// In en, this message translates to:
  /// **'Recent transactions'**
  String get boutique_wallet_recent;

  /// No description provided for @boutique_wallet_sale.
  ///
  /// In en, this message translates to:
  /// **'Product sale'**
  String get boutique_wallet_sale;

  /// No description provided for @boutique_wallet_withdrawal_om.
  ///
  /// In en, this message translates to:
  /// **'OM withdrawal'**
  String get boutique_wallet_withdrawal_om;

  /// No description provided for @boutique_wallet_withdrawal_bank.
  ///
  /// In en, this message translates to:
  /// **'Bank withdrawal'**
  String get boutique_wallet_withdrawal_bank;

  /// No description provided for @boutique_wallet_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount (FCFA)'**
  String get boutique_wallet_amount;

  /// No description provided for @boutique_wallet_method.
  ///
  /// In en, this message translates to:
  /// **'Method'**
  String get boutique_wallet_method;

  /// No description provided for @boutique_wallet_confirm_withdrawal.
  ///
  /// In en, this message translates to:
  /// **'Confirm withdrawal'**
  String get boutique_wallet_confirm_withdrawal;

  /// No description provided for @boutique_settings_title.
  ///
  /// In en, this message translates to:
  /// **'Boutique settings'**
  String get boutique_settings_title;

  /// No description provided for @boutique_settings_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get boutique_settings_save;

  /// No description provided for @boutique_settings_banner.
  ///
  /// In en, this message translates to:
  /// **'Banner'**
  String get boutique_settings_banner;

  /// No description provided for @boutique_settings_add_banner.
  ///
  /// In en, this message translates to:
  /// **'Add a banner'**
  String get boutique_settings_add_banner;

  /// No description provided for @boutique_settings_name.
  ///
  /// In en, this message translates to:
  /// **'Shop name'**
  String get boutique_settings_name;

  /// No description provided for @boutique_settings_description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get boutique_settings_description;

  /// No description provided for @boutique_settings_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get boutique_settings_phone;

  /// No description provided for @boutique_settings_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get boutique_settings_email;

  /// No description provided for @boutique_settings_address.
  ///
  /// In en, this message translates to:
  /// **'Address'**
  String get boutique_settings_address;

  /// No description provided for @boutique_settings_hours.
  ///
  /// In en, this message translates to:
  /// **'Opening hours'**
  String get boutique_settings_hours;

  /// No description provided for @boutique_settings_opening.
  ///
  /// In en, this message translates to:
  /// **'Opening'**
  String get boutique_settings_opening;

  /// No description provided for @boutique_settings_closing.
  ///
  /// In en, this message translates to:
  /// **'Closing'**
  String get boutique_settings_closing;

  /// No description provided for @boutique_settings_delivery_zones.
  ///
  /// In en, this message translates to:
  /// **'Delivery zone'**
  String get boutique_settings_delivery_zones;

  /// No description provided for @delivery_online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get delivery_online;

  /// No description provided for @delivery_offline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get delivery_offline;

  /// No description provided for @delivery_earnings_today.
  ///
  /// In en, this message translates to:
  /// **'Today\'s earnings'**
  String get delivery_earnings_today;

  /// No description provided for @delivery_earnings_week.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get delivery_earnings_week;

  /// No description provided for @delivery_new_order.
  ///
  /// In en, this message translates to:
  /// **'New delivery!'**
  String get delivery_new_order;

  /// No description provided for @delivery_accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get delivery_accept;

  /// No description provided for @delivery_pickup.
  ///
  /// In en, this message translates to:
  /// **'Pick up package'**
  String get delivery_pickup;

  /// No description provided for @delivery_delivered.
  ///
  /// In en, this message translates to:
  /// **'Delivered'**
  String get delivery_delivered;

  /// No description provided for @delivery_proof_photo.
  ///
  /// In en, this message translates to:
  /// **'Proof photo'**
  String get delivery_proof_photo;

  /// No description provided for @delivery_scan_qr.
  ///
  /// In en, this message translates to:
  /// **'Scan code'**
  String get delivery_scan_qr;

  /// No description provided for @delivery_available.
  ///
  /// In en, this message translates to:
  /// **'Available for deliveries'**
  String get delivery_available;

  /// No description provided for @delivery_fcfc_earned.
  ///
  /// In en, this message translates to:
  /// **'FCFA earned'**
  String get delivery_fcfc_earned;

  /// No description provided for @delivery_deliveries.
  ///
  /// In en, this message translates to:
  /// **'Deliveries'**
  String get delivery_deliveries;

  /// No description provided for @delivery_km_traveled.
  ///
  /// In en, this message translates to:
  /// **'Traveled'**
  String get delivery_km_traveled;

  /// No description provided for @delivery_new_request.
  ///
  /// In en, this message translates to:
  /// **'New request'**
  String get delivery_new_request;

  /// No description provided for @delivery_ongoing.
  ///
  /// In en, this message translates to:
  /// **'In progress'**
  String get delivery_ongoing;

  /// No description provided for @delivery_history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get delivery_history;

  /// No description provided for @delivery_refuse.
  ///
  /// In en, this message translates to:
  /// **'Refuse'**
  String get delivery_refuse;

  /// No description provided for @delivery_earnings_title.
  ///
  /// In en, this message translates to:
  /// **'Earnings'**
  String get delivery_earnings_title;

  /// No description provided for @delivery_earnings_total.
  ///
  /// In en, this message translates to:
  /// **'Total earnings'**
  String get delivery_earnings_total;

  /// No description provided for @delivery_earnings_vs_yesterday.
  ///
  /// In en, this message translates to:
  /// **'+{percent}% vs yesterday'**
  String delivery_earnings_vs_yesterday(Object percent);

  /// No description provided for @delivery_earnings_evolution.
  ///
  /// In en, this message translates to:
  /// **'Evolution'**
  String get delivery_earnings_evolution;

  /// No description provided for @delivery_earnings_distance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get delivery_earnings_distance;

  /// No description provided for @delivery_earnings_rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get delivery_earnings_rating;

  /// No description provided for @delivery_earnings_deliveries_count.
  ///
  /// In en, this message translates to:
  /// **'Deliveries'**
  String get delivery_earnings_deliveries_count;

  /// No description provided for @delivery_earnings_transactions.
  ///
  /// In en, this message translates to:
  /// **'Transactions'**
  String get delivery_earnings_transactions;

  /// No description provided for @delivery_earnings_withdrawal.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal'**
  String get delivery_earnings_withdrawal;

  /// No description provided for @delivery_wallet_title.
  ///
  /// In en, this message translates to:
  /// **'Wallet'**
  String get delivery_wallet_title;

  /// No description provided for @delivery_wallet_balance.
  ///
  /// In en, this message translates to:
  /// **'Available balance'**
  String get delivery_wallet_balance;

  /// No description provided for @delivery_wallet_secure.
  ///
  /// In en, this message translates to:
  /// **'Secure • Instant withdrawal'**
  String get delivery_wallet_secure;

  /// No description provided for @delivery_wallet_withdraw_now.
  ///
  /// In en, this message translates to:
  /// **'Withdraw now'**
  String get delivery_wallet_withdraw_now;

  /// No description provided for @delivery_wallet_methods.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal methods'**
  String get delivery_wallet_methods;

  /// No description provided for @delivery_wallet_add_method.
  ///
  /// In en, this message translates to:
  /// **'Add withdrawal method'**
  String get delivery_wallet_add_method;

  /// No description provided for @delivery_wallet_history.
  ///
  /// In en, this message translates to:
  /// **'Withdrawal history'**
  String get delivery_wallet_history;

  /// No description provided for @delivery_wallet_completed.
  ///
  /// In en, this message translates to:
  /// **'Completed'**
  String get delivery_wallet_completed;

  /// No description provided for @delivery_wallet_instant.
  ///
  /// In en, this message translates to:
  /// **'Instant withdrawal'**
  String get delivery_wallet_instant;

  /// No description provided for @delivery_wallet_amount.
  ///
  /// In en, this message translates to:
  /// **'Amount (FCFA)'**
  String get delivery_wallet_amount;

  /// No description provided for @delivery_wallet_to.
  ///
  /// In en, this message translates to:
  /// **'To'**
  String get delivery_wallet_to;

  /// No description provided for @delivery_wallet_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm withdrawal'**
  String get delivery_wallet_confirm;

  /// No description provided for @delivery_profile_title.
  ///
  /// In en, this message translates to:
  /// **'Delivery profile'**
  String get delivery_profile_title;

  /// No description provided for @delivery_profile_level_gold.
  ///
  /// In en, this message translates to:
  /// **'Gold'**
  String get delivery_profile_level_gold;

  /// No description provided for @delivery_profile_deliveries.
  ///
  /// In en, this message translates to:
  /// **'Deliveries'**
  String get delivery_profile_deliveries;

  /// No description provided for @delivery_profile_rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get delivery_profile_rating;

  /// No description provided for @delivery_profile_success_rate.
  ///
  /// In en, this message translates to:
  /// **'Success rate'**
  String get delivery_profile_success_rate;

  /// No description provided for @delivery_profile_vehicle.
  ///
  /// In en, this message translates to:
  /// **'Vehicle'**
  String get delivery_profile_vehicle;

  /// No description provided for @delivery_profile_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get delivery_profile_edit;

  /// No description provided for @delivery_profile_documents.
  ///
  /// In en, this message translates to:
  /// **'Documents'**
  String get delivery_profile_documents;

  /// No description provided for @delivery_profile_id_card.
  ///
  /// In en, this message translates to:
  /// **'ID card'**
  String get delivery_profile_id_card;

  /// No description provided for @delivery_profile_license.
  ///
  /// In en, this message translates to:
  /// **'Driver\'s license'**
  String get delivery_profile_license;

  /// No description provided for @delivery_profile_registration.
  ///
  /// In en, this message translates to:
  /// **'Registration'**
  String get delivery_profile_registration;

  /// No description provided for @delivery_profile_insurance.
  ///
  /// In en, this message translates to:
  /// **'Insurance'**
  String get delivery_profile_insurance;

  /// No description provided for @delivery_profile_validated.
  ///
  /// In en, this message translates to:
  /// **'Validated'**
  String get delivery_profile_validated;

  /// No description provided for @delivery_profile_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get delivery_profile_pending;

  /// No description provided for @delivery_zone_title.
  ///
  /// In en, this message translates to:
  /// **'Work zone'**
  String get delivery_zone_title;

  /// No description provided for @delivery_zone_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get delivery_zone_save;

  /// No description provided for @delivery_zone_available.
  ///
  /// In en, this message translates to:
  /// **'Available zones'**
  String get delivery_zone_available;

  /// No description provided for @delivery_zone_radius.
  ///
  /// In en, this message translates to:
  /// **'Radius {km} km'**
  String delivery_zone_radius(Object km);

  /// No description provided for @delivery_request_title.
  ///
  /// In en, this message translates to:
  /// **'New delivery'**
  String get delivery_request_title;

  /// No description provided for @delivery_request_expires.
  ///
  /// In en, this message translates to:
  /// **'Offer expires in {seconds}s'**
  String delivery_request_expires(Object seconds);

  /// No description provided for @delivery_request_amount.
  ///
  /// In en, this message translates to:
  /// **'Delivery fee'**
  String get delivery_request_amount;

  /// No description provided for @delivery_request_pickup.
  ///
  /// In en, this message translates to:
  /// **'Pickup'**
  String get delivery_request_pickup;

  /// No description provided for @delivery_request_dropoff.
  ///
  /// In en, this message translates to:
  /// **'Drop-off'**
  String get delivery_request_dropoff;

  /// No description provided for @delivery_request_distance.
  ///
  /// In en, this message translates to:
  /// **'Distance'**
  String get delivery_request_distance;

  /// No description provided for @delivery_request_ignore.
  ///
  /// In en, this message translates to:
  /// **'Ignore'**
  String get delivery_request_ignore;

  /// No description provided for @delivery_request_accept.
  ///
  /// In en, this message translates to:
  /// **'Accept - {amount}'**
  String delivery_request_accept(Object amount);

  /// No description provided for @delivery_navigation_title.
  ///
  /// In en, this message translates to:
  /// **'Delivery navigation'**
  String get delivery_navigation_title;

  /// No description provided for @delivery_navigation_map.
  ///
  /// In en, this message translates to:
  /// **'Google Maps'**
  String get delivery_navigation_map;

  /// No description provided for @delivery_navigation_route.
  ///
  /// In en, this message translates to:
  /// **'Route: {from} to {to}'**
  String delivery_navigation_route(Object from, Object to);

  /// No description provided for @delivery_navigation_pickup.
  ///
  /// In en, this message translates to:
  /// **'Pickup'**
  String get delivery_navigation_pickup;

  /// No description provided for @delivery_navigation_delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get delivery_navigation_delivery;

  /// No description provided for @delivery_navigation_finalize.
  ///
  /// In en, this message translates to:
  /// **'Finalize'**
  String get delivery_navigation_finalize;

  /// No description provided for @delivery_navigation_scan_pickup.
  ///
  /// In en, this message translates to:
  /// **'Scan QR - Pickup'**
  String get delivery_navigation_scan_pickup;

  /// No description provided for @delivery_pickup_title.
  ///
  /// In en, this message translates to:
  /// **'Package pickup'**
  String get delivery_pickup_title;

  /// No description provided for @delivery_pickup_desc.
  ///
  /// In en, this message translates to:
  /// **'Scan the seller\'s QR code to confirm pickup.'**
  String get delivery_pickup_desc;

  /// No description provided for @delivery_pickup_scan.
  ///
  /// In en, this message translates to:
  /// **'Tap to scan'**
  String get delivery_pickup_scan;

  /// No description provided for @delivery_pickup_or.
  ///
  /// In en, this message translates to:
  /// **'Or enter code'**
  String get delivery_pickup_or;

  /// No description provided for @delivery_pickup_code_hint.
  ///
  /// In en, this message translates to:
  /// **'Ex: OKB-2024-001'**
  String get delivery_pickup_code_hint;

  /// No description provided for @delivery_pickup_photo.
  ///
  /// In en, this message translates to:
  /// **'Package photo'**
  String get delivery_pickup_photo;

  /// No description provided for @delivery_pickup_add_photo.
  ///
  /// In en, this message translates to:
  /// **'Add a photo'**
  String get delivery_pickup_add_photo;

  /// No description provided for @delivery_pickup_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm pickup'**
  String get delivery_pickup_confirm;

  /// No description provided for @delivery_dropoff_title.
  ///
  /// In en, this message translates to:
  /// **'Delivery complete'**
  String get delivery_dropoff_title;

  /// No description provided for @delivery_dropoff_success.
  ///
  /// In en, this message translates to:
  /// **'Package delivered successfully!'**
  String get delivery_dropoff_success;

  /// No description provided for @delivery_dropoff_earned.
  ///
  /// In en, this message translates to:
  /// **'{amount} FCFA added to your balance'**
  String delivery_dropoff_earned(Object amount);

  /// No description provided for @delivery_dropoff_scan_client.
  ///
  /// In en, this message translates to:
  /// **'Scan client QR code'**
  String get delivery_dropoff_scan_client;

  /// No description provided for @delivery_dropoff_photo.
  ///
  /// In en, this message translates to:
  /// **'Proof photo'**
  String get delivery_dropoff_photo;

  /// No description provided for @delivery_dropoff_add_photo.
  ///
  /// In en, this message translates to:
  /// **'Add a photo'**
  String get delivery_dropoff_add_photo;

  /// No description provided for @delivery_dropoff_signature.
  ///
  /// In en, this message translates to:
  /// **'Client signature'**
  String get delivery_dropoff_signature;

  /// No description provided for @delivery_dropoff_signature_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Signature area (to integrate)'**
  String get delivery_dropoff_signature_placeholder;

  /// No description provided for @delivery_dropoff_finalize.
  ///
  /// In en, this message translates to:
  /// **'Finalize delivery'**
  String get delivery_dropoff_finalize;

  /// No description provided for @wallet_balance.
  ///
  /// In en, this message translates to:
  /// **'My balance'**
  String get wallet_balance;

  /// No description provided for @wallet_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get wallet_pending;

  /// No description provided for @wallet_withdraw.
  ///
  /// In en, this message translates to:
  /// **'Withdraw'**
  String get wallet_withdraw;

  /// No description provided for @wallet_history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get wallet_history;

  /// No description provided for @wallet_withdraw_to.
  ///
  /// In en, this message translates to:
  /// **'Withdraw to'**
  String get wallet_withdraw_to;

  /// No description provided for @wallet_principal.
  ///
  /// In en, this message translates to:
  /// **'Principal'**
  String get wallet_principal;

  /// No description provided for @chat_title.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get chat_title;

  /// No description provided for @chat_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Write a message...'**
  String get chat_placeholder;

  /// No description provided for @chat_negotiate.
  ///
  /// In en, this message translates to:
  /// **'Negotiate'**
  String get chat_negotiate;

  /// No description provided for @chat_offer.
  ///
  /// In en, this message translates to:
  /// **'Make an offer'**
  String get chat_offer;

  /// No description provided for @chat_accept.
  ///
  /// In en, this message translates to:
  /// **'Accept'**
  String get chat_accept;

  /// No description provided for @chat_refuse.
  ///
  /// In en, this message translates to:
  /// **'Decline'**
  String get chat_refuse;

  /// No description provided for @chat_counter.
  ///
  /// In en, this message translates to:
  /// **'Counter-offer'**
  String get chat_counter;

  /// No description provided for @chat_offer_price.
  ///
  /// In en, this message translates to:
  /// **'Proposed price: {price}'**
  String chat_offer_price(Object price);

  /// No description provided for @chat_offer_original_price.
  ///
  /// In en, this message translates to:
  /// **'Original price:'**
  String get chat_offer_original_price;

  /// No description provided for @chat_offer_proposal.
  ///
  /// In en, this message translates to:
  /// **'Proposal'**
  String get chat_offer_proposal;

  /// No description provided for @chat_offer_waiting.
  ///
  /// In en, this message translates to:
  /// **'Waiting for response'**
  String get chat_offer_waiting;

  /// No description provided for @chat_offer_accepted.
  ///
  /// In en, this message translates to:
  /// **'Offer accepted'**
  String get chat_offer_accepted;

  /// No description provided for @chat_offer_refused.
  ///
  /// In en, this message translates to:
  /// **'Offer declined'**
  String get chat_offer_refused;

  /// No description provided for @chat_offer_new_proposal.
  ///
  /// In en, this message translates to:
  /// **'New proposal received'**
  String get chat_offer_new_proposal;

  /// No description provided for @chat_support_title.
  ///
  /// In en, this message translates to:
  /// **'Okiba Support'**
  String get chat_support_title;

  /// No description provided for @chat_support_online.
  ///
  /// In en, this message translates to:
  /// **'Online'**
  String get chat_support_online;

  /// No description provided for @chat_support_ticket.
  ///
  /// In en, this message translates to:
  /// **'Ticket #{ticket}'**
  String chat_support_ticket(Object ticket);

  /// No description provided for @chat_support_processing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get chat_support_processing;

  /// No description provided for @chat_support_open.
  ///
  /// In en, this message translates to:
  /// **'Open'**
  String get chat_support_open;

  /// No description provided for @chat_support_greeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, how can I help you?'**
  String get chat_support_greeting;

  /// No description provided for @chat_support_quick_reply_late.
  ///
  /// In en, this message translates to:
  /// **'Late delivery'**
  String get chat_support_quick_reply_late;

  /// No description provided for @chat_support_quick_reply_defective.
  ///
  /// In en, this message translates to:
  /// **'Defective product'**
  String get chat_support_quick_reply_defective;

  /// No description provided for @chat_support_quick_reply_payment.
  ///
  /// In en, this message translates to:
  /// **'Payment issue'**
  String get chat_support_quick_reply_payment;

  /// No description provided for @chat_support_quick_reply_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel order'**
  String get chat_support_quick_reply_cancel;

  /// No description provided for @chat_support_quick_reply_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get chat_support_quick_reply_other;

  /// No description provided for @chat_support_input_placeholder.
  ///
  /// In en, this message translates to:
  /// **'Write your message...'**
  String get chat_support_input_placeholder;

  /// No description provided for @chat_support_view_ticket.
  ///
  /// In en, this message translates to:
  /// **'View ticket'**
  String get chat_support_view_ticket;

  /// No description provided for @chat_support_attach_photo.
  ///
  /// In en, this message translates to:
  /// **'Attach photo'**
  String get chat_support_attach_photo;

  /// No description provided for @chat_support_close_ticket.
  ///
  /// In en, this message translates to:
  /// **'Close ticket'**
  String get chat_support_close_ticket;

  /// No description provided for @review_title.
  ///
  /// In en, this message translates to:
  /// **'Review'**
  String get review_title;

  /// No description provided for @review_rating.
  ///
  /// In en, this message translates to:
  /// **'Rating'**
  String get review_rating;

  /// No description provided for @review_comment.
  ///
  /// In en, this message translates to:
  /// **'Comment'**
  String get review_comment;

  /// No description provided for @review_photo.
  ///
  /// In en, this message translates to:
  /// **'Add photo'**
  String get review_photo;

  /// No description provided for @review_submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get review_submit;

  /// No description provided for @notifications_title.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications_title;

  /// No description provided for @notifications_empty.
  ///
  /// In en, this message translates to:
  /// **'No notifications'**
  String get notifications_empty;

  /// No description provided for @notifications_mark_all_read.
  ///
  /// In en, this message translates to:
  /// **'Mark all read'**
  String get notifications_mark_all_read;

  /// No description provided for @notifications_today.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get notifications_today;

  /// No description provided for @notifications_yesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get notifications_yesterday;

  /// No description provided for @notifications_this_week.
  ///
  /// In en, this message translates to:
  /// **'This week'**
  String get notifications_this_week;

  /// No description provided for @notifications_earlier.
  ///
  /// In en, this message translates to:
  /// **'Earlier'**
  String get notifications_earlier;

  /// No description provided for @notifications_detail_title.
  ///
  /// In en, this message translates to:
  /// **'Notification'**
  String get notifications_detail_title;

  /// No description provided for @notifications_detail_details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get notifications_detail_details;

  /// No description provided for @notifications_detail_order.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get notifications_detail_order;

  /// No description provided for @notifications_detail_number.
  ///
  /// In en, this message translates to:
  /// **'Number'**
  String get notifications_detail_number;

  /// No description provided for @notifications_detail_status.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get notifications_detail_status;

  /// No description provided for @notifications_detail_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get notifications_detail_total;

  /// No description provided for @notifications_detail_seller.
  ///
  /// In en, this message translates to:
  /// **'Seller'**
  String get notifications_detail_seller;

  /// No description provided for @notifications_detail_view_order.
  ///
  /// In en, this message translates to:
  /// **'View order'**
  String get notifications_detail_view_order;

  /// No description provided for @notifications_type_order_confirmed.
  ///
  /// In en, this message translates to:
  /// **'Order confirmed'**
  String get notifications_type_order_confirmed;

  /// No description provided for @notifications_type_delivery_in_progress.
  ///
  /// In en, this message translates to:
  /// **'Delivery in progress'**
  String get notifications_type_delivery_in_progress;

  /// No description provided for @notifications_type_new_message.
  ///
  /// In en, this message translates to:
  /// **'New message'**
  String get notifications_type_new_message;

  /// No description provided for @notifications_type_payment_received.
  ///
  /// In en, this message translates to:
  /// **'Payment received'**
  String get notifications_type_payment_received;

  /// No description provided for @notifications_type_new_review.
  ///
  /// In en, this message translates to:
  /// **'New review'**
  String get notifications_type_new_review;

  /// No description provided for @notifications_type_promotion.
  ///
  /// In en, this message translates to:
  /// **'Promotion'**
  String get notifications_type_promotion;

  /// No description provided for @notifications_type_low_stock.
  ///
  /// In en, this message translates to:
  /// **'Low stock alert'**
  String get notifications_type_low_stock;

  /// No description provided for @notifications_type_welcome.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Okiba!'**
  String get notifications_type_welcome;

  /// No description provided for @profile_title.
  ///
  /// In en, this message translates to:
  /// **'My profile'**
  String get profile_title;

  /// No description provided for @profile_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get profile_edit;

  /// No description provided for @profile_orders.
  ///
  /// In en, this message translates to:
  /// **'My orders'**
  String get profile_orders;

  /// No description provided for @profile_favorites.
  ///
  /// In en, this message translates to:
  /// **'Favorites'**
  String get profile_favorites;

  /// No description provided for @profile_payment.
  ///
  /// In en, this message translates to:
  /// **'Payment methods'**
  String get profile_payment;

  /// No description provided for @profile_addresses.
  ///
  /// In en, this message translates to:
  /// **'My addresses'**
  String get profile_addresses;

  /// No description provided for @profile_settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get profile_settings;

  /// No description provided for @profile_help.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get profile_help;

  /// No description provided for @profile_logout.
  ///
  /// In en, this message translates to:
  /// **'Logout'**
  String get profile_logout;

  /// No description provided for @profile_role_client.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get profile_role_client;

  /// No description provided for @profile_role_seller.
  ///
  /// In en, this message translates to:
  /// **'Seller'**
  String get profile_role_seller;

  /// No description provided for @profile_role_delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get profile_role_delivery;

  /// No description provided for @profile_logged_in_as.
  ///
  /// In en, this message translates to:
  /// **'You are logged in as {role}'**
  String profile_logged_in_as(Object role);

  /// No description provided for @profile_notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get profile_notifications;

  /// No description provided for @profile_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profile_language;

  /// No description provided for @profile_low_data_mode.
  ///
  /// In en, this message translates to:
  /// **'Low data mode'**
  String get profile_low_data_mode;

  /// No description provided for @profile_privacy_security.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get profile_privacy_security;

  /// No description provided for @profile_social.
  ///
  /// In en, this message translates to:
  /// **'Social'**
  String get profile_social;

  /// No description provided for @profile_referral.
  ///
  /// In en, this message translates to:
  /// **'Referral'**
  String get profile_referral;

  /// No description provided for @profile_referral_earn.
  ///
  /// In en, this message translates to:
  /// **'Earn {amount} per friend'**
  String profile_referral_earn(Object amount);

  /// No description provided for @profile_support.
  ///
  /// In en, this message translates to:
  /// **'Support'**
  String get profile_support;

  /// No description provided for @profile_about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get profile_about;

  /// No description provided for @profile_version.
  ///
  /// In en, this message translates to:
  /// **'Version {version}'**
  String profile_version(Object version);

  /// No description provided for @profile_account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get profile_account;

  /// No description provided for @profile_delete_account.
  ///
  /// In en, this message translates to:
  /// **'Delete my account'**
  String get profile_delete_account;

  /// No description provided for @profile_logout_action.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get profile_logout_action;

  /// No description provided for @profile_edit_title.
  ///
  /// In en, this message translates to:
  /// **'Edit profile'**
  String get profile_edit_title;

  /// No description provided for @profile_edit_name.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get profile_edit_name;

  /// No description provided for @profile_edit_name_required.
  ///
  /// In en, this message translates to:
  /// **'Name required'**
  String get profile_edit_name_required;

  /// No description provided for @profile_edit_bio.
  ///
  /// In en, this message translates to:
  /// **'Bio'**
  String get profile_edit_bio;

  /// No description provided for @profile_edit_phone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get profile_edit_phone;

  /// No description provided for @profile_edit_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profile_edit_email;

  /// No description provided for @profile_edit_location.
  ///
  /// In en, this message translates to:
  /// **'Update my location'**
  String get profile_edit_location;

  /// No description provided for @profile_language_title.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get profile_language_title;

  /// No description provided for @profile_language_choose.
  ///
  /// In en, this message translates to:
  /// **'Choose your preferred language'**
  String get profile_language_choose;

  /// No description provided for @profile_language_default.
  ///
  /// In en, this message translates to:
  /// **'Default language'**
  String get profile_language_default;

  /// No description provided for @profile_low_data_title.
  ///
  /// In en, this message translates to:
  /// **'Low data mode'**
  String get profile_low_data_title;

  /// No description provided for @profile_low_data_desc.
  ///
  /// In en, this message translates to:
  /// **'Reduce mobile data consumption'**
  String get profile_low_data_desc;

  /// No description provided for @profile_low_data_enable.
  ///
  /// In en, this message translates to:
  /// **'Enable image compression'**
  String get profile_low_data_enable;

  /// No description provided for @profile_low_data_low_res.
  ///
  /// In en, this message translates to:
  /// **'Low resolution images'**
  String get profile_low_data_low_res;

  /// No description provided for @profile_low_data_no_auto_video.
  ///
  /// In en, this message translates to:
  /// **'Disable auto-play videos'**
  String get profile_low_data_no_auto_video;

  /// No description provided for @profile_low_data_offline.
  ///
  /// In en, this message translates to:
  /// **'Download only on Wi-Fi'**
  String get profile_low_data_offline;

  /// No description provided for @profile_low_data_saved.
  ///
  /// In en, this message translates to:
  /// **'Data saved'**
  String get profile_low_data_saved;

  /// No description provided for @profile_low_data_saved_desc.
  ///
  /// In en, this message translates to:
  /// **'{mb} MB • {percent}% saved this week'**
  String profile_low_data_saved_desc(Object mb, Object percent);

  /// No description provided for @profile_notification_settings_title.
  ///
  /// In en, this message translates to:
  /// **'Notification settings'**
  String get profile_notification_settings_title;

  /// No description provided for @profile_notif_push.
  ///
  /// In en, this message translates to:
  /// **'Push'**
  String get profile_notif_push;

  /// No description provided for @profile_notif_orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get profile_notif_orders;

  /// No description provided for @profile_notif_orders_desc.
  ///
  /// In en, this message translates to:
  /// **'Confirmation and status alerts'**
  String get profile_notif_orders_desc;

  /// No description provided for @profile_notif_promotions.
  ///
  /// In en, this message translates to:
  /// **'Promotions'**
  String get profile_notif_promotions;

  /// No description provided for @profile_notif_promotions_desc.
  ///
  /// In en, this message translates to:
  /// **'Offers and discounts'**
  String get profile_notif_promotions_desc;

  /// No description provided for @profile_notif_chat.
  ///
  /// In en, this message translates to:
  /// **'Chat'**
  String get profile_notif_chat;

  /// No description provided for @profile_notif_chat_desc.
  ///
  /// In en, this message translates to:
  /// **'New messages'**
  String get profile_notif_chat_desc;

  /// No description provided for @profile_notif_delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get profile_notif_delivery;

  /// No description provided for @profile_notif_delivery_desc.
  ///
  /// In en, this message translates to:
  /// **'Delivery updates'**
  String get profile_notif_delivery_desc;

  /// No description provided for @profile_notif_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get profile_notif_email;

  /// No description provided for @profile_notif_email_confirmations.
  ///
  /// In en, this message translates to:
  /// **'Order confirmations'**
  String get profile_notif_email_confirmations;

  /// No description provided for @profile_notif_email_confirmations_desc.
  ///
  /// In en, this message translates to:
  /// **'Receipt by email'**
  String get profile_notif_email_confirmations_desc;

  /// No description provided for @profile_notif_email_newsletter.
  ///
  /// In en, this message translates to:
  /// **'Weekly newsletter'**
  String get profile_notif_email_newsletter;

  /// No description provided for @profile_notif_email_newsletter_desc.
  ///
  /// In en, this message translates to:
  /// **'Week summary'**
  String get profile_notif_email_newsletter_desc;

  /// No description provided for @profile_notif_sms.
  ///
  /// In en, this message translates to:
  /// **'SMS'**
  String get profile_notif_sms;

  /// No description provided for @profile_notif_sms_delivery.
  ///
  /// In en, this message translates to:
  /// **'Delivery notifications'**
  String get profile_notif_sms_delivery;

  /// No description provided for @profile_notif_sms_otp.
  ///
  /// In en, this message translates to:
  /// **'OTP'**
  String get profile_notif_sms_otp;

  /// No description provided for @profile_notif_sms_otp_desc.
  ///
  /// In en, this message translates to:
  /// **'Verification codes'**
  String get profile_notif_sms_otp_desc;

  /// No description provided for @profile_privacy_title.
  ///
  /// In en, this message translates to:
  /// **'Privacy & security'**
  String get profile_privacy_title;

  /// No description provided for @profile_privacy_password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get profile_privacy_password;

  /// No description provided for @profile_privacy_password_changed.
  ///
  /// In en, this message translates to:
  /// **'Last changed {time} ago'**
  String profile_privacy_password_changed(Object time);

  /// No description provided for @profile_privacy_fingerprint.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint'**
  String get profile_privacy_fingerprint;

  /// No description provided for @profile_privacy_fingerprint_desc.
  ///
  /// In en, this message translates to:
  /// **'Unlock with your fingerprint'**
  String get profile_privacy_fingerprint_desc;

  /// No description provided for @profile_privacy_2fa.
  ///
  /// In en, this message translates to:
  /// **'Two-factor authentication'**
  String get profile_privacy_2fa;

  /// No description provided for @profile_privacy_2fa_desc.
  ///
  /// In en, this message translates to:
  /// **'Additional code on login'**
  String get profile_privacy_2fa_desc;

  /// No description provided for @profile_privacy_privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy'**
  String get profile_privacy_privacy;

  /// No description provided for @profile_privacy_share_data.
  ///
  /// In en, this message translates to:
  /// **'Share my data'**
  String get profile_privacy_share_data;

  /// No description provided for @profile_privacy_share_data_desc.
  ///
  /// In en, this message translates to:
  /// **'Improve your experience'**
  String get profile_privacy_share_data_desc;

  /// No description provided for @profile_privacy_policy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get profile_privacy_policy;

  /// No description provided for @profile_privacy_download_data.
  ///
  /// In en, this message translates to:
  /// **'Download my data'**
  String get profile_privacy_download_data;

  /// No description provided for @profile_privacy_devices.
  ///
  /// In en, this message translates to:
  /// **'Connected devices'**
  String get profile_privacy_devices;

  /// No description provided for @profile_privacy_change_password.
  ///
  /// In en, this message translates to:
  /// **'Change password'**
  String get profile_privacy_change_password;

  /// No description provided for @profile_privacy_current_password.
  ///
  /// In en, this message translates to:
  /// **'Current password'**
  String get profile_privacy_current_password;

  /// No description provided for @profile_privacy_new_password.
  ///
  /// In en, this message translates to:
  /// **'New password'**
  String get profile_privacy_new_password;

  /// No description provided for @profile_privacy_confirm_password.
  ///
  /// In en, this message translates to:
  /// **'Confirm password'**
  String get profile_privacy_confirm_password;

  /// No description provided for @profile_privacy_update_password.
  ///
  /// In en, this message translates to:
  /// **'Update password'**
  String get profile_privacy_update_password;

  /// No description provided for @profile_payment_title.
  ///
  /// In en, this message translates to:
  /// **'Payment methods'**
  String get profile_payment_title;

  /// No description provided for @profile_payment_mobile_money.
  ///
  /// In en, this message translates to:
  /// **'Mobile Money'**
  String get profile_payment_mobile_money;

  /// No description provided for @profile_payment_cards.
  ///
  /// In en, this message translates to:
  /// **'Bank cards'**
  String get profile_payment_cards;

  /// No description provided for @profile_payment_add_card.
  ///
  /// In en, this message translates to:
  /// **'Add a card'**
  String get profile_payment_add_card;

  /// No description provided for @profile_payment_card_hint.
  ///
  /// In en, this message translates to:
  /// **'Visa, Mastercard'**
  String get profile_payment_card_hint;

  /// No description provided for @profile_payment_cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get profile_payment_cash;

  /// No description provided for @profile_payment_cash_desc.
  ///
  /// In en, this message translates to:
  /// **'Cash on delivery'**
  String get profile_payment_cash_desc;

  /// No description provided for @profile_payment_default.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get profile_payment_default;

  /// No description provided for @profile_address_title.
  ///
  /// In en, this message translates to:
  /// **'My addresses'**
  String get profile_address_title;

  /// No description provided for @profile_address_default.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get profile_address_default;

  /// No description provided for @profile_address_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get profile_address_edit;

  /// No description provided for @profile_address_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get profile_address_delete;

  /// No description provided for @profile_address_set_default.
  ///
  /// In en, this message translates to:
  /// **'Set as default'**
  String get profile_address_set_default;

  /// No description provided for @profile_address_add.
  ///
  /// In en, this message translates to:
  /// **'Add an address'**
  String get profile_address_add;

  /// No description provided for @profile_address_edit_title.
  ///
  /// In en, this message translates to:
  /// **'Edit address'**
  String get profile_address_edit_title;

  /// No description provided for @profile_address_label_hint.
  ///
  /// In en, this message translates to:
  /// **'Label (e.g. Home)'**
  String get profile_address_label_hint;

  /// No description provided for @profile_address_full.
  ///
  /// In en, this message translates to:
  /// **'Full address'**
  String get profile_address_full;

  /// No description provided for @profile_address_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get profile_address_save;

  /// No description provided for @profile_address_new.
  ///
  /// In en, this message translates to:
  /// **'New address'**
  String get profile_address_new;

  /// No description provided for @profile_address_add_action.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get profile_address_add_action;

  /// No description provided for @profile_address_delete_confirm.
  ///
  /// In en, this message translates to:
  /// **'Delete this address?'**
  String get profile_address_delete_confirm;

  /// No description provided for @profile_address_delete_sure.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete \"{label}\"?'**
  String profile_address_delete_sure(Object label);

  /// No description provided for @profile_referral_title.
  ///
  /// In en, this message translates to:
  /// **'Referral'**
  String get profile_referral_title;

  /// No description provided for @profile_referral_subtitle.
  ///
  /// In en, this message translates to:
  /// **'Refer your friends'**
  String get profile_referral_subtitle;

  /// No description provided for @profile_referral_earn_per_friend.
  ///
  /// In en, this message translates to:
  /// **'You earn {amount} per referred friend'**
  String profile_referral_earn_per_friend(Object amount);

  /// No description provided for @profile_referral_code.
  ///
  /// In en, this message translates to:
  /// **'YOUR CODE'**
  String get profile_referral_code;

  /// No description provided for @profile_referral_share.
  ///
  /// In en, this message translates to:
  /// **'Share my code'**
  String get profile_referral_share;

  /// No description provided for @profile_referral_friends.
  ///
  /// In en, this message translates to:
  /// **'Friends referred'**
  String get profile_referral_friends;

  /// No description provided for @profile_referral_earned.
  ///
  /// In en, this message translates to:
  /// **'Earned'**
  String get profile_referral_earned;

  /// No description provided for @profile_referral_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get profile_referral_pending;

  /// No description provided for @profile_referral_how_it_works.
  ///
  /// In en, this message translates to:
  /// **'How it works'**
  String get profile_referral_how_it_works;

  /// No description provided for @profile_referral_step1_title.
  ///
  /// In en, this message translates to:
  /// **'Share your code'**
  String get profile_referral_step1_title;

  /// No description provided for @profile_referral_step1_desc.
  ///
  /// In en, this message translates to:
  /// **'Send your referral code to friends'**
  String get profile_referral_step1_desc;

  /// No description provided for @profile_referral_step2_title.
  ///
  /// In en, this message translates to:
  /// **'They sign up'**
  String get profile_referral_step2_title;

  /// No description provided for @profile_referral_step2_desc.
  ///
  /// In en, this message translates to:
  /// **'Your friend uses your code when registering'**
  String get profile_referral_step2_desc;

  /// No description provided for @profile_referral_step3_title.
  ///
  /// In en, this message translates to:
  /// **'You earn'**
  String get profile_referral_step3_title;

  /// No description provided for @profile_referral_step3_desc.
  ///
  /// In en, this message translates to:
  /// **'After their first order, you receive {amount}'**
  String profile_referral_step3_desc(Object amount);

  /// No description provided for @profile_referral_history.
  ///
  /// In en, this message translates to:
  /// **'History'**
  String get profile_referral_history;

  /// No description provided for @profile_referral_registered.
  ///
  /// In en, this message translates to:
  /// **'Registered'**
  String get profile_referral_registered;

  /// No description provided for @profile_referral_pending_status.
  ///
  /// In en, this message translates to:
  /// **'—'**
  String get profile_referral_pending_status;

  /// No description provided for @profile_about_title.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get profile_about_title;

  /// No description provided for @profile_about_version.
  ///
  /// In en, this message translates to:
  /// **'Version {version} (build {build})'**
  String profile_about_version(Object build, Object version);

  /// No description provided for @profile_about_terms.
  ///
  /// In en, this message translates to:
  /// **'Terms of service'**
  String get profile_about_terms;

  /// No description provided for @profile_about_privacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy policy'**
  String get profile_about_privacy;

  /// No description provided for @profile_about_legal.
  ///
  /// In en, this message translates to:
  /// **'Legal notice'**
  String get profile_about_legal;

  /// No description provided for @profile_about_licenses.
  ///
  /// In en, this message translates to:
  /// **'Open source licenses'**
  String get profile_about_licenses;

  /// No description provided for @profile_about_rate.
  ///
  /// In en, this message translates to:
  /// **'Rate the app'**
  String get profile_about_rate;

  /// No description provided for @profile_about_report.
  ///
  /// In en, this message translates to:
  /// **'Report a bug'**
  String get profile_about_report;

  /// No description provided for @profile_about_made_in.
  ///
  /// In en, this message translates to:
  /// **'Made with ❤ in Gabon'**
  String get profile_about_made_in;

  /// No description provided for @profile_delete_account_title.
  ///
  /// In en, this message translates to:
  /// **'Delete my account'**
  String get profile_delete_account_title;

  /// No description provided for @profile_delete_account_warning.
  ///
  /// In en, this message translates to:
  /// **'Warning'**
  String get profile_delete_account_warning;

  /// No description provided for @profile_delete_account_irreversible.
  ///
  /// In en, this message translates to:
  /// **'This action is irreversible. All your data will be deleted after 30 days.'**
  String get profile_delete_account_irreversible;

  /// No description provided for @profile_delete_account_why.
  ///
  /// In en, this message translates to:
  /// **'Why are you deleting your account?'**
  String get profile_delete_account_why;

  /// No description provided for @profile_delete_account_not_using.
  ///
  /// In en, this message translates to:
  /// **'I no longer use the app'**
  String get profile_delete_account_not_using;

  /// No description provided for @profile_delete_account_too_many_notif.
  ///
  /// In en, this message translates to:
  /// **'Too many notifications'**
  String get profile_delete_account_too_many_notif;

  /// No description provided for @profile_delete_account_delivery_issues.
  ///
  /// In en, this message translates to:
  /// **'Delivery issues'**
  String get profile_delete_account_delivery_issues;

  /// No description provided for @profile_delete_account_payment_issues.
  ///
  /// In en, this message translates to:
  /// **'Payment issues'**
  String get profile_delete_account_payment_issues;

  /// No description provided for @profile_delete_account_new_account.
  ///
  /// In en, this message translates to:
  /// **'I\'m creating a new account'**
  String get profile_delete_account_new_account;

  /// No description provided for @profile_delete_account_other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get profile_delete_account_other;

  /// No description provided for @profile_delete_account_understand.
  ///
  /// In en, this message translates to:
  /// **'I understand this action is irreversible'**
  String get profile_delete_account_understand;

  /// No description provided for @profile_delete_account_button.
  ///
  /// In en, this message translates to:
  /// **'Delete my account'**
  String get profile_delete_account_button;

  /// No description provided for @profile_delete_account_last_step.
  ///
  /// In en, this message translates to:
  /// **'Final step'**
  String get profile_delete_account_last_step;

  /// No description provided for @profile_delete_account_last_step_desc.
  ///
  /// In en, this message translates to:
  /// **'Your account will be permanently deleted after 30 days.'**
  String get profile_delete_account_last_step_desc;

  /// No description provided for @profile_delete_account_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm deletion'**
  String get profile_delete_account_confirm;

  /// No description provided for @profile_accessibility_title.
  ///
  /// In en, this message translates to:
  /// **'Accessibility'**
  String get profile_accessibility_title;

  /// No description provided for @profile_accessibility_display.
  ///
  /// In en, this message translates to:
  /// **'Display'**
  String get profile_accessibility_display;

  /// No description provided for @profile_accessibility_text_size.
  ///
  /// In en, this message translates to:
  /// **'Text size'**
  String get profile_accessibility_text_size;

  /// No description provided for @profile_accessibility_high_contrast.
  ///
  /// In en, this message translates to:
  /// **'High contrast'**
  String get profile_accessibility_high_contrast;

  /// No description provided for @profile_accessibility_high_contrast_desc.
  ///
  /// In en, this message translates to:
  /// **'Improves readability'**
  String get profile_accessibility_high_contrast_desc;

  /// No description provided for @profile_accessibility_reduce_animations.
  ///
  /// In en, this message translates to:
  /// **'Reduce animations'**
  String get profile_accessibility_reduce_animations;

  /// No description provided for @profile_accessibility_reduce_animations_desc.
  ///
  /// In en, this message translates to:
  /// **'Decreases motion'**
  String get profile_accessibility_reduce_animations_desc;

  /// No description provided for @profile_accessibility_large_touch.
  ///
  /// In en, this message translates to:
  /// **'Large touch targets'**
  String get profile_accessibility_large_touch;

  /// No description provided for @profile_accessibility_large_touch_desc.
  ///
  /// In en, this message translates to:
  /// **'Minimum 56dp for buttons'**
  String get profile_accessibility_large_touch_desc;

  /// No description provided for @profile_accessibility_preview.
  ///
  /// In en, this message translates to:
  /// **'Preview'**
  String get profile_accessibility_preview;

  /// No description provided for @profile_accessibility_preview_text.
  ///
  /// In en, this message translates to:
  /// **'This is a sample text with the selected size and settings.'**
  String get profile_accessibility_preview_text;

  /// No description provided for @settings_title.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings_title;

  /// No description provided for @settings_language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settings_language;

  /// No description provided for @settings_language_fr.
  ///
  /// In en, this message translates to:
  /// **'Français'**
  String get settings_language_fr;

  /// No description provided for @settings_language_en.
  ///
  /// In en, this message translates to:
  /// **'English'**
  String get settings_language_en;

  /// No description provided for @settings_dark_mode.
  ///
  /// In en, this message translates to:
  /// **'Dark mode'**
  String get settings_dark_mode;

  /// No description provided for @settings_low_bandwidth.
  ///
  /// In en, this message translates to:
  /// **'Low bandwidth mode'**
  String get settings_low_bandwidth;

  /// No description provided for @settings_notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get settings_notifications;

  /// No description provided for @settings_about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get settings_about;

  /// No description provided for @help_title.
  ///
  /// In en, this message translates to:
  /// **'Help'**
  String get help_title;

  /// No description provided for @help_need_help.
  ///
  /// In en, this message translates to:
  /// **'Need help?'**
  String get help_need_help;

  /// No description provided for @help_team_here.
  ///
  /// In en, this message translates to:
  /// **'Our team is here for you'**
  String get help_team_here;

  /// No description provided for @help_contact.
  ///
  /// In en, this message translates to:
  /// **'Contact support'**
  String get help_contact;

  /// No description provided for @help_faq.
  ///
  /// In en, this message translates to:
  /// **'Frequently asked questions'**
  String get help_faq;

  /// No description provided for @help_faq_order.
  ///
  /// In en, this message translates to:
  /// **'How do I place an order?'**
  String get help_faq_order;

  /// No description provided for @help_faq_order_ans.
  ///
  /// In en, this message translates to:
  /// **'Select a product, add it to your cart, and proceed to checkout.'**
  String get help_faq_order_ans;

  /// No description provided for @help_faq_payment.
  ///
  /// In en, this message translates to:
  /// **'What payment methods are accepted?'**
  String get help_faq_payment;

  /// No description provided for @help_faq_payment_ans.
  ///
  /// In en, this message translates to:
  /// **'We accept Orange Money, MTN MoMo, Airtel Money, card, and cash on delivery.'**
  String get help_faq_payment_ans;

  /// No description provided for @help_faq_delivery.
  ///
  /// In en, this message translates to:
  /// **'How does delivery work?'**
  String get help_faq_delivery;

  /// No description provided for @help_faq_delivery_ans.
  ///
  /// In en, this message translates to:
  /// **'Delivery is handled by our partner delivery drivers.'**
  String get help_faq_delivery_ans;

  /// No description provided for @help_faq_return.
  ///
  /// In en, this message translates to:
  /// **'Can I return a product?'**
  String get help_faq_return;

  /// No description provided for @help_faq_return_ans.
  ///
  /// In en, this message translates to:
  /// **'Yes, within 14 days of receipt.'**
  String get help_faq_return_ans;

  /// No description provided for @help_faq_seller.
  ///
  /// In en, this message translates to:
  /// **'How do I become a seller?'**
  String get help_faq_seller;

  /// No description provided for @help_faq_seller_ans.
  ///
  /// In en, this message translates to:
  /// **'Go to your profile and select \"Become a seller\".'**
  String get help_faq_seller_ans;

  /// No description provided for @help_contact_email.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get help_contact_email;

  /// No description provided for @help_contact_whatsapp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get help_contact_whatsapp;

  /// No description provided for @help_contact_call.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get help_contact_call;

  /// No description provided for @admin_title.
  ///
  /// In en, this message translates to:
  /// **'Admin'**
  String get admin_title;

  /// No description provided for @admin_overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get admin_overview;

  /// No description provided for @admin_users.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get admin_users;

  /// No description provided for @admin_orders.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get admin_orders;

  /// No description provided for @admin_revenue.
  ///
  /// In en, this message translates to:
  /// **'Revenue'**
  String get admin_revenue;

  /// No description provided for @admin_disputes.
  ///
  /// In en, this message translates to:
  /// **'Disputes'**
  String get admin_disputes;

  /// No description provided for @admin_recent_orders.
  ///
  /// In en, this message translates to:
  /// **'Recent orders'**
  String get admin_recent_orders;

  /// No description provided for @admin_actions.
  ///
  /// In en, this message translates to:
  /// **'Actions'**
  String get admin_actions;

  /// No description provided for @admin_kyc.
  ///
  /// In en, this message translates to:
  /// **'KYC'**
  String get admin_kyc;

  /// No description provided for @admin_orders_title.
  ///
  /// In en, this message translates to:
  /// **'Orders'**
  String get admin_orders_title;

  /// No description provided for @admin_orders_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get admin_orders_all;

  /// No description provided for @admin_orders_disputes.
  ///
  /// In en, this message translates to:
  /// **'Disputes'**
  String get admin_orders_disputes;

  /// No description provided for @admin_orders_refunds.
  ///
  /// In en, this message translates to:
  /// **'Refunds'**
  String get admin_orders_refunds;

  /// No description provided for @admin_orders_reason_not_conforming.
  ///
  /// In en, this message translates to:
  /// **'Product not as described'**
  String get admin_orders_reason_not_conforming;

  /// No description provided for @admin_orders_reason_not_received.
  ///
  /// In en, this message translates to:
  /// **'Delivery not received'**
  String get admin_orders_reason_not_received;

  /// No description provided for @admin_orders_reason_damaged.
  ///
  /// In en, this message translates to:
  /// **'Damaged item'**
  String get admin_orders_reason_damaged;

  /// No description provided for @admin_orders_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get admin_orders_pending;

  /// No description provided for @admin_orders_resolved.
  ///
  /// In en, this message translates to:
  /// **'Resolved'**
  String get admin_orders_resolved;

  /// No description provided for @admin_orders_refunded.
  ///
  /// In en, this message translates to:
  /// **'Refunded'**
  String get admin_orders_refunded;

  /// No description provided for @admin_orders_processing.
  ///
  /// In en, this message translates to:
  /// **'Processing'**
  String get admin_orders_processing;

  /// No description provided for @admin_orders_reason.
  ///
  /// In en, this message translates to:
  /// **'Reason:'**
  String get admin_orders_reason;

  /// No description provided for @admin_orders_resolve.
  ///
  /// In en, this message translates to:
  /// **'Resolve'**
  String get admin_orders_resolve;

  /// No description provided for @admin_orders_refund.
  ///
  /// In en, this message translates to:
  /// **'Refund'**
  String get admin_orders_refund;

  /// No description provided for @admin_users_title.
  ///
  /// In en, this message translates to:
  /// **'Users'**
  String get admin_users_title;

  /// No description provided for @admin_users_total.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get admin_users_total;

  /// No description provided for @admin_users_clients.
  ///
  /// In en, this message translates to:
  /// **'Clients'**
  String get admin_users_clients;

  /// No description provided for @admin_users_sellers.
  ///
  /// In en, this message translates to:
  /// **'Sellers'**
  String get admin_users_sellers;

  /// No description provided for @admin_users_drivers.
  ///
  /// In en, this message translates to:
  /// **'Delivery'**
  String get admin_users_drivers;

  /// No description provided for @admin_users_all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get admin_users_all;

  /// No description provided for @admin_users_active.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get admin_users_active;

  /// No description provided for @admin_users_suspended.
  ///
  /// In en, this message translates to:
  /// **'Suspended'**
  String get admin_users_suspended;

  /// No description provided for @admin_users_pending_kyc.
  ///
  /// In en, this message translates to:
  /// **'Pending KYC'**
  String get admin_users_pending_kyc;

  /// No description provided for @admin_users_view_profile.
  ///
  /// In en, this message translates to:
  /// **'View profile'**
  String get admin_users_view_profile;

  /// No description provided for @admin_users_suspend.
  ///
  /// In en, this message translates to:
  /// **'Suspend'**
  String get admin_users_suspend;

  /// No description provided for @admin_users_reactivate.
  ///
  /// In en, this message translates to:
  /// **'Reactivate'**
  String get admin_users_reactivate;

  /// No description provided for @admin_users_verify_kyc.
  ///
  /// In en, this message translates to:
  /// **'Verify KYC'**
  String get admin_users_verify_kyc;

  /// No description provided for @admin_users_delete_user.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get admin_users_delete_user;

  /// No description provided for @admin_kyc_title.
  ///
  /// In en, this message translates to:
  /// **'KYC verification'**
  String get admin_kyc_title;

  /// No description provided for @admin_kyc_pending.
  ///
  /// In en, this message translates to:
  /// **'Pending'**
  String get admin_kyc_pending;

  /// No description provided for @admin_kyc_approved.
  ///
  /// In en, this message translates to:
  /// **'Approved'**
  String get admin_kyc_approved;

  /// No description provided for @admin_kyc_rejected.
  ///
  /// In en, this message translates to:
  /// **'Rejected'**
  String get admin_kyc_rejected;

  /// No description provided for @admin_kyc_submitted.
  ///
  /// In en, this message translates to:
  /// **'Submitted {date}'**
  String admin_kyc_submitted(Object date);

  /// No description provided for @admin_kyc_selfie.
  ///
  /// In en, this message translates to:
  /// **'Selfie'**
  String get admin_kyc_selfie;

  /// No description provided for @admin_kyc_id_front.
  ///
  /// In en, this message translates to:
  /// **'ID front'**
  String get admin_kyc_id_front;

  /// No description provided for @admin_kyc_id_back.
  ///
  /// In en, this message translates to:
  /// **'ID back'**
  String get admin_kyc_id_back;

  /// No description provided for @admin_kyc_approve.
  ///
  /// In en, this message translates to:
  /// **'Approve'**
  String get admin_kyc_approve;

  /// No description provided for @admin_kyc_reject.
  ///
  /// In en, this message translates to:
  /// **'Reject'**
  String get admin_kyc_reject;

  /// No description provided for @admin_kyc_reject_title.
  ///
  /// In en, this message translates to:
  /// **'Reject verification'**
  String get admin_kyc_reject_title;

  /// No description provided for @admin_kyc_reject_reason.
  ///
  /// In en, this message translates to:
  /// **'Rejection reason for {name}:'**
  String admin_kyc_reject_reason(Object name);

  /// No description provided for @admin_kyc_reject_hint.
  ///
  /// In en, this message translates to:
  /// **'Illegible document, missing photo...'**
  String get admin_kyc_reject_hint;

  /// No description provided for @general_confirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get general_confirm;

  /// No description provided for @general_cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get general_cancel;

  /// No description provided for @general_save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get general_save;

  /// No description provided for @general_delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get general_delete;

  /// No description provided for @general_search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get general_search;

  /// No description provided for @general_loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get general_loading;

  /// No description provided for @general_error.
  ///
  /// In en, this message translates to:
  /// **'An error occurred'**
  String get general_error;

  /// No description provided for @general_retry.
  ///
  /// In en, this message translates to:
  /// **'Retry'**
  String get general_retry;

  /// No description provided for @general_no_internet.
  ///
  /// In en, this message translates to:
  /// **'No Internet connection'**
  String get general_no_internet;

  /// No description provided for @general_offline.
  ///
  /// In en, this message translates to:
  /// **'Offline mode'**
  String get general_offline;

  /// No description provided for @general_filters.
  ///
  /// In en, this message translates to:
  /// **'Filters'**
  String get general_filters;

  /// No description provided for @general_sort.
  ///
  /// In en, this message translates to:
  /// **'Sort'**
  String get general_sort;

  /// No description provided for @general_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get general_close;

  /// No description provided for @general_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get general_yes;

  /// No description provided for @general_no.
  ///
  /// In en, this message translates to:
  /// **'No'**
  String get general_no;

  /// No description provided for @general_ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get general_ok;

  /// No description provided for @general_success.
  ///
  /// In en, this message translates to:
  /// **'Success'**
  String get general_success;

  /// No description provided for @general_submit.
  ///
  /// In en, this message translates to:
  /// **'Submit'**
  String get general_submit;

  /// No description provided for @general_next.
  ///
  /// In en, this message translates to:
  /// **'Next'**
  String get general_next;

  /// No description provided for @general_previous.
  ///
  /// In en, this message translates to:
  /// **'Previous'**
  String get general_previous;

  /// No description provided for @general_finish.
  ///
  /// In en, this message translates to:
  /// **'Finish'**
  String get general_finish;

  /// No description provided for @general_skip.
  ///
  /// In en, this message translates to:
  /// **'Skip'**
  String get general_skip;

  /// No description provided for @general_share.
  ///
  /// In en, this message translates to:
  /// **'Share'**
  String get general_share;

  /// No description provided for @general_copy.
  ///
  /// In en, this message translates to:
  /// **'Copy'**
  String get general_copy;

  /// No description provided for @general_see_all.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get general_see_all;

  /// No description provided for @general_edit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get general_edit;

  /// No description provided for @general_add.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get general_add;

  /// No description provided for @filter_price.
  ///
  /// In en, this message translates to:
  /// **'Price'**
  String get filter_price;

  /// No description provided for @filter_category.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get filter_category;

  /// No description provided for @filter_zone.
  ///
  /// In en, this message translates to:
  /// **'Zone'**
  String get filter_zone;

  /// No description provided for @filter_rating.
  ///
  /// In en, this message translates to:
  /// **'Minimum rating'**
  String get filter_rating;

  /// No description provided for @filter_seller_type.
  ///
  /// In en, this message translates to:
  /// **'Seller type'**
  String get filter_seller_type;

  /// No description provided for @filter_free_delivery.
  ///
  /// In en, this message translates to:
  /// **'Free delivery'**
  String get filter_free_delivery;

  /// No description provided for @filter_apply.
  ///
  /// In en, this message translates to:
  /// **'Apply'**
  String get filter_apply;

  /// No description provided for @currency_fcfa.
  ///
  /// In en, this message translates to:
  /// **'FCFA'**
  String get currency_fcfa;

  /// No description provided for @time_min_ago.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min ago'**
  String time_min_ago(Object minutes);

  /// No description provided for @time_h_ago.
  ///
  /// In en, this message translates to:
  /// **'{hours}h ago'**
  String time_h_ago(Object hours);

  /// No description provided for @time_d_ago.
  ///
  /// In en, this message translates to:
  /// **'{days}d ago'**
  String time_d_ago(Object days);

  /// No description provided for @tutorial_title.
  ///
  /// In en, this message translates to:
  /// **'Tutorial'**
  String get tutorial_title;

  /// No description provided for @tutorial_step1_title.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get tutorial_step1_title;

  /// No description provided for @tutorial_step1_desc.
  ///
  /// In en, this message translates to:
  /// **'Browse products near you, discover new items, and save your favorites.'**
  String get tutorial_step1_desc;

  /// No description provided for @tutorial_step2_title.
  ///
  /// In en, this message translates to:
  /// **'Order'**
  String get tutorial_step2_title;

  /// No description provided for @tutorial_step2_desc.
  ///
  /// In en, this message translates to:
  /// **'Add to cart, negotiate the price, and checkout securely.'**
  String get tutorial_step2_desc;

  /// No description provided for @tutorial_step3_title.
  ///
  /// In en, this message translates to:
  /// **'Payment'**
  String get tutorial_step3_title;

  /// No description provided for @tutorial_step3_desc.
  ///
  /// In en, this message translates to:
  /// **'Pay with Orange Money, MTN MoMo, Airtel Money, or cash.'**
  String get tutorial_step3_desc;

  /// No description provided for @tutorial_step4_title.
  ///
  /// In en, this message translates to:
  /// **'Tracking'**
  String get tutorial_step4_title;

  /// No description provided for @tutorial_step4_desc.
  ///
  /// In en, this message translates to:
  /// **'Track your order in real-time and receive delivery updates.'**
  String get tutorial_step4_desc;

  /// No description provided for @whats_new_title.
  ///
  /// In en, this message translates to:
  /// **'What\'s New'**
  String get whats_new_title;

  /// No description provided for @whats_new_feature1_title.
  ///
  /// In en, this message translates to:
  /// **'New Boutique'**
  String get whats_new_feature1_title;

  /// No description provided for @whats_new_feature1_desc.
  ///
  /// In en, this message translates to:
  /// **'Sellers now have their own customized storefront to showcase their products.'**
  String get whats_new_feature1_desc;

  /// No description provided for @whats_new_feature2_title.
  ///
  /// In en, this message translates to:
  /// **'Quick Sell Mode'**
  String get whats_new_feature2_title;

  /// No description provided for @whats_new_feature2_desc.
  ///
  /// In en, this message translates to:
  /// **'Sell in 2 minutes: photo, description, price — and you\'re live!'**
  String get whats_new_feature2_desc;

  /// No description provided for @whats_new_feature3_title.
  ///
  /// In en, this message translates to:
  /// **'Real-time Tracking'**
  String get whats_new_feature3_title;

  /// No description provided for @whats_new_feature3_desc.
  ///
  /// In en, this message translates to:
  /// **'Follow your delivery driver on the map with live updates.'**
  String get whats_new_feature3_desc;

  /// No description provided for @whats_new_discover.
  ///
  /// In en, this message translates to:
  /// **'Discover'**
  String get whats_new_discover;

  /// No description provided for @rate_title.
  ///
  /// In en, this message translates to:
  /// **'Rate Okiba'**
  String get rate_title;

  /// No description provided for @rate_question.
  ///
  /// In en, this message translates to:
  /// **'Do you like Okiba?'**
  String get rate_question;

  /// No description provided for @rate_desc.
  ///
  /// In en, this message translates to:
  /// **'Your feedback helps us improve'**
  String get rate_desc;

  /// No description provided for @rate_sorry.
  ///
  /// In en, this message translates to:
  /// **'We\'re sorry. Tell us how to improve:'**
  String get rate_sorry;

  /// No description provided for @rate_thanks.
  ///
  /// In en, this message translates to:
  /// **'Thanks! How can we do better?'**
  String get rate_thanks;

  /// No description provided for @rate_great.
  ///
  /// In en, this message translates to:
  /// **'Great! Thank you for your support!'**
  String get rate_great;

  /// No description provided for @rate_store.
  ///
  /// In en, this message translates to:
  /// **'Rate on the Store'**
  String get rate_store;

  /// No description provided for @rate_send.
  ///
  /// In en, this message translates to:
  /// **'Send'**
  String get rate_send;

  /// No description provided for @rate_thank_you.
  ///
  /// In en, this message translates to:
  /// **'Thank you!'**
  String get rate_thank_you;

  /// No description provided for @rate_feedback_recorded.
  ///
  /// In en, this message translates to:
  /// **'Your feedback has been recorded.'**
  String get rate_feedback_recorded;

  /// No description provided for @rate_close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get rate_close;

  /// No description provided for @app_update_title.
  ///
  /// In en, this message translates to:
  /// **'Update available'**
  String get app_update_title;

  /// No description provided for @app_update_new_version.
  ///
  /// In en, this message translates to:
  /// **'Version {version} available'**
  String app_update_new_version(Object version);

  /// No description provided for @app_update_current.
  ///
  /// In en, this message translates to:
  /// **'You are currently using version {current}'**
  String app_update_current(Object current);

  /// No description provided for @app_update_button.
  ///
  /// In en, this message translates to:
  /// **'Update'**
  String get app_update_button;

  /// No description provided for @app_update_later.
  ///
  /// In en, this message translates to:
  /// **'Later'**
  String get app_update_later;

  /// No description provided for @app_update_whats_new_title.
  ///
  /// In en, this message translates to:
  /// **'What\'s new in version {version}'**
  String app_update_whats_new_title(Object version);

  /// No description provided for @app_update_feature_boutique.
  ///
  /// In en, this message translates to:
  /// **'New seller boutique design'**
  String get app_update_feature_boutique;

  /// No description provided for @app_update_feature_rapid.
  ///
  /// In en, this message translates to:
  /// **'Quick sell mode: publish in 2 minutes'**
  String get app_update_feature_rapid;

  /// No description provided for @app_update_feature_tracking.
  ///
  /// In en, this message translates to:
  /// **'Real-time delivery tracking on map'**
  String get app_update_feature_tracking;

  /// No description provided for @app_update_feature_airtel.
  ///
  /// In en, this message translates to:
  /// **'Airtel Money payment now available'**
  String get app_update_feature_airtel;

  /// No description provided for @app_update_feature_perf.
  ///
  /// In en, this message translates to:
  /// **'Performance improvements and bug fixes'**
  String get app_update_feature_perf;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}

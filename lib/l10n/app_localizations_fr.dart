// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get app_name => 'Okiba';

  @override
  String get app_tagline => 'Achetez, vendez, faites livrer';

  @override
  String get nav_home => 'Accueil';

  @override
  String get nav_search => 'Recherche';

  @override
  String get nav_cart => 'Panier';

  @override
  String get nav_orders => 'Commandes';

  @override
  String get nav_profile => 'Profil';

  @override
  String get onboarding_title_1 => 'Achetez tout';

  @override
  String get onboarding_desc_1 => 'Des milliers de produits près de chez vous';

  @override
  String get onboarding_title_2 => 'Vendez facilement';

  @override
  String get onboarding_desc_2 => 'WhatsApp, boutique ou en 30 secondes';

  @override
  String get onboarding_title_3 => 'Livrez et gagnez';

  @override
  String get onboarding_desc_3 => 'Devenez livreur et gagnez de l\'argent';

  @override
  String get onboarding_skip => 'Passer';

  @override
  String get onboarding_next => 'Suivant';

  @override
  String get onboarding_start => 'Commencer';

  @override
  String get auth_login_title => 'Connexion';

  @override
  String get auth_phone_hint => 'Numéro de téléphone';

  @override
  String get auth_phone_format => '+241 XX XX XX XX';

  @override
  String get auth_send_code => 'Envoyer le code';

  @override
  String get auth_verify_title => 'Vérification';

  @override
  String get auth_code_hint => 'Code de vérification';

  @override
  String get auth_verify => 'Vérifier';

  @override
  String get auth_resend => 'Renvoyer le code';

  @override
  String auth_resend_in(Object seconds) {
    return 'Renvoyer dans ${seconds}s';
  }

  @override
  String get auth_email_title => 'Email';

  @override
  String get auth_email_hint => 'Adresse email';

  @override
  String get auth_password_hint => 'Mot de passe';

  @override
  String get auth_forgot_password => 'Mot de passe oublié ?';

  @override
  String get auth_no_account => 'Pas de compte ?';

  @override
  String get auth_has_account => 'Déjà un compte ?';

  @override
  String get auth_register => 'S\'inscrire';

  @override
  String get auth_register_title => 'Créer un compte';

  @override
  String get auth_name_hint => 'Nom complet';

  @override
  String get auth_login_button => 'Se connecter';

  @override
  String get auth_login_subtitle => 'Connectez-vous à votre compte';

  @override
  String get auth_invalid_phone => 'Numéro invalide';

  @override
  String get auth_password_required => 'Mot de passe requis';

  @override
  String get auth_phone_register_hint => 'Téléphone';

  @override
  String get auth_continue => 'Continuer';

  @override
  String get auth_register_email => 'S\'inscrire avec un e-mail';

  @override
  String get auth_email_register_title => 'Inscription par e-mail';

  @override
  String get auth_email_register_subtitle =>
      'Créez votre compte avec un e-mail';

  @override
  String get auth_email_label => 'E-mail';

  @override
  String get auth_email_invalid => 'E-mail invalide';

  @override
  String get auth_password_min_chars => 'Minimum 8 caractères';

  @override
  String get auth_confirm_password => 'Confirmer le mot de passe';

  @override
  String get auth_passwords_no_match =>
      'Les mots de passe ne correspondent pas';

  @override
  String get auth_email_verify_title => 'Vérifiez votre e-mail';

  @override
  String get auth_email_verify_desc =>
      'Un lien de vérification a été envoyé\nà votre adresse e-mail.';

  @override
  String get auth_email_verified => 'J\'ai vérifié';

  @override
  String get auth_email_not_received => 'Vous n\'avez rien reçu ? ';

  @override
  String get auth_otp_subtitle => 'Entrez le code reçu par SMS';

  @override
  String get auth_otp_not_received => 'Code non reçu ? ';

  @override
  String get auth_forgot_password_title => 'Mot de passe oublié';

  @override
  String get auth_reset_subtitle => 'Entrez votre numéro pour réinitialiser';

  @override
  String get auth_reset_sms_info =>
      'Un code de réinitialisation vous sera envoyé par SMS.';

  @override
  String get auth_new_password_title => 'Nouveau mot de passe';

  @override
  String get auth_new_password_subtitle =>
      'Choisissez un mot de passe sécurisé';

  @override
  String get auth_new_password_hint => 'Nouveau mot de passe';

  @override
  String get auth_register_subtitle => 'Entrez votre numéro de téléphone';

  @override
  String get role_title => 'Que voulez-vous faire ?';

  @override
  String get role_question => 'Qui êtes-vous ?';

  @override
  String get role_subtitle => 'Choisissez votre profil principal';

  @override
  String get seller_type_title => 'Mode de vente';

  @override
  String get seller_type_subtitle => 'Choisissez comment vendre vos produits';

  @override
  String get profile_setup_title => 'Votre profil';

  @override
  String get profile_setup_subtitle => 'Une dernière étape';

  @override
  String get profile_name_required => 'Nom requis';

  @override
  String get profile_bio_hint => 'Bio (optionnelle)';

  @override
  String get profile_share_location => 'Partager ma localisation';

  @override
  String get kyc_subtitle =>
      'Prenez une photo de vous et de votre pièce d\'identité';

  @override
  String get kyc_verified => 'Identité vérifiée';

  @override
  String get kyc_redirecting => 'Redirection...';

  @override
  String get kyc_verifying => 'Vérification en cours...';

  @override
  String get kyc_analyzing =>
      'Analyse de la photo et détection\nde la qualité de l\'image';

  @override
  String get kyc_take_photo => 'Prendre en photo';

  @override
  String get kyc_step_selfie_title => 'Selfie de vérification';

  @override
  String get kyc_step_id_front_title => 'Pièce d\'identité — Recto';

  @override
  String get kyc_step_id_back_title => 'Pièce d\'identité — Verso';

  @override
  String get kyc_step_selfie_desc =>
      'Placez votre visage dans le cadre\net assurez-vous d\'avoir un bon éclairage';

  @override
  String get kyc_step_id_front_desc =>
      'Prenez en photo le recto de votre\npasseport, CNI ou permis de conduire';

  @override
  String get kyc_step_id_back_desc =>
      'Retournez la pièce et prenez\nle verso en photo';

  @override
  String get kyc_verify_identity => 'Vérifier mon identité';

  @override
  String get kyc_step_selfie_short => 'Selfie';

  @override
  String get kyc_step_front_short => 'Recto';

  @override
  String get kyc_step_back_short => 'Verso';

  @override
  String get kyc_step_selfie_label => 'Selfie';

  @override
  String get kyc_step_id_front_label => 'ID Recto';

  @override
  String get kyc_step_id_back_label => 'ID Verso';

  @override
  String get seller_type_badge_recommended => 'Recommandé';

  @override
  String get seller_type_feature_no_shop => 'Pas de boutique à gérer';

  @override
  String get seller_type_feature_whatsapp => 'Partage par lien WhatsApp';

  @override
  String get seller_type_feature_orders => 'Commandes par message';

  @override
  String get seller_type_feature_beginner => 'Idéal pour débuter';

  @override
  String get seller_type_feature_catalog => 'Catalogue complet';

  @override
  String get seller_type_feature_stock => 'Gestion de stock';

  @override
  String get seller_type_feature_variants => 'Variants produits';

  @override
  String get seller_type_feature_analytics => 'Analytics avancés';

  @override
  String get seller_type_feature_quick => 'Publication en 30s';

  @override
  String get seller_type_feature_photos => 'Photos + description';

  @override
  String get seller_type_feature_price => 'Prix suggéré';

  @override
  String get seller_type_feature_wardrobe => 'Idéal pour vide-dressing';

  @override
  String get onboarding_slide_1_title => 'Achetez localement';

  @override
  String get onboarding_slide_1_desc =>
      'Commandez chez les commerçants de votre quartier\net soutenez l\'économie gabonaise.';

  @override
  String get onboarding_slide_2_title => 'Vendez facilement';

  @override
  String get onboarding_slide_2_desc =>
      'Créez votre boutique en ligne en 2 minutes.\nPas de stock ? Pas de problème.';

  @override
  String get onboarding_slide_3_title => 'Livraison rapide';

  @override
  String get onboarding_slide_3_desc =>
      'Suivez votre commande en temps réel.\nLivré en 2h chez vous.';

  @override
  String get welcome_subtitle => 'LE MARCHÉ GABONAIS';

  @override
  String get welcome_tagline => 'Achetez et vendez facilement\nau Gabon';

  @override
  String get auth_send => 'Envoyer';

  @override
  String get role_buy => 'Acheter';

  @override
  String get role_buy_desc => 'Parcourez et achetez des produits';

  @override
  String get role_sell => 'Vendre';

  @override
  String get role_sell_desc => 'Proposez vos produits';

  @override
  String get role_sell_whatsapp => 'Via WhatsApp';

  @override
  String get role_sell_shop => 'Ouvrir une boutique';

  @override
  String get role_sell_rapid => 'Vente rapide';

  @override
  String get role_deliver => 'Livrer';

  @override
  String get role_deliver_desc => 'Gagnez de l\'argent en livrant';

  @override
  String get role_sell_type_title => 'Choisissez votre mode vendeur';

  @override
  String get role_sell_type_whatsapp => 'Mode WhatsApp';

  @override
  String get role_sell_type_whatsapp_desc =>
      'Partagez des liens via WhatsApp, pas de boutique nécessaire';

  @override
  String get role_sell_type_boutique => 'Boutique';

  @override
  String get role_sell_type_boutique_desc => 'Vitrine complète avec catalogue';

  @override
  String get role_sell_type_rapid => 'Vente rapide';

  @override
  String get role_sell_type_rapid_desc => 'Vendez en 2 minutes avec une photo';

  @override
  String get kyc_title => 'Vérification d\'identité';

  @override
  String get kyc_selfie => 'Prenez un selfie';

  @override
  String get kyc_id_front => 'Carte d\'identité (recto)';

  @override
  String get kyc_id_back => 'Carte d\'identité (verso)';

  @override
  String get kyc_submit => 'Soumettre pour vérification';

  @override
  String get kyc_pending => 'En attente de vérification';

  @override
  String get kyc_approved => 'Approuvé';

  @override
  String get kyc_rejected => 'Rejeté';

  @override
  String get product_add_to_cart => 'Ajouter au panier';

  @override
  String get product_buy_now => 'Acheter maintenant';

  @override
  String get product_negotiate => 'Négocier le prix';

  @override
  String get product_call => 'Appeler';

  @override
  String get product_whatsapp => 'WhatsApp';

  @override
  String get product_verified => 'Vérifié';

  @override
  String get product_nearby => 'Proche de vous';

  @override
  String get product_free_delivery => 'Livraison gratuite';

  @override
  String get product_in_stock => 'En stock';

  @override
  String get product_out_of_stock => 'Rupture';

  @override
  String get product_condition => 'État';

  @override
  String get product_condition_new => 'Neuf';

  @override
  String get product_condition_very_good => 'Très bon';

  @override
  String get product_condition_good => 'Bon';

  @override
  String get product_condition_renovate => 'À rénover';

  @override
  String get product_reviews => 'avis';

  @override
  String get product_seller => 'Vendeur';

  @override
  String get product_description => 'Description';

  @override
  String get product_favorite_add => 'Ajouter aux favoris';

  @override
  String get product_favorite_remove => 'Retirer des favoris';

  @override
  String get category_title => 'Catégories';

  @override
  String category_products_title(Object category) {
    return 'Produits dans $category';
  }

  @override
  String get search_title => 'Recherche';

  @override
  String get search_hint => 'Rechercher un produit...';

  @override
  String get search_no_results => 'Aucun résultat trouvé';

  @override
  String get search_no_results_desc => 'Essayez un autre terme de recherche';

  @override
  String get seller_profile_title => 'Profil vendeur';

  @override
  String get seller_profile_products => 'Produits';

  @override
  String get seller_profile_reviews => 'Avis';

  @override
  String get reviews_title => 'Avis';

  @override
  String get reviews_empty => 'Aucun avis pour le moment';

  @override
  String get reviews_empty_desc => 'Soyez le premier à laisser un avis';

  @override
  String get cart_title => 'Mon panier';

  @override
  String get cart_empty => 'Votre panier est vide';

  @override
  String get cart_empty_desc => 'Ajoutez des produits pour commencer';

  @override
  String get cart_total => 'Total';

  @override
  String get cart_checkout => 'Commander';

  @override
  String get cart_clear => 'Vider le panier';

  @override
  String get cart_item_edit_title => 'Modifier l\'article';

  @override
  String get cart_item_quantity => 'Quantité';

  @override
  String get cart_item_note => 'Note pour le vendeur';

  @override
  String get cart_item_variant => 'Variante';

  @override
  String get checkout_title => 'Commande';

  @override
  String get checkout_address => 'Adresse de livraison';

  @override
  String get checkout_address_hint => 'Quartier + point de repère';

  @override
  String get checkout_use_gps => 'Utiliser ma position';

  @override
  String get checkout_delivery_mode => 'Mode de livraison';

  @override
  String get checkout_standard => 'Standard (2-3 jours)';

  @override
  String get checkout_express => 'Express (24h)';

  @override
  String get checkout_pickup => 'Retrait chez le vendeur';

  @override
  String get checkout_payment => 'Paiement';

  @override
  String get checkout_orange_money => 'Orange Money';

  @override
  String get checkout_mtn_momo => 'MTN Mobile Money';

  @override
  String get checkout_airtel_money => 'Airtel Money';

  @override
  String get checkout_cash => 'Cash à la livraison';

  @override
  String get checkout_card => 'Carte bancaire';

  @override
  String get checkout_summary => 'Récapitulatif';

  @override
  String checkout_pay(Object amount) {
    return 'Payer $amount';
  }

  @override
  String get checkout_success => 'Commande confirmée !';

  @override
  String get checkout_success_desc =>
      'Vous recevrez une notification dès que votre colis sera expédié.';

  @override
  String get checkout_failed => 'Paiement échoué';

  @override
  String get checkout_failed_desc =>
      'Veuillez réessayer avec une autre méthode.';

  @override
  String get checkout_processing_title => 'Paiement en cours';

  @override
  String get checkout_processing_desc =>
      'Veuillez patienter pendant la confirmation...';

  @override
  String get checkout_review_title => 'Récapitulatif de votre commande';

  @override
  String get checkout_review_items => 'Articles';

  @override
  String get checkout_review_delivery => 'Livraison';

  @override
  String get checkout_review_payment => 'Moyen de paiement';

  @override
  String get checkout_review_place => 'Passer la commande';

  @override
  String get checkout_negotiate_title => 'Négocier le prix';

  @override
  String get checkout_negotiate_your_price => 'Votre prix proposé';

  @override
  String get checkout_negotiate_message => 'Message au vendeur';

  @override
  String get order_status_pending => 'En attente';

  @override
  String get order_status_confirmed => 'Confirmée';

  @override
  String get order_status_preparing => 'En préparation';

  @override
  String get order_status_ready => 'Prête';

  @override
  String get order_status_assigned => 'Livreur assigné';

  @override
  String get order_status_in_transit => 'En route';

  @override
  String get order_status_delivered => 'Livrée';

  @override
  String get order_status_cancelled => 'Annulée';

  @override
  String get order_track => 'Suivre ma commande';

  @override
  String get order_details => 'Détails de la commande';

  @override
  String get order_number => 'Numéro de commande';

  @override
  String get order_date => 'Date de commande';

  @override
  String get order_total => 'Total';

  @override
  String get order_status => 'Statut';

  @override
  String get order_tracking_title => 'Suivi de commande';

  @override
  String get order_tracking_map => 'Suivez votre livreur sur la carte';

  @override
  String get order_rate_title => 'Évaluer votre commande';

  @override
  String get order_rate_seller => 'Évaluer le vendeur';

  @override
  String get order_rate_delivery => 'Évaluer la livraison';

  @override
  String get order_rate_comment => 'Ajouter un commentaire';

  @override
  String get order_dispute_title => 'Ouvrir un litige';

  @override
  String get order_dispute_reason => 'Motif';

  @override
  String get order_dispute_evidence => 'Télécharger une preuve';

  @override
  String get order_dispute_submit => 'Soumettre le litige';

  @override
  String get order_favorites_title => 'Mes favoris';

  @override
  String get order_favorites_empty => 'Aucun favori pour le moment';

  @override
  String get seller_dashboard => 'Tableau de bord';

  @override
  String get seller_products => 'Mes produits';

  @override
  String get seller_orders => 'Commandes';

  @override
  String get seller_wallet => 'Portefeuille';

  @override
  String get seller_add_product => 'Ajouter un produit';

  @override
  String get seller_sales_today => 'Ventes aujourd\'hui';

  @override
  String get seller_sales_week => 'Cette semaine';

  @override
  String get seller_sales_month => 'Ce mois-ci';

  @override
  String get seller_stock_alert => 'Alerte stock';

  @override
  String get seller_member_since => 'Membre depuis';

  @override
  String get seller_whatsapp_title => 'Vente WhatsApp';

  @override
  String get seller_whatsapp_new => 'Nouveau lien produit';

  @override
  String get seller_whatsapp_share => 'Partager sur WhatsApp';

  @override
  String get seller_whatsapp_copy_link => 'Copier le lien';

  @override
  String get seller_whatsapp_views => 'Vues';

  @override
  String get seller_whatsapp_connected => 'WhatsApp connecté';

  @override
  String get seller_whatsapp_desc =>
      'Partagez votre catalogue et gérez les commandes depuis WhatsApp';

  @override
  String get seller_whatsapp_orders_new => 'Nouvelles commandes';

  @override
  String get seller_whatsapp_messages => 'Messages reçus';

  @override
  String get seller_whatsapp_catalog => 'Catalogue';

  @override
  String get seller_whatsapp_share_catalog => 'Partager mon catalogue WhatsApp';

  @override
  String get seller_whatsapp_stats => 'Voir les statistiques';

  @override
  String get seller_whatsapp_product_create => 'Nouveau produit WhatsApp';

  @override
  String get seller_whatsapp_product_edit => 'Modifier le produit';

  @override
  String get seller_whatsapp_product_detail => 'Détail produit';

  @override
  String get seller_whatsapp_photos => 'Photos (1-5)';

  @override
  String get seller_whatsapp_name => 'Nom du produit';

  @override
  String get seller_whatsapp_name_required => 'Nom requis';

  @override
  String get seller_whatsapp_price_required => 'Prix requis';

  @override
  String get seller_whatsapp_created => 'Produit créé avec succès !';

  @override
  String get seller_whatsapp_updated => 'Produit modifié';

  @override
  String get seller_whatsapp_delete_confirm => 'Supprimer ce produit ?';

  @override
  String get seller_whatsapp_delete_irreversible =>
      'Cette action est irréversible.';

  @override
  String get seller_whatsapp_published => 'Publié';

  @override
  String get seller_whatsapp_visible => 'Visible dans votre catalogue';

  @override
  String get seller_whatsapp_qr_code => 'Voir le QR code';

  @override
  String get seller_whatsapp_orders_title => 'Commandes WhatsApp';

  @override
  String get seller_whatsapp_order_detail => 'Détail commande';

  @override
  String get seller_whatsapp_order_confirm => 'Confirmer la commande';

  @override
  String get seller_whatsapp_contact_whatsapp => 'Contacter sur WhatsApp';

  @override
  String get seller_whatsapp_mark_delivered => 'Marquer comme livré';

  @override
  String get seller_whatsapp_cancel_order => 'Annuler la commande';

  @override
  String get seller_whatsapp_stats_title => 'Statistiques';

  @override
  String get seller_whatsapp_period_7d => '7 jours';

  @override
  String get seller_whatsapp_period_30d => '30 jours';

  @override
  String get seller_whatsapp_period_90d => '90 jours';

  @override
  String get seller_whatsapp_clicks => 'Clics';

  @override
  String get seller_whatsapp_orders_count => 'Commandes';

  @override
  String get seller_whatsapp_sales => 'Ventes';

  @override
  String get seller_whatsapp_conversion_rate => 'Taux de conversion';

  @override
  String get seller_whatsapp_top_products => 'Produits les plus consultés';

  @override
  String get seller_rapid_publish => 'Publier rapidement';

  @override
  String get seller_rapid_photo => 'Photo';

  @override
  String get seller_rapid_price => 'Prix';

  @override
  String get seller_rapid_category => 'Catégorie';

  @override
  String get seller_rapid_condition => 'État';

  @override
  String get seller_rapid_published => 'Publié !';

  @override
  String get seller_rapid_title => 'Vente rapide';

  @override
  String get seller_rapid_desc =>
      'Prenez une photo, décrivez votre produit, et publiez instantanément.';

  @override
  String get seller_rapid_post_ad => 'Publier une annonce';

  @override
  String get seller_rapid_active_ads => 'Annonces actives';

  @override
  String get seller_rapid_total_views => 'Vues totales';

  @override
  String get seller_rapid_messages => 'Messages';

  @override
  String get seller_rapid_explore_feed => 'Explorer le feed';

  @override
  String get seller_rapid_feed_title => 'Feed rapide';

  @override
  String get seller_rapid_feed_search => 'Rechercher dans le feed...';

  @override
  String get seller_rapid_filter_all => 'Tout';

  @override
  String get seller_rapid_filter_fashion => 'Mode';

  @override
  String get seller_rapid_filter_tech => 'Tech';

  @override
  String get seller_rapid_filter_home => 'Maison';

  @override
  String get seller_rapid_filter_services => 'Services';

  @override
  String get seller_rapid_filter_food => 'Alimentation';

  @override
  String get seller_rapid_ad_title => 'Titre de l\'annonce';

  @override
  String get seller_rapid_ad_title_required => 'Titre requis';

  @override
  String get seller_rapid_price_required => 'Prix requis';

  @override
  String get seller_rapid_description => 'Description';

  @override
  String get seller_rapid_category_select => 'Catégorie';

  @override
  String get seller_rapid_condition_normal => 'Usage normal';

  @override
  String get seller_rapid_promotions_title => 'Promotions';

  @override
  String get seller_rapid_promotions_boost => 'Boostez vos annonces';

  @override
  String get seller_rapid_promotions_boost_desc =>
      'Les annonces mises en avant reçoivent jusqu\'à 5x plus de vues.';

  @override
  String get seller_rapid_promotions_featured => 'Mise en avant';

  @override
  String seller_rapid_promotions_featured_7d(Object price) {
    return '7 jours - $price';
  }

  @override
  String seller_rapid_promotions_featured_30d(Object price) {
    return '30 jours - $price';
  }

  @override
  String get seller_rapid_promotions_urgent => 'Badge \"Urgent\"';

  @override
  String seller_rapid_promotions_urgent_desc(Object price) {
    return 'Jusqu\'à vente - $price';
  }

  @override
  String get seller_rapid_promotions_new => 'Badge \"Nouveauté\"';

  @override
  String seller_rapid_promotions_new_desc(Object price) {
    return '7 jours - $price';
  }

  @override
  String get seller_rapid_promotions_pack => 'Pack visibilité +';

  @override
  String seller_rapid_promotions_pack_desc(Object price) {
    return '30 jours - $price';
  }

  @override
  String get seller_rapid_promotions_active => 'Actif';

  @override
  String get seller_rapid_promotions_activate => 'Activer cette promotion';

  @override
  String get seller_rapid_flash_title => 'Flash sales';

  @override
  String get seller_rapid_flash_create => 'Créer';

  @override
  String get seller_rapid_flash_ongoing => 'En cours';

  @override
  String get seller_rapid_flash_upcoming => 'À venir';

  @override
  String get seller_rapid_flash_ended => 'Terminées';

  @override
  String get seller_rapid_flash_new => 'Nouvelle flash sale';

  @override
  String get seller_rapid_flash_name => 'Nom';

  @override
  String get seller_rapid_flash_discount => 'Réduction (%)';

  @override
  String get seller_rapid_flash_duration => 'Durée (heures)';

  @override
  String get seller_rapid_flash_schedule => 'Programmer';

  @override
  String get seller_rapid_messages_title => 'Messages';

  @override
  String get seller_rapid_analytics_title => 'Analyses';

  @override
  String get seller_rapid_analytics_ads => 'Annonces';

  @override
  String get seller_rapid_analytics_contacts => 'Contacts';

  @override
  String get seller_rapid_analytics_views_per_ad => 'Vues/annonce';

  @override
  String get seller_rapid_analytics_perf_title => 'Performance par annonce';

  @override
  String get seller_rapid_analytics_tips_title => 'Conseils';

  @override
  String get seller_rapid_analytics_tip_photos =>
      'Ajoutez des photos de qualité pour plus de vues';

  @override
  String get seller_rapid_analytics_tip_reply =>
      'Répondez rapidement aux messages pour plus de ventes';

  @override
  String get seller_rapid_analytics_tip_boost =>
      'Utilisez la mise en avant pour booster vos annonces';

  @override
  String get seller_rapid_product_detail_title => 'Annonce';

  @override
  String get seller_rapid_product_detail_featured => 'En vedette';

  @override
  String seller_rapid_product_detail_member_since(Object date) {
    return 'Membre depuis $date';
  }

  @override
  String get seller_rapid_product_detail_views => 'vues';

  @override
  String get seller_rapid_product_detail_favs => 'favoris';

  @override
  String get seller_rapid_product_detail_messages_count => 'messages';

  @override
  String get seller_rapid_product_detail_contact => 'Contacter';

  @override
  String get seller_rapid_period_7d => '7 jours';

  @override
  String get seller_rapid_period_30d => '30 jours';

  @override
  String get seller_rapid_period_90d => '90 jours';

  @override
  String get boutique_title => 'Ma boutique';

  @override
  String get boutique_overview => 'Aperçu';

  @override
  String get boutique_products => 'Produits';

  @override
  String get boutique_commands => 'Commandes';

  @override
  String get boutique_sales => 'Ventes';

  @override
  String get boutique_rating => 'Note moyenne';

  @override
  String get boutique_actions => 'Actions';

  @override
  String get boutique_add_product => 'Ajouter\nun produit';

  @override
  String get boutique_manage_stock => 'Gérer\nle stock';

  @override
  String get boutique_view_reviews => 'Voir\nles avis';

  @override
  String get boutique_recent_products => 'Produits récents';

  @override
  String get boutique_manage => 'Gérer';

  @override
  String get boutique_out_of_stock => 'Épuisé';

  @override
  String get boutique_performance => 'Performance';

  @override
  String get boutique_views_this_week => 'Vues cette semaine';

  @override
  String get boutique_conversion_rate => 'Taux de conversion';

  @override
  String get boutique_response_time => 'Temps de réponse';

  @override
  String get boutique_analytics_title => 'Analytics';

  @override
  String get boutique_analytics_revenue => 'Revenus';

  @override
  String boutique_analytics_vs_previous(Object percent) {
    return '+$percent% vs période précédente';
  }

  @override
  String get boutique_analytics_orders => 'Commandes';

  @override
  String get boutique_analytics_views => 'Vues';

  @override
  String get boutique_analytics_conversion => 'Taux conv.';

  @override
  String get boutique_analytics_avg_cart => 'Panier moy.';

  @override
  String get boutique_analytics_popular => 'Produits populaires';

  @override
  String get boutique_analytics_sales => 'ventes';

  @override
  String get boutique_period_7d => '7 jours';

  @override
  String get boutique_period_30d => '30 jours';

  @override
  String get boutique_period_90d => '90 jours';

  @override
  String get boutique_period_1y => '1 an';

  @override
  String get boutique_catalog_title => 'Catalogue';

  @override
  String get boutique_catalog_search => 'Rechercher un produit...';

  @override
  String get boutique_catalog_all => 'Tous';

  @override
  String get boutique_catalog_active => 'Actif';

  @override
  String get boutique_catalog_out_of_stock => 'Épuisé';

  @override
  String get boutique_catalog_draft => 'Brouillon';

  @override
  String get boutique_catalog_sort_name_az => 'Nom (A-Z)';

  @override
  String get boutique_catalog_sort_price_asc => 'Prix (croissant)';

  @override
  String get boutique_catalog_sort_price_desc => 'Prix (décroissant)';

  @override
  String get boutique_catalog_sort_stock => 'Stock (bas→haut)';

  @override
  String get boutique_catalog_sort_recent => 'Plus récents';

  @override
  String get boutique_inventory_title => 'Stock';

  @override
  String get boutique_inventory_total => 'Total';

  @override
  String get boutique_inventory_low => 'Stock bas';

  @override
  String get boutique_inventory_rupture => 'Rupture';

  @override
  String get boutique_inventory_excess => 'Surnombre';

  @override
  String get boutique_inventory_adjust => 'Ajuster stock';

  @override
  String get boutique_inventory_new_stock => 'Nouveau stock';

  @override
  String get boutique_inventory_quantity => 'Quantité';

  @override
  String get boutique_inventory_confirm => 'Ok';

  @override
  String get boutique_orders_title => 'Commandes boutique';

  @override
  String get boutique_orders_ongoing => 'En cours';

  @override
  String get boutique_orders_shipped => 'Expédié';

  @override
  String get boutique_orders_delivered => 'Livré';

  @override
  String get boutique_orders_cancelled => 'Annulé';

  @override
  String get boutique_order_detail_title => 'Détail commande';

  @override
  String get boutique_order_detail_placed => 'Commande passée';

  @override
  String get boutique_order_detail_paid => 'Paiement confirmé';

  @override
  String get boutique_order_detail_preparing => 'En préparation';

  @override
  String get boutique_order_detail_in_transit => 'En cours de livraison';

  @override
  String get boutique_order_detail_items => 'Articles';

  @override
  String get boutique_order_detail_total => 'Total';

  @override
  String get boutique_order_detail_payment => 'Paiement';

  @override
  String get boutique_order_detail_paid_status => 'Payé';

  @override
  String get boutique_order_detail_tracking => 'Suivi';

  @override
  String get boutique_order_detail_confirm => 'Confirmer';

  @override
  String get boutique_order_detail_ship => 'Expédier';

  @override
  String get boutique_order_detail_cancel_order => 'Annuler la commande';

  @override
  String get boutique_product_create_title => 'Nouveau produit';

  @override
  String get boutique_product_create_publish => 'Publier';

  @override
  String get boutique_product_create_photos => 'Photos';

  @override
  String get boutique_product_create_name => 'Nom du produit';

  @override
  String get boutique_product_create_name_required => 'Requis';

  @override
  String get boutique_product_create_price => 'Prix (FCFA)';

  @override
  String get boutique_product_create_sku => 'SKU';

  @override
  String get boutique_product_create_stock => 'Stock';

  @override
  String get boutique_product_create_weight => 'Poids (kg)';

  @override
  String get boutique_product_create_description => 'Description';

  @override
  String get boutique_product_create_variants => 'Ce produit a des variantes';

  @override
  String get boutique_product_create_variants_hint => 'Taille, couleur, etc.';

  @override
  String get boutique_product_create_variants_add => 'Ajouter';

  @override
  String get boutique_product_create_variants_stock => 'Stock :';

  @override
  String get boutique_product_create_category => 'Catégorie';

  @override
  String get boutique_product_create_cat_fashion => 'Mode';

  @override
  String get boutique_product_create_cat_electronics => 'Électronique';

  @override
  String get boutique_product_create_cat_home => 'Maison';

  @override
  String get boutique_product_create_cat_beauty => 'Beauté';

  @override
  String get boutique_product_create_cat_food => 'Alimentation';

  @override
  String get boutique_product_create_cat_sports => 'Sport';

  @override
  String get boutique_product_edit_title => 'Modifier produit';

  @override
  String get boutique_product_edit_save => 'Enregistrer';

  @override
  String get boutique_product_edit_active => 'Produit actif';

  @override
  String get boutique_product_edit_visible => 'Visible dans la boutique';

  @override
  String get boutique_product_edit_hidden => 'Masqué';

  @override
  String get boutique_product_edit_delete => 'Supprimer ce produit';

  @override
  String get boutique_product_edit_delete_confirm => 'Supprimer le produit ?';

  @override
  String get boutique_product_edit_delete_irreversible =>
      'Cette action est irréversible.';

  @override
  String get boutique_wallet_title => 'Portefeuille';

  @override
  String get boutique_wallet_balance => 'Solde disponible';

  @override
  String boutique_wallet_vs_last_month(Object percent) {
    return '+$percent% vs mois dernier';
  }

  @override
  String get boutique_wallet_withdraw => 'Retrait';

  @override
  String get boutique_wallet_orange_money => 'Orange Money';

  @override
  String get boutique_wallet_bank => 'Compte bancaire';

  @override
  String get boutique_wallet_make_withdrawal => 'Effectuer un retrait';

  @override
  String get boutique_wallet_recent => 'Transactions récentes';

  @override
  String get boutique_wallet_sale => 'Vente produit';

  @override
  String get boutique_wallet_withdrawal_om => 'Retrait OM';

  @override
  String get boutique_wallet_withdrawal_bank => 'Retrait banque';

  @override
  String get boutique_wallet_amount => 'Montant (FCFA)';

  @override
  String get boutique_wallet_method => 'Méthode';

  @override
  String get boutique_wallet_confirm_withdrawal => 'Confirmer le retrait';

  @override
  String get boutique_settings_title => 'Paramètres boutique';

  @override
  String get boutique_settings_save => 'Enregistrer';

  @override
  String get boutique_settings_banner => 'Bannière';

  @override
  String get boutique_settings_add_banner => 'Ajouter une bannière';

  @override
  String get boutique_settings_name => 'Nom de la boutique';

  @override
  String get boutique_settings_description => 'Description';

  @override
  String get boutique_settings_phone => 'Téléphone';

  @override
  String get boutique_settings_email => 'Email';

  @override
  String get boutique_settings_address => 'Adresse';

  @override
  String get boutique_settings_hours => 'Horaires';

  @override
  String get boutique_settings_opening => 'Ouverture';

  @override
  String get boutique_settings_closing => 'Fermeture';

  @override
  String get boutique_settings_delivery_zones => 'Zone de livraison';

  @override
  String get delivery_online => 'En ligne';

  @override
  String get delivery_offline => 'Hors ligne';

  @override
  String get delivery_earnings_today => 'Gains aujourd\'hui';

  @override
  String get delivery_earnings_week => 'Cette semaine';

  @override
  String get delivery_new_order => 'Nouvelle course !';

  @override
  String get delivery_accept => 'Accepter';

  @override
  String get delivery_pickup => 'Récupérer le colis';

  @override
  String get delivery_delivered => 'Livré';

  @override
  String get delivery_proof_photo => 'Photo preuve';

  @override
  String get delivery_scan_qr => 'Scanner le code';

  @override
  String get delivery_available => 'Disponible pour les livraisons';

  @override
  String get delivery_fcfc_earned => 'FCFA gagnés';

  @override
  String get delivery_deliveries => 'Livraisons';

  @override
  String get delivery_km_traveled => 'Parcourus';

  @override
  String get delivery_new_request => 'Nouvelle demande';

  @override
  String get delivery_ongoing => 'En cours';

  @override
  String get delivery_history => 'Historique';

  @override
  String get delivery_refuse => 'Refuser';

  @override
  String get delivery_earnings_title => 'Gains';

  @override
  String get delivery_earnings_total => 'Gains totaux';

  @override
  String delivery_earnings_vs_yesterday(Object percent) {
    return '+$percent% vs hier';
  }

  @override
  String get delivery_earnings_evolution => 'Évolution';

  @override
  String get delivery_earnings_distance => 'Distance';

  @override
  String get delivery_earnings_rating => 'Note';

  @override
  String get delivery_earnings_deliveries_count => 'Livraisons';

  @override
  String get delivery_earnings_transactions => 'Transactions';

  @override
  String get delivery_earnings_withdrawal => 'Retrait';

  @override
  String get delivery_wallet_title => 'Portefeuille';

  @override
  String get delivery_wallet_balance => 'Solde disponible';

  @override
  String get delivery_wallet_secure => 'Sécurisé • Retrait instantané';

  @override
  String get delivery_wallet_withdraw_now => 'Retirer instantanément';

  @override
  String get delivery_wallet_methods => 'Moyens de retrait';

  @override
  String get delivery_wallet_add_method => 'Ajouter un moyen de retrait';

  @override
  String get delivery_wallet_history => 'Historique des retraits';

  @override
  String get delivery_wallet_completed => 'Effectué';

  @override
  String get delivery_wallet_instant => 'Retrait instantané';

  @override
  String get delivery_wallet_amount => 'Montant (FCFA)';

  @override
  String get delivery_wallet_to => 'Vers';

  @override
  String get delivery_wallet_confirm => 'Confirmer le retrait';

  @override
  String get delivery_profile_title => 'Profil livreur';

  @override
  String get delivery_profile_level_gold => 'Or';

  @override
  String get delivery_profile_deliveries => 'Livraisons';

  @override
  String get delivery_profile_rating => 'Note';

  @override
  String get delivery_profile_success_rate => 'Taux succès';

  @override
  String get delivery_profile_vehicle => 'Véhicule';

  @override
  String get delivery_profile_edit => 'Modifier';

  @override
  String get delivery_profile_documents => 'Documents';

  @override
  String get delivery_profile_id_card => 'Carte d\'identité';

  @override
  String get delivery_profile_license => 'Permis de conduire';

  @override
  String get delivery_profile_registration => 'Carte grise';

  @override
  String get delivery_profile_insurance => 'Assurance';

  @override
  String get delivery_profile_validated => 'Validé';

  @override
  String get delivery_profile_pending => 'En attente';

  @override
  String get delivery_zone_title => 'Zone de travail';

  @override
  String get delivery_zone_save => 'Enregistrer';

  @override
  String get delivery_zone_available => 'Zones disponibles';

  @override
  String delivery_zone_radius(Object km) {
    return 'Rayon $km km';
  }

  @override
  String get delivery_request_title => 'Nouvelle course';

  @override
  String delivery_request_expires(Object seconds) {
    return 'Offre expire dans ${seconds}s';
  }

  @override
  String get delivery_request_amount => 'Course';

  @override
  String get delivery_request_pickup => 'Retrait';

  @override
  String get delivery_request_dropoff => 'Livraison';

  @override
  String get delivery_request_distance => 'Distance';

  @override
  String get delivery_request_ignore => 'Ignorer';

  @override
  String delivery_request_accept(Object amount) {
    return 'Accepter - $amount';
  }

  @override
  String get delivery_navigation_title => 'Navigation livraison';

  @override
  String get delivery_navigation_map => 'Google Maps';

  @override
  String delivery_navigation_route(Object from, Object to) {
    return 'Itinéraire : $from vers $to';
  }

  @override
  String get delivery_navigation_pickup => 'Retrait';

  @override
  String get delivery_navigation_delivery => 'Livraison';

  @override
  String get delivery_navigation_finalize => 'Finaliser';

  @override
  String get delivery_navigation_scan_pickup => 'Scanner QR - Retrait';

  @override
  String get delivery_pickup_title => 'Retrait colis';

  @override
  String get delivery_pickup_desc =>
      'Scannez le QR code du vendeur pour confirmer le retrait.';

  @override
  String get delivery_pickup_scan => 'Appuyez pour scanner';

  @override
  String get delivery_pickup_or => 'Ou saisir le code';

  @override
  String get delivery_pickup_code_hint => 'Ex: OKB-2024-001';

  @override
  String get delivery_pickup_photo => 'Photo du colis';

  @override
  String get delivery_pickup_add_photo => 'Ajouter une photo';

  @override
  String get delivery_pickup_confirm => 'Confirmer le retrait';

  @override
  String get delivery_dropoff_title => 'Livraison terminée';

  @override
  String get delivery_dropoff_success => 'Colis livré avec succès !';

  @override
  String delivery_dropoff_earned(Object amount) {
    return '$amount FCFA ajoutés à votre solde';
  }

  @override
  String get delivery_dropoff_scan_client => 'Scanner le QR client';

  @override
  String get delivery_dropoff_photo => 'Photo de preuve';

  @override
  String get delivery_dropoff_add_photo => 'Ajouter une photo';

  @override
  String get delivery_dropoff_signature => 'Signature du client';

  @override
  String get delivery_dropoff_signature_placeholder =>
      'Espace signature (à intégrer)';

  @override
  String get delivery_dropoff_finalize => 'Finaliser la livraison';

  @override
  String get wallet_balance => 'Mon solde';

  @override
  String get wallet_pending => 'En cours';

  @override
  String get wallet_withdraw => 'Retirer';

  @override
  String get wallet_history => 'Historique';

  @override
  String get wallet_withdraw_to => 'Retirer vers';

  @override
  String get wallet_principal => 'Principal';

  @override
  String get chat_title => 'Discussion';

  @override
  String get chat_placeholder => 'Écrivez un message...';

  @override
  String get chat_negotiate => 'Négocier';

  @override
  String get chat_offer => 'Proposer un prix';

  @override
  String get chat_accept => 'Accepter';

  @override
  String get chat_refuse => 'Refuser';

  @override
  String get chat_counter => 'Contre-proposer';

  @override
  String chat_offer_price(Object price) {
    return 'Prix proposé : $price';
  }

  @override
  String get chat_offer_original_price => 'Prix original :';

  @override
  String get chat_offer_proposal => 'Proposition';

  @override
  String get chat_offer_waiting => 'En attente de réponse';

  @override
  String get chat_offer_accepted => 'Offre acceptée';

  @override
  String get chat_offer_refused => 'Offre refusée';

  @override
  String get chat_offer_new_proposal => 'Nouvelle proposition reçue';

  @override
  String get chat_support_title => 'Support Okiba';

  @override
  String get chat_support_online => 'En ligne';

  @override
  String chat_support_ticket(Object ticket) {
    return 'Ticket #$ticket';
  }

  @override
  String get chat_support_processing => 'En cours de traitement';

  @override
  String get chat_support_open => 'Ouvert';

  @override
  String get chat_support_greeting => 'Bonjour, comment puis-je vous aider ?';

  @override
  String get chat_support_quick_reply_late => 'Livraison en retard';

  @override
  String get chat_support_quick_reply_defective => 'Produit défectueux';

  @override
  String get chat_support_quick_reply_payment => 'Problème de paiement';

  @override
  String get chat_support_quick_reply_cancel => 'Annulation commande';

  @override
  String get chat_support_quick_reply_other => 'Autre';

  @override
  String get chat_support_input_placeholder => 'Écrivez votre message...';

  @override
  String get chat_support_view_ticket => 'Voir le ticket';

  @override
  String get chat_support_attach_photo => 'Joindre une photo';

  @override
  String get chat_support_close_ticket => 'Fermer le ticket';

  @override
  String get review_title => 'Évaluer';

  @override
  String get review_rating => 'Note';

  @override
  String get review_comment => 'Commentaire';

  @override
  String get review_photo => 'Ajouter une photo';

  @override
  String get review_submit => 'Envoyer';

  @override
  String get notifications_title => 'Notifications';

  @override
  String get notifications_empty => 'Aucune notification';

  @override
  String get notifications_mark_all_read => 'Tout marquer lu';

  @override
  String get notifications_today => 'Aujourd\'hui';

  @override
  String get notifications_yesterday => 'Hier';

  @override
  String get notifications_this_week => 'Cette semaine';

  @override
  String get notifications_earlier => 'Plus tôt';

  @override
  String get notifications_detail_title => 'Notification';

  @override
  String get notifications_detail_details => 'Détails';

  @override
  String get notifications_detail_order => 'Commande';

  @override
  String get notifications_detail_number => 'Numéro';

  @override
  String get notifications_detail_status => 'Statut';

  @override
  String get notifications_detail_total => 'Total';

  @override
  String get notifications_detail_seller => 'Vendeur';

  @override
  String get notifications_detail_view_order => 'Voir la commande';

  @override
  String get notifications_type_order_confirmed => 'Commande confirmée';

  @override
  String get notifications_type_delivery_in_progress => 'Livraison en cours';

  @override
  String get notifications_type_new_message => 'Nouveau message';

  @override
  String get notifications_type_payment_received => 'Paiement reçu';

  @override
  String get notifications_type_new_review => 'Nouvel avis';

  @override
  String get notifications_type_promotion => 'Promotion';

  @override
  String get notifications_type_low_stock => 'Alerte stock faible';

  @override
  String get notifications_type_welcome => 'Bienvenue sur Okiba !';

  @override
  String get profile_title => 'Mon profil';

  @override
  String get profile_edit => 'Modifier';

  @override
  String get profile_orders => 'Mes commandes';

  @override
  String get profile_favorites => 'Favoris';

  @override
  String get profile_payment => 'Modes de paiement';

  @override
  String get profile_addresses => 'Mes adresses';

  @override
  String get profile_settings => 'Paramètres';

  @override
  String get profile_help => 'Aide';

  @override
  String get profile_logout => 'Déconnexion';

  @override
  String get profile_role_client => 'Client';

  @override
  String get profile_role_seller => 'Vendeur';

  @override
  String get profile_role_delivery => 'Livreur';

  @override
  String profile_logged_in_as(Object role) {
    return 'Vous êtes connecté en tant que $role';
  }

  @override
  String get profile_notifications => 'Notifications';

  @override
  String get profile_language => 'Langue';

  @override
  String get profile_low_data_mode => 'Mode économique';

  @override
  String get profile_privacy_security => 'Sécurité';

  @override
  String get profile_social => 'Social';

  @override
  String get profile_referral => 'Parrainage';

  @override
  String profile_referral_earn(Object amount) {
    return 'Gagnez $amount par ami';
  }

  @override
  String get profile_support => 'Support';

  @override
  String get profile_about => 'À propos';

  @override
  String profile_version(Object version) {
    return 'Version $version';
  }

  @override
  String get profile_account => 'Compte';

  @override
  String get profile_delete_account => 'Supprimer mon compte';

  @override
  String get profile_logout_action => 'Se déconnecter';

  @override
  String get profile_edit_title => 'Modifier le profil';

  @override
  String get profile_edit_name => 'Nom complet';

  @override
  String get profile_edit_name_required => 'Nom requis';

  @override
  String get profile_edit_bio => 'Bio';

  @override
  String get profile_edit_phone => 'Téléphone';

  @override
  String get profile_edit_email => 'E-mail';

  @override
  String get profile_edit_location => 'Modifier ma localisation';

  @override
  String get profile_language_title => 'Langue';

  @override
  String get profile_language_choose => 'Choisissez votre langue préférée';

  @override
  String get profile_language_default => 'Langue par défaut';

  @override
  String get profile_low_data_title => 'Mode économique';

  @override
  String get profile_low_data_desc => 'Économisez vos données mobiles';

  @override
  String get profile_low_data_enable => 'Activer la compression des images';

  @override
  String get profile_low_data_low_res => 'Images en basse résolution';

  @override
  String get profile_low_data_no_auto_video => 'Désactiver les vidéos auto';

  @override
  String get profile_low_data_offline => 'Télécharger en Wi-Fi seulement';

  @override
  String get profile_low_data_saved => 'Données économisées';

  @override
  String profile_low_data_saved_desc(Object mb, Object percent) {
    return '$mb Mo • $percent% économisés cette semaine';
  }

  @override
  String get profile_notification_settings_title =>
      'Paramètres de notification';

  @override
  String get profile_notif_push => 'Push';

  @override
  String get profile_notif_orders => 'Commandes';

  @override
  String get profile_notif_orders_desc => 'Alertes de confirmation et statut';

  @override
  String get profile_notif_promotions => 'Promotions';

  @override
  String get profile_notif_promotions_desc => 'Offres et réductions';

  @override
  String get profile_notif_chat => 'Chat';

  @override
  String get profile_notif_chat_desc => 'Nouveaux messages';

  @override
  String get profile_notif_delivery => 'Livraison';

  @override
  String get profile_notif_delivery_desc => 'Mise à jour livraison';

  @override
  String get profile_notif_email => 'Email';

  @override
  String get profile_notif_email_confirmations => 'Confirmations commandes';

  @override
  String get profile_notif_email_confirmations_desc => 'Reçu par email';

  @override
  String get profile_notif_email_newsletter => 'Newsletter hebdo';

  @override
  String get profile_notif_email_newsletter_desc => 'Résumé de la semaine';

  @override
  String get profile_notif_sms => 'SMS';

  @override
  String get profile_notif_sms_delivery => 'Notifications de livraison';

  @override
  String get profile_notif_sms_otp => 'OTP';

  @override
  String get profile_notif_sms_otp_desc => 'Codes de vérification';

  @override
  String get profile_privacy_title => 'Confidentialité & sécurité';

  @override
  String get profile_privacy_password => 'Mot de passe';

  @override
  String profile_privacy_password_changed(Object time) {
    return 'Dernière modification il y a $time';
  }

  @override
  String get profile_privacy_fingerprint => 'Empreinte digitale';

  @override
  String get profile_privacy_fingerprint_desc =>
      'Déverrouiller avec votre empreinte';

  @override
  String get profile_privacy_2fa => 'Double authentification';

  @override
  String get profile_privacy_2fa_desc => 'Code supplémentaire à la connexion';

  @override
  String get profile_privacy_privacy => 'Confidentialité';

  @override
  String get profile_privacy_share_data => 'Partager mes données';

  @override
  String get profile_privacy_share_data_desc => 'Améliorer votre expérience';

  @override
  String get profile_privacy_policy => 'Politique de confidentialité';

  @override
  String get profile_privacy_download_data => 'Télécharger mes données';

  @override
  String get profile_privacy_devices => 'Appareils connectés';

  @override
  String get profile_privacy_change_password => 'Changer le mot de passe';

  @override
  String get profile_privacy_current_password => 'Mot de passe actuel';

  @override
  String get profile_privacy_new_password => 'Nouveau mot de passe';

  @override
  String get profile_privacy_confirm_password => 'Confirmer le mot de passe';

  @override
  String get profile_privacy_update_password => 'Mettre à jour';

  @override
  String get profile_payment_title => 'Moyens de paiement';

  @override
  String get profile_payment_mobile_money => 'Mobile Money';

  @override
  String get profile_payment_cards => 'Cartes bancaires';

  @override
  String get profile_payment_add_card => 'Ajouter une carte';

  @override
  String get profile_payment_card_hint => 'Visa, Mastercard';

  @override
  String get profile_payment_cash => 'Espèces';

  @override
  String get profile_payment_cash_desc => 'Paiement à la livraison';

  @override
  String get profile_payment_default => 'Défaut';

  @override
  String get profile_address_title => 'Mes adresses';

  @override
  String get profile_address_default => 'Défaut';

  @override
  String get profile_address_edit => 'Modifier';

  @override
  String get profile_address_delete => 'Supprimer';

  @override
  String get profile_address_set_default => 'Définir par défaut';

  @override
  String get profile_address_add => 'Ajouter une adresse';

  @override
  String get profile_address_edit_title => 'Modifier l\'adresse';

  @override
  String get profile_address_label_hint => 'Libellé (ex: Domicile)';

  @override
  String get profile_address_full => 'Adresse complète';

  @override
  String get profile_address_save => 'Enregistrer';

  @override
  String get profile_address_new => 'Nouvelle adresse';

  @override
  String get profile_address_add_action => 'Ajouter';

  @override
  String get profile_address_delete_confirm => 'Supprimer l\'adresse ?';

  @override
  String profile_address_delete_sure(Object label) {
    return 'Êtes-vous sûr de vouloir supprimer \"$label\" ?';
  }

  @override
  String get profile_referral_title => 'Parrainage';

  @override
  String get profile_referral_subtitle => 'Parrainez vos amis';

  @override
  String profile_referral_earn_per_friend(Object amount) {
    return 'Vous gagnez $amount par ami parrainé';
  }

  @override
  String get profile_referral_code => 'VOTRE CODE';

  @override
  String get profile_referral_share => 'Partager mon code';

  @override
  String get profile_referral_friends => 'Amis parrainés';

  @override
  String get profile_referral_earned => 'Gagnés';

  @override
  String get profile_referral_pending => 'En attente';

  @override
  String get profile_referral_how_it_works => 'Comment ça marche ?';

  @override
  String get profile_referral_step1_title => 'Partagez votre code';

  @override
  String get profile_referral_step1_desc =>
      'Envoyez votre code de parrainage à vos amis';

  @override
  String get profile_referral_step2_title => 'Ils s\'inscrivent';

  @override
  String get profile_referral_step2_desc =>
      'Votre ami utilise votre code lors de l\'inscription';

  @override
  String get profile_referral_step3_title => 'Vous gagnez';

  @override
  String profile_referral_step3_desc(Object amount) {
    return 'Après sa première commande, vous recevez $amount';
  }

  @override
  String get profile_referral_history => 'Historique';

  @override
  String get profile_referral_registered => 'Inscrit';

  @override
  String get profile_referral_pending_status => '—';

  @override
  String get profile_about_title => 'À propos';

  @override
  String profile_about_version(Object build, Object version) {
    return 'Version $version (build $build)';
  }

  @override
  String get profile_about_terms => 'Conditions générales d\'utilisation';

  @override
  String get profile_about_privacy => 'Politique de confidentialité';

  @override
  String get profile_about_legal => 'Mentions légales';

  @override
  String get profile_about_licenses => 'Licences open source';

  @override
  String get profile_about_rate => 'Noter l\'application';

  @override
  String get profile_about_report => 'Signaler un bug';

  @override
  String get profile_about_made_in => 'Made with ❤ in Gabon';

  @override
  String get profile_delete_account_title => 'Supprimer mon compte';

  @override
  String get profile_delete_account_warning => 'Attention';

  @override
  String get profile_delete_account_irreversible =>
      'Cette action est irréversible. Toutes vos données seront supprimées après 30 jours.';

  @override
  String get profile_delete_account_why =>
      'Pourquoi supprimez-vous votre compte ?';

  @override
  String get profile_delete_account_not_using =>
      'Je n\'utilise plus l\'application';

  @override
  String get profile_delete_account_too_many_notif =>
      'Je reçois trop de notifications';

  @override
  String get profile_delete_account_delivery_issues => 'Problèmes de livraison';

  @override
  String get profile_delete_account_payment_issues => 'Problèmes de paiement';

  @override
  String get profile_delete_account_new_account => 'Je crée un nouveau compte';

  @override
  String get profile_delete_account_other => 'Autre';

  @override
  String get profile_delete_account_understand =>
      'Je comprends que cette action est irréversible';

  @override
  String get profile_delete_account_button => 'Supprimer mon compte';

  @override
  String get profile_delete_account_last_step => 'Dernière étape';

  @override
  String get profile_delete_account_last_step_desc =>
      'Votre compte sera définitivement supprimé après 30 jours.';

  @override
  String get profile_delete_account_confirm => 'Confirmer la suppression';

  @override
  String get profile_accessibility_title => 'Accessibilité';

  @override
  String get profile_accessibility_display => 'Affichage';

  @override
  String get profile_accessibility_text_size => 'Taille du texte';

  @override
  String get profile_accessibility_high_contrast => 'Contraste élevé';

  @override
  String get profile_accessibility_high_contrast_desc =>
      'Améliore la lisibilité';

  @override
  String get profile_accessibility_reduce_animations =>
      'Réduire les animations';

  @override
  String get profile_accessibility_reduce_animations_desc =>
      'Diminue les mouvements';

  @override
  String get profile_accessibility_large_touch => 'Grandes zones tactiles';

  @override
  String get profile_accessibility_large_touch_desc =>
      'Minimum 56dp pour les boutons';

  @override
  String get profile_accessibility_preview => 'Prévisualisation';

  @override
  String get profile_accessibility_preview_text =>
      'Ceci est un exemple de texte avec la taille sélectionnée.';

  @override
  String get settings_title => 'Paramètres';

  @override
  String get settings_language => 'Langue';

  @override
  String get settings_language_fr => 'Français';

  @override
  String get settings_language_en => 'English';

  @override
  String get settings_dark_mode => 'Mode sombre';

  @override
  String get settings_low_bandwidth => 'Mode bas débit';

  @override
  String get settings_notifications => 'Notifications';

  @override
  String get settings_about => 'À propos';

  @override
  String get help_title => 'Aide';

  @override
  String get help_need_help => 'Besoin d\'aide ?';

  @override
  String get help_team_here => 'Notre équipe est là pour vous';

  @override
  String get help_contact => 'Contacter le support';

  @override
  String get help_faq => 'Questions fréquentes';

  @override
  String get help_faq_order => 'Comment passer une commande ?';

  @override
  String get help_faq_order_ans =>
      'Sélectionnez un produit, ajoutez-le au panier et passez commande.';

  @override
  String get help_faq_payment => 'Quels sont les moyens de paiement ?';

  @override
  String get help_faq_payment_ans =>
      'Nous acceptons Orange Money, MTN MoMo, Airtel Money, carte et espèces.';

  @override
  String get help_faq_delivery => 'Comment fonctionne la livraison ?';

  @override
  String get help_faq_delivery_ans =>
      'La livraison est effectuée par nos livreurs partenaires.';

  @override
  String get help_faq_return => 'Puis-je retourner un produit ?';

  @override
  String get help_faq_return_ans => 'Oui, sous 14 jours après réception.';

  @override
  String get help_faq_seller => 'Comment devenir vendeur ?';

  @override
  String get help_faq_seller_ans =>
      'Allez dans votre profil et sélectionnez \"Devenir vendeur\".';

  @override
  String get help_contact_email => 'E-mail';

  @override
  String get help_contact_whatsapp => 'WhatsApp';

  @override
  String get help_contact_call => 'Appel';

  @override
  String get admin_title => 'Admin';

  @override
  String get admin_overview => 'Aperçu';

  @override
  String get admin_users => 'Utilisateurs';

  @override
  String get admin_orders => 'Commandes';

  @override
  String get admin_revenue => 'Revenus';

  @override
  String get admin_disputes => 'Litiges';

  @override
  String get admin_recent_orders => 'Dernières commandes';

  @override
  String get admin_actions => 'Actions';

  @override
  String get admin_kyc => 'KYC';

  @override
  String get admin_orders_title => 'Commandes';

  @override
  String get admin_orders_all => 'Toutes';

  @override
  String get admin_orders_disputes => 'Litiges';

  @override
  String get admin_orders_refunds => 'Remboursements';

  @override
  String get admin_orders_reason_not_conforming => 'Produit non conforme';

  @override
  String get admin_orders_reason_not_received => 'Livraison non reçue';

  @override
  String get admin_orders_reason_damaged => 'Article endommagé';

  @override
  String get admin_orders_pending => 'En attente';

  @override
  String get admin_orders_resolved => 'Résolu';

  @override
  String get admin_orders_refunded => 'Remboursé';

  @override
  String get admin_orders_processing => 'En traitement';

  @override
  String get admin_orders_reason => 'Motif :';

  @override
  String get admin_orders_resolve => 'Résoudre';

  @override
  String get admin_orders_refund => 'Rembourser';

  @override
  String get admin_users_title => 'Utilisateurs';

  @override
  String get admin_users_total => 'Total';

  @override
  String get admin_users_clients => 'Clients';

  @override
  String get admin_users_sellers => 'Vendeurs';

  @override
  String get admin_users_drivers => 'Livreurs';

  @override
  String get admin_users_all => 'Tous';

  @override
  String get admin_users_active => 'Actif';

  @override
  String get admin_users_suspended => 'Suspendu';

  @override
  String get admin_users_pending_kyc => 'En attente KYC';

  @override
  String get admin_users_view_profile => 'Voir le profil';

  @override
  String get admin_users_suspend => 'Suspendre';

  @override
  String get admin_users_reactivate => 'Réactiver';

  @override
  String get admin_users_verify_kyc => 'Vérifier KYC';

  @override
  String get admin_users_delete_user => 'Supprimer';

  @override
  String get admin_kyc_title => 'Vérification KYC';

  @override
  String get admin_kyc_pending => 'En attente';

  @override
  String get admin_kyc_approved => 'Approuvé';

  @override
  String get admin_kyc_rejected => 'Rejeté';

  @override
  String admin_kyc_submitted(Object date) {
    return 'Soumis le $date';
  }

  @override
  String get admin_kyc_selfie => 'Selfie';

  @override
  String get admin_kyc_id_front => 'CNI recto';

  @override
  String get admin_kyc_id_back => 'CNI verso';

  @override
  String get admin_kyc_approve => 'Approuver';

  @override
  String get admin_kyc_reject => 'Rejeter';

  @override
  String get admin_kyc_reject_title => 'Rejeter la vérification';

  @override
  String admin_kyc_reject_reason(Object name) {
    return 'Motif du rejet pour $name :';
  }

  @override
  String get admin_kyc_reject_hint => 'Document illisible, photo manquante...';

  @override
  String get general_confirm => 'Confirmer';

  @override
  String get general_cancel => 'Annuler';

  @override
  String get general_save => 'Enregistrer';

  @override
  String get general_delete => 'Supprimer';

  @override
  String get general_search => 'Rechercher';

  @override
  String get general_loading => 'Chargement...';

  @override
  String get general_error => 'Une erreur est survenue';

  @override
  String get general_retry => 'Réessayer';

  @override
  String get general_no_internet => 'Pas de connexion Internet';

  @override
  String get general_offline => 'Mode hors ligne';

  @override
  String get general_filters => 'Filtres';

  @override
  String get general_sort => 'Trier';

  @override
  String get general_close => 'Fermer';

  @override
  String get general_yes => 'Oui';

  @override
  String get general_no => 'Non';

  @override
  String get general_ok => 'OK';

  @override
  String get general_success => 'Succès';

  @override
  String get general_submit => 'Soumettre';

  @override
  String get general_next => 'Suivant';

  @override
  String get general_previous => 'Précédent';

  @override
  String get general_finish => 'Terminer';

  @override
  String get general_skip => 'Passer';

  @override
  String get general_share => 'Partager';

  @override
  String get general_copy => 'Copier';

  @override
  String get general_see_all => 'Voir tout';

  @override
  String get general_edit => 'Modifier';

  @override
  String get general_add => 'Ajouter';

  @override
  String get filter_price => 'Prix';

  @override
  String get filter_category => 'Catégorie';

  @override
  String get filter_zone => 'Zone';

  @override
  String get filter_rating => 'Note minimum';

  @override
  String get filter_seller_type => 'Type de vendeur';

  @override
  String get filter_free_delivery => 'Livraison gratuite';

  @override
  String get filter_apply => 'Appliquer';

  @override
  String get currency_fcfa => 'FCFA';

  @override
  String time_min_ago(Object minutes) {
    return 'Il y a $minutes min';
  }

  @override
  String time_h_ago(Object hours) {
    return 'Il y a ${hours}h';
  }

  @override
  String time_d_ago(Object days) {
    return 'Il y a ${days}j';
  }

  @override
  String get tutorial_title => 'Tutoriel';

  @override
  String get tutorial_step1_title => 'Accueil';

  @override
  String get tutorial_step1_desc =>
      'Parcourez les produits près de chez vous, découvrez les nouveautés.';

  @override
  String get tutorial_step2_title => 'Commander';

  @override
  String get tutorial_step2_desc =>
      'Ajoutez au panier, négociez le prix et passez commande en toute sécurité.';

  @override
  String get tutorial_step3_title => 'Paiement';

  @override
  String get tutorial_step3_desc =>
      'Payez avec Orange Money, MTN MoMo, Airtel Money ou en espèces.';

  @override
  String get tutorial_step4_title => 'Suivi';

  @override
  String get tutorial_step4_desc =>
      'Suivez votre commande en temps réel et recevez les mises à jour.';

  @override
  String get whats_new_title => 'Nouveautés';

  @override
  String get whats_new_feature1_title => 'Nouvelle boutique';

  @override
  String get whats_new_feature1_desc =>
      'Les vendeurs ont maintenant leur propre boutique personnalisée.';

  @override
  String get whats_new_feature2_title => 'Mode rapide';

  @override
  String get whats_new_feature2_desc =>
      'Vendez en 2 minutes : photo, description, prix — c\'est en ligne !';

  @override
  String get whats_new_feature3_title => 'Suivi en temps réel';

  @override
  String get whats_new_feature3_desc =>
      'Suivez votre livreur sur la carte avec des mises à jour en direct.';

  @override
  String get whats_new_discover => 'Découvrir';

  @override
  String get rate_title => 'Noter Okiba';

  @override
  String get rate_question => 'Vous aimez Okiba ?';

  @override
  String get rate_desc => 'Votre avis nous aide à nous améliorer';

  @override
  String get rate_sorry =>
      'Nous sommes désolés. Dites-nous comment améliorer :';

  @override
  String get rate_thanks => 'Merci ! Comment pouvons-nous faire mieux ?';

  @override
  String get rate_great => 'Super ! Merci pour votre soutien !';

  @override
  String get rate_store => 'Noter sur le Store';

  @override
  String get rate_send => 'Envoyer';

  @override
  String get rate_thank_you => 'Merci !';

  @override
  String get rate_feedback_recorded => 'Votre avis a bien été enregistré.';

  @override
  String get rate_close => 'Fermer';

  @override
  String get app_update_title => 'Mise à jour disponible';

  @override
  String app_update_new_version(Object version) {
    return 'Version $version disponible';
  }

  @override
  String app_update_current(Object current) {
    return 'Vous utilisez actuellement la version $current';
  }

  @override
  String get app_update_button => 'Mettre à jour';

  @override
  String get app_update_later => 'Plus tard';

  @override
  String app_update_whats_new_title(Object version) {
    return 'Nouveautés de la version $version';
  }

  @override
  String get app_update_feature_boutique =>
      'Nouveau design de la boutique vendeur';

  @override
  String get app_update_feature_rapid =>
      'Mode vente rapide : publiez en 2 minutes';

  @override
  String get app_update_feature_tracking =>
      'Suivi de livraison en temps réel sur la carte';

  @override
  String get app_update_feature_airtel =>
      'Paiement par Airtel Money maintenant disponible';

  @override
  String get app_update_feature_perf =>
      'Amélioration des performances et corrections de bugs';
}

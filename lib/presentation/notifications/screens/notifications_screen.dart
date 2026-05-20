import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.notifications_title),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(l10n.notifications_mark_all_read),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.space8),
        children: [
          _sectionHeader(l10n.notifications_today, colorScheme, textTheme),
          _notificationTile(
            Icons.shopping_bag_rounded,
            colorScheme.primary,
            l10n.notifications_type_order_confirmed,
            'Votre commande #OKB-2024-001 a été confirmée.',
            '12:30',
            false,
            colorScheme,
            textTheme,
            context,
          ),
          _notificationTile(
            Icons.delivery_dining_rounded,
            colorScheme.secondary,
            l10n.notifications_type_delivery_in_progress,
            'Votre colis est en route. Livraison prévue entre 14h et 16h.',
            '11:15',
            false,
            colorScheme,
            textTheme,
            context,
          ),
          _notificationTile(
            Icons.chat_rounded,
            colorScheme.tertiary,
            l10n.notifications_type_new_message,
            'Adélaïde Styles vous a envoyé un message.',
            '10:45',
            true,
            colorScheme,
            textTheme,
            context,
          ),
          const Divider(height: AppSpacing.space24, indent: 16, endIndent: 16),
          _sectionHeader(l10n.notifications_yesterday, colorScheme, textTheme),
          _notificationTile(
            Icons.payments_rounded,
            colorScheme.primary,
            l10n.notifications_type_payment_received,
            'Vous avez reçu 15 000 FCFA pour la vente de votre article.',
            '18:20',
            true,
            colorScheme,
            textTheme,
            context,
          ),
          _notificationTile(
            Icons.star_rounded,
            colorScheme.secondary,
            l10n.notifications_type_new_review,
            'Pierre K. a laissé un avis 5 étoiles sur votre produit.',
            '14:30',
            true,
            colorScheme,
            textTheme,
            context,
          ),
          const Divider(height: AppSpacing.space24, indent: 16, endIndent: 16),
          _sectionHeader(l10n.notifications_this_week, colorScheme, textTheme),
          _notificationTile(
            Icons.local_offer_rounded,
            colorScheme.error,
            l10n.notifications_type_promotion,
            'Profitez de -20% sur la livraison ce weekend avec le code OKIBA20.',
            'Mar 14',
            true,
            colorScheme,
            textTheme,
            context,
          ),
          _notificationTile(
            Icons.inventory_rounded,
            colorScheme.primary,
            l10n.notifications_type_low_stock,
            'Votre produit "Chemise traditionnelle" n\'a plus que 2 exemplaires.',
            'Mar 13',
            true,
            colorScheme,
            textTheme,
            context,
          ),
          _notificationTile(
            Icons.account_circle_rounded,
            colorScheme.tertiary,
            l10n.notifications_type_welcome,
            'Merci de rejoindre la communauté. Découvrez nos fonctionnalités.',
            'Mar 10',
            true,
            colorScheme,
            textTheme,
            context,
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(
    String label,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.space16,
        AppSpacing.space8,
        AppSpacing.space16,
        AppSpacing.space4,
      ),
      child: Text(
        label,
        style: textTheme.titleSmall?.copyWith(
          color: colorScheme.primary,
        ),
      ),
    );
  }

  Widget _notificationTile(
    IconData icon,
    Color iconColor,
    String title,
    String body,
    String time,
    bool read,
    ColorScheme colorScheme,
    TextTheme textTheme,
    BuildContext context,
  ) {
    return InkWell(
      onTap: () => context.push(RoutePaths.notificationDetail.replaceFirst(':id', title.toLowerCase().replaceAll(' ', '-'))),
      child: ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.space16,
        vertical: AppSpacing.space4,
      ),
      leading: Stack(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          if (!read)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: colorScheme.error,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: colorScheme.surface,
                    width: 1.5,
                  ),
                ),
              ),
            ),
        ],
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: textTheme.titleSmall?.copyWith(
                fontWeight: read ? FontWeight.w400 : FontWeight.w600,
              ),
            ),
          ),
          Text(
            time,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
      subtitle: Text(
        body,
        style: textTheme.bodyMedium?.copyWith(
          color: read
              ? colorScheme.onSurfaceVariant
              : colorScheme.onSurface,
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
      ),
    );
  }
}

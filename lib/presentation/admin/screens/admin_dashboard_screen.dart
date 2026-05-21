import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class AdminDashboardScreen extends StatelessWidget {
  const AdminDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.admin_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Text(l10n.admin_overview, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          Row(
            children: [
              Expanded(child: _statCard('12 450', l10n.admin_users, Icons.people_rounded, colorScheme.primary, colorScheme, textTheme)),
              const SizedBox(width: AppSpacing.space12),
              Expanded(child: _statCard('3 280', l10n.admin_orders, Icons.shopping_bag_rounded, colorScheme.secondary, colorScheme, textTheme)),
            ],
          ),
          const SizedBox(height: AppSpacing.space12),
          Row(
            children: [
              Expanded(child: _statCard('45,2 M', 'FCFA revenus', Icons.trending_up_rounded, Colors.green, colorScheme, textTheme)),
              const SizedBox(width: AppSpacing.space12),
              Expanded(child: _statCard('12', l10n.admin_disputes, Icons.warning_rounded, colorScheme.error, colorScheme, textTheme)),
            ],
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.admin_recent_orders, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space12),
          _orderRow('#OKB-050', '15 000 FCFA', 'Alice M.', 'En cours', colorScheme, textTheme),
          _orderRow('#OKB-049', '25 000 FCFA', 'Paul D.', 'Livré', colorScheme, textTheme),
          _orderRow('#OKB-048', '8 500 FCFA', 'Marie K.', 'Litige', colorScheme, textTheme),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.admin_actions, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space12),
          Row(
            children: [
              Expanded(child: _actionCard(l10n.admin_users, Icons.people_rounded, colorScheme.primary, colorScheme, textTheme, () => context.push(RoutePaths.adminUsers))),
              const SizedBox(width: AppSpacing.space8),
              Expanded(child: _actionCard(l10n.admin_orders, Icons.shopping_bag_rounded, colorScheme.secondary, colorScheme, textTheme, () => context.push(RoutePaths.adminOrders))),
              const SizedBox(width: AppSpacing.space8),
              Expanded(child: _actionCard(l10n.admin_kyc, Icons.verified_user_rounded, colorScheme.tertiary, colorScheme, textTheme, () => context.push(RoutePaths.adminKyc))),
            ],
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  Widget _statCard(String value, String label, IconData icon, Color color, ColorScheme colorScheme, TextTheme textTheme) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space16),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: 24),
          const SizedBox(height: AppSpacing.space8),
          Text(value, style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w700)),
          Text(label, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }

  Widget _orderRow(String id, String amount, String client, String status, ColorScheme colorScheme, TextTheme textTheme) {
    final statusColor = status == 'Livré' ? Colors.green : status == 'Litige' ? colorScheme.error : colorScheme.primary;
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space4),
      child: ListTile(
        title: Text(id, style: textTheme.titleSmall),
        subtitle: Text(client, style: textTheme.bodySmall),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(amount, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
            const SizedBox(width: AppSpacing.space8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: statusColor.withAlpha(25),
                borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
              ),
              child: Text(status, style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _actionCard(String label, IconData icon, Color color, ColorScheme colorScheme, TextTheme textTheme, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.space16),
        decoration: BoxDecoration(
          color: color.withAlpha(25),
          borderRadius: BorderRadius.circular(AppSpacing.radius12),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 28),
            const SizedBox(height: AppSpacing.space4),
            Text(label, style: textTheme.labelMedium?.copyWith(color: color)),
          ],
        ),
      ),
    );
  }
}

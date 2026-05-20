import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class DriverDashboardScreen extends StatelessWidget {
  const DriverDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.profile_role_delivery),
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded),
            onPressed: () => context.push(RoutePaths.driverZone),
          ),
          IconButton(
            icon: const Icon(Icons.person_rounded),
            onPressed: () => context.push(RoutePaths.driverProfile),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.space16),
            decoration: BoxDecoration(
              color: colorScheme.surface,
              borderRadius: BorderRadius.circular(AppSpacing.radius16),
              border: Border.all(color: colorScheme.outlineVariant),
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.delivery_dining_rounded,
                    color: colorScheme.onPrimary,
                  ),
                ),
                const SizedBox(width: AppSpacing.space12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.delivery_online,
                        style: textTheme.titleMedium?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        l10n.delivery_available,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Switch(
                  value: true,
                  activeThumbColor: colorScheme.primary,
                  onChanged: (_) {},
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          GestureDetector(
            onTap: () => context.push(RoutePaths.driverEarnings),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.notifications_today, style: textTheme.titleLarge),
                const SizedBox(height: AppSpacing.space16),
                Row(
                  children: [
                    Expanded(
                      child: _statCard(
                        '8 500',
                        l10n.delivery_fcfc_earned,
                        Icons.monetization_on_rounded,
                        colorScheme.primary,
                        colorScheme,
                        textTheme,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.space12),
                    Expanded(
                      child: _statCard(
                        '5',
                        l10n.delivery_deliveries,
                        Icons.check_circle_rounded,
                        colorScheme.secondary,
                        colorScheme,
                        textTheme,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.space12),
                    Expanded(
                      child: _statCard(
                        '12 km',
                        l10n.delivery_km_traveled,
                        Icons.route_rounded,
                        colorScheme.tertiary,
                        colorScheme,
                        textTheme,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.delivery_new_request, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          _deliveryRequest(
            'Chemise traditionnelle',
            'Adélaïde Styles → Alice M.',
            '2 km • 1 500 FCFA',
            'Libreville, Louis',
            colorScheme,
            textTheme,
            context,
          ),
          const SizedBox(height: AppSpacing.space12),
          _deliveryRequest(
            'Poulet braisé + Sauce',
            'Maman Binta → Pierre K.',
            '3.5 km • 2 000 FCFA',
            'Libreville, Centre',
            colorScheme,
            textTheme,
            context,
          ),
          const SizedBox(height: AppSpacing.space24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(l10n.delivery_ongoing, style: textTheme.titleLarge),
              TextButton(
                onPressed: () => context.push(RoutePaths.driverEarnings),
                child: Text(l10n.general_see_all),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.space12),
          _activeDelivery(
            '#OKB-2024-001',
            '15 000 FCFA',
            'Alice M. - Quartier Louis',
            'En attente de retrait',
            colorScheme,
            textTheme,
            context,
          ),
          _activeDelivery(
            '#OKB-2024-002',
            '5 500 FCFA',
            'Pierre K. - Centre-ville',
            'En livraison',
            colorScheme,
            textTheme,
            context,
            isActive: true,
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.delivery_history, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          _historyItem(
            '#OKB-2024-003',
            'Livré',
            '12:30',
            '2 000 FCFA',
            colorScheme,
            textTheme,
          ),
          _historyItem(
            '#OKB-2024-004',
            'Livré',
            '11:15',
            '1 500 FCFA',
            colorScheme,
            textTheme,
          ),
          _historyItem(
            '#OKB-2024-005',
            'Livré',
            '09:45',
            '2 000 FCFA',
            colorScheme,
            textTheme,
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  Widget _statCard(
    String value,
    String label,
    IconData icon,
    Color color,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.space12),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        border: Border.all(color: colorScheme.outlineVariant),
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 22),
          const SizedBox(height: AppSpacing.space8),
          Text(
            value,
            style: textTheme.titleMedium?.copyWith(
              color: color,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            label,
            style: textTheme.bodySmall?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _deliveryRequest(
    String product,
    String route,
    String earning,
    String address,
    ColorScheme colorScheme,
    TextTheme textTheme,
    BuildContext context,
  ) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: colorScheme.secondaryContainer,
                    borderRadius: BorderRadius.circular(AppSpacing.radius8),
                  ),
                  child: Icon(
                    Icons.inventory_2_rounded,
                    color: colorScheme.onSecondaryContainer,
                  ),
                ),
                const SizedBox(width: AppSpacing.space12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product, style: textTheme.titleSmall),
                      const SizedBox(height: 2),
                      Text(
                        route,
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.space8,
                    vertical: AppSpacing.space4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                  child: Text(
                    earning,
                    style: textTheme.labelSmall?.copyWith(
                      color: colorScheme.onPrimaryContainer,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.space12),
            Row(
              children: [
                Icon(
                  Icons.location_on_rounded,
                  size: 16,
                  color: colorScheme.onSurfaceVariant,
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    address,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.space12),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(l10n.delivery_refuse),
                    ),
                  ),
                ),
                const SizedBox(width: AppSpacing.space12),
                Expanded(
                  child: SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () => context.push(
                        RoutePaths.driverRequest.replaceFirst(':id', '1'),
                      ),
                      child: Text(l10n.delivery_accept),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _activeDelivery(
    String orderId,
    String amount,
    String client,
    String status,
    ColorScheme colorScheme,
    TextTheme textTheme,
    BuildContext context, {
    bool isActive = false,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        onTap: () => context.push(
          RoutePaths.driverNavigation.replaceFirst(':id', orderId),
        ),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space12),
          child: Row(
            children: [
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: isActive
                      ? colorScheme.secondaryContainer
                      : colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: isActive
                    ? const Icon(Icons.delivery_dining_rounded)
                    : Icon(
                        Icons.pending_rounded,
                        color: colorScheme.onSurfaceVariant,
                      ),
              ),
              const SizedBox(width: AppSpacing.space12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(orderId, style: textTheme.titleSmall),
                        const Spacer(),
                        Text(
                          amount,
                          style: textTheme.titleSmall?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 2),
                    Text(
                      client,
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Row(
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: isActive
                                ? colorScheme.secondary
                                : colorScheme.onSurfaceVariant,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          status,
                          style: textTheme.labelSmall?.copyWith(
                            color: isActive
                                ? colorScheme.secondary
                                : colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _historyItem(
    String orderId,
    String status,
    String time,
    String earning,
    ColorScheme colorScheme,
    TextTheme textTheme,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: Row(
        children: [
          Icon(
            Icons.check_circle_rounded,
            size: 20,
            color: colorScheme.primary,
          ),
          const SizedBox(width: AppSpacing.space8),
          Expanded(
            child: Text(
              '$orderId • $time',
              style: textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
          ),
          Text(
            earning,
            style: textTheme.titleSmall?.copyWith(
              color: colorScheme.primary,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

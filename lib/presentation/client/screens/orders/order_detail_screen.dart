import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/navigation/route_names.dart';

class OrderDetailScreen extends StatelessWidget {
  final String orderId;

  const OrderDetailScreen({super.key, required this.orderId});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          onPressed: () => context.pop(),
        ),
        title: Text(orderId),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Statut
          Card(
            child: InkWell(
              onTap: () => context.push(
                RoutePaths.orderTracking.replaceAll(':id', orderId),
              ),
              borderRadius: BorderRadius.circular(AppSpacing.radius12),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.space16),
                child: Column(
                  children: [
                    Icon(
                      Icons.timer_rounded,
                      size: 40,
                      color: colorScheme.secondary,
                    ),
                    const SizedBox(height: AppSpacing.space8),
                    Text(
                      'En cours',
                      style: textTheme.titleMedium?.copyWith(
                        color: colorScheme.secondary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.space4),
                    Text(
                      'Livraison prévue aujourd\'hui, 14h-16h',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.space8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.map_rounded, size: 14, color: colorScheme.primary),
                        const SizedBox(width: 4),
                        Text(
                          'Suivre en direct',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.primary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
          // Suivi
          Text(AppLocalizations.of(context)!.order_tracking_title, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Column(
                children: [
                  _trackingStep(
                    AppLocalizations.of(context)!.order_status_confirmed,
                    '15 mai, 10h30',
                    true,
                    colorScheme,
                    textTheme,
                  ),
                  _trackingStep(
                    AppLocalizations.of(context)!.order_status_preparing,
                    '15 mai, 11h00',
                    true,
                    colorScheme,
                    textTheme,
                  ),
                  _trackingStep(
                    'En livraison',
                    '15 mai, 13h15',
                    false,
                    colorScheme,
                    textTheme,
                    isActive: true,
                  ),
                  _trackingStep(
                    AppLocalizations.of(context)!.order_status_delivered,
                    null,
                    false,
                    colorScheme,
                    textTheme,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Articles
          Text(AppLocalizations.of(context)!.checkout_review_items, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space12),
          ...List.generate(3, (i) {
            return Card(
              margin: const EdgeInsets.only(bottom: AppSpacing.space8),
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.space12),
                child: Row(
                  children: [
                    Container(
                      width: 64,
                      height: 64,
                      decoration: BoxDecoration(
                        color: colorScheme.surfaceContainerHighest,
                        borderRadius:
                            BorderRadius.circular(AppSpacing.radius8),
                      ),
                      child: Icon(
                        Icons.image_rounded,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.space12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            i == 0
                                ? 'Chemise traditionnelle'
                                : i == 1
                                    ? 'Poulet braisé'
                                    : 'Smartphone reconditionné',
                            style: textTheme.titleSmall,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'x${i == 0 ? 2 : 1}',
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      i == 0
                          ? '30 000 FCFA'
                          : i == 1
                              ? '5 500 FCFA'
                              : '85 000 FCFA',
                      style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.primary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          const SizedBox(height: AppSpacing.space24),
          // Récapitulatif
          Text(AppLocalizations.of(context)!.checkout_summary, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Column(
                children: [
                  _summaryRow(
                    'Sous-total',
                    '120 500 FCFA',
                    textTheme,
                    colorScheme,
                  ),
                  const SizedBox(height: AppSpacing.space8),
                  _summaryRow(
                    AppLocalizations.of(context)!.checkout_review_delivery,
                    '2 000 FCFA',
                    textTheme,
                    colorScheme,
                  ),
                  const SizedBox(height: AppSpacing.space8),
                  _summaryRow(
                    AppLocalizations.of(context)!.checkout_review_payment,
                    'Orange Money',
                    textTheme,
                    colorScheme,
                  ),
                  const Divider(height: AppSpacing.space16),
                  _summaryRow(
                    AppLocalizations.of(context)!.order_total,
                    '122 500 FCFA',
                    textTheme,
                    colorScheme,
                    isTotal: true,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          // Adresse
          Text(AppLocalizations.of(context)!.checkout_address, style: textTheme.titleMedium),
          const SizedBox(height: AppSpacing.space12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: colorScheme.primary,
                  ),
                  const SizedBox(width: AppSpacing.space12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Alice Mbazoghe',
                          style: textTheme.titleSmall,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          '+241 62 00 00 01',
                          style: textTheme.bodyMedium?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          'Libreville, Quartier Louis',
                          style: textTheme.bodySmall?.copyWith(
                            color: colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space32),
          SizedBox(
            width: double.infinity,
            height: AppSpacing.touchMin,
            child: ElevatedButton.icon(
              onPressed: () => context.push(
                RoutePaths.rateOrder.replaceAll(':id', orderId),
              ),
              icon: const Icon(Icons.star_rounded),
              label: Text(AppLocalizations.of(context)!.order_rate_title),
            ),
          ),
          const SizedBox(height: AppSpacing.space12),
          SizedBox(
            width: double.infinity,
            height: AppSpacing.touchMin,
            child: OutlinedButton.icon(
              onPressed: () => context.push(
                RoutePaths.dispute.replaceAll(':id', orderId),
              ),
              icon: const Icon(Icons.warning_amber_rounded),
              label: Text(AppLocalizations.of(context)!.order_dispute_title),
            ),
          ),
          const SizedBox(height: AppSpacing.space16),
        ],
      ),
    );
  }

  Widget _trackingStep(
    String label,
    String? time,
    bool completed,
    ColorScheme colorScheme,
    TextTheme textTheme, {
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.space16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: completed || isActive
                      ? colorScheme.primary
                      : colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: completed
                    ? Icon(
                        Icons.check_rounded,
                        size: 14,
                        color: colorScheme.onPrimary,
                      )
                    : isActive
                        ? SizedBox(
                            width: 8,
                            height: 8,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: colorScheme.onPrimary,
                            ),
                          )
                        : null,
              ),
              Container(
                width: 2,
                height: 32,
                color: completed
                    ? colorScheme.primary
                    : colorScheme.surfaceContainerHighest,
              ),
            ],
          ),
          const SizedBox(width: AppSpacing.space12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: textTheme.titleSmall?.copyWith(
                    color: completed || isActive
                        ? colorScheme.onSurface
                        : colorScheme.onSurfaceVariant,
                  ),
                ),
                if (time != null)
                  Text(
                    time,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _summaryRow(
    String label,
    String value,
    TextTheme textTheme,
    ColorScheme colorScheme, {
    bool isTotal = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? textTheme.titleSmall
              : textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
        ),
        Text(
          value,
          style: isTotal
              ? textTheme.titleMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.w700,
                )
              : textTheme.titleSmall,
        ),
      ],
    );
  }
}

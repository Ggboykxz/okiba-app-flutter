import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';

class OrderCard extends StatelessWidget {
  final String orderId;
  final String date;
  final String status;
  final String total;
  final int itemCount;
  final String? deliveryTime;

  const OrderCard({
    super.key,
    required this.orderId,
    required this.date,
    required this.status,
    required this.total,
    required this.itemCount,
    this.deliveryTime,
  });

  Color _statusColor(ColorScheme colorScheme) {
    switch (status) {
      case 'En cours':
        return colorScheme.secondary;
      case 'Livré':
        return colorScheme.primary;
      case 'Annulé':
        return colorScheme.error;
      default:
        return colorScheme.onSurfaceVariant;
    }
  }

  IconData _statusIcon() {
    switch (status) {
      case 'En cours':
        return Icons.timer_rounded;
      case 'Livré':
        return Icons.check_circle_rounded;
      case 'Annulé':
        return Icons.cancel_rounded;
      default:
        return Icons.receipt_rounded;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Card(
            margin: const EdgeInsets.symmetric(
            horizontal: AppSpacing.space16,
            vertical: AppSpacing.space4,
          ),
      child: InkWell(
        onTap: () => context.pushNamed(
          RouteNames.orderDetail,
          pathParameters: {'id': orderId},
        ),
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    orderId,
                    style: textTheme.titleSmall,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.space8,
                      vertical: AppSpacing.space4,
                    ),
                    decoration: BoxDecoration(
                      color: _statusColor(colorScheme).withValues(alpha: 0.1),
                      borderRadius:
                          BorderRadius.circular(AppSpacing.radiusFull),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          _statusIcon(),
                          size: 14,
                          color: _statusColor(colorScheme),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          status,
                          style: textTheme.labelMedium?.copyWith(
                            color: _statusColor(colorScheme),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.space8),
              Row(
                children: [
                  Icon(
                    Icons.calendar_today_rounded,
                    size: 14,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    date,
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.inventory_2_rounded,
                    size: 14,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '$itemCount article${itemCount > 1 ? 's' : ''}',
                    style: textTheme.bodySmall?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
              const Divider(height: AppSpacing.space20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                  Text(
                    total,
                    style: textTheme.titleMedium?.copyWith(
                      color: colorScheme.primary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
              if (deliveryTime != null) ...[
                const SizedBox(height: AppSpacing.space4),
                Row(
                  children: [
                    Icon(
                      Icons.delivery_dining_rounded,
                      size: 14,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Livraison prévue : $deliveryTime',
                      style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

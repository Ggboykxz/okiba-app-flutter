import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/navigation/route_names.dart';

class OrderTrackingScreen extends StatelessWidget {
  final String orderId;

  const OrderTrackingScreen({super.key, required this.orderId});

  static const _steps = [
    _TrackStep('Commande confirmée', '15 mai, 10h30', true),
    _TrackStep('Préparation en cours', '15 mai, 11h00', true),
    _TrackStep('Livreur en route', '15 mai, 13h15', true, isActive: true),
    _TrackStep('Livré', null, false),
  ];

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
        title: const Text('Suivi en direct'),
      ),
      body: ListView(
        children: [
          // Map placeholder
          Container(
            height: 280,
            color: colorScheme.surfaceContainerHighest,
            child: Stack(
              children: [
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map_rounded, size: 64, color: colorScheme.onSurfaceVariant.withValues(alpha: 0.3)),
                      const SizedBox(height: AppSpacing.space8),
                      Text('Carte de suivi', style: textTheme.titleSmall?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      )),
                      Text('Libreville, Gabon', style: textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurfaceVariant.withValues(alpha: 0.6),
                      )),
                    ],
                  ),
                ),
                // Driver info overlay
                Positioned(
                  bottom: AppSpacing.space16,
                  left: AppSpacing.space16,
                  right: AppSpacing.space16,
                  child: Container(
                    padding: const EdgeInsets.all(AppSpacing.space12),
                    decoration: BoxDecoration(
                      color: colorScheme.surface,
                      borderRadius: BorderRadius.circular(AppSpacing.radius12),
                      boxShadow: [BoxShadow(
                        color: colorScheme.shadow.withValues(alpha: 0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      )],
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: colorScheme.primaryContainer,
                          child: Icon(Icons.delivery_dining_rounded, color: colorScheme.onPrimaryContainer),
                        ),
                        const SizedBox(width: AppSpacing.space12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('David M.', style: textTheme.titleSmall),
                              Text('À 1,2 km — Arrivée dans ~15 min', style: textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              )),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.phone_rounded, color: colorScheme.primary),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // Timeline
          Padding(
            padding: const EdgeInsets.all(AppSpacing.space16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Progression', style: textTheme.titleMedium),
                const SizedBox(height: AppSpacing.space16),
                ..._steps.map((s) => _buildStep(s, colorScheme, textTheme)),
                const SizedBox(height: AppSpacing.space24),
                // Actions
                SizedBox(
                  width: double.infinity,
                  height: AppSpacing.touchMin,
                  child: OutlinedButton.icon(
                    onPressed: () => context.push(
                      RoutePaths.rateOrder.replaceAll(':id', orderId),
                    ),
                    icon: const Icon(Icons.star_rounded),
                    label: const Text('Suivi en direct'),
                  ),
                ),
                const SizedBox(height: AppSpacing.space16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStep(_TrackStep step, ColorScheme colorScheme, TextTheme textTheme) {
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
                  color: step.completed || step.isActive
                      ? colorScheme.primary
                      : colorScheme.surfaceContainerHighest,
                  shape: BoxShape.circle,
                ),
                child: step.completed
                    ? Icon(Icons.check_rounded, size: 14, color: colorScheme.onPrimary)
                    : step.isActive
                        ? SizedBox(
                            width: 8, height: 8,
                            child: CircularProgressIndicator(
                              strokeWidth: 2, color: colorScheme.onPrimary,
                            ),
                          )
                        : null,
              ),
              Container(
                width: 2,
                height: 32,
                color: step.completed
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
                Text(step.label, style: textTheme.titleSmall?.copyWith(
                  color: step.completed || step.isActive
                      ? colorScheme.onSurface
                      : colorScheme.onSurfaceVariant,
                )),
                if (step.time != null)
                  Text(step.time!, style: textTheme.bodySmall?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackStep {
  final String label;
  final String? time;
  final bool completed;
  final bool isActive;
  const _TrackStep(this.label, this.time, this.completed, {this.isActive = false});
}

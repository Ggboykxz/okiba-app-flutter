import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.delivery_profile_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Center(
            child: Column(
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      radius: 48,
                      backgroundColor: colorScheme.primaryContainer,
                      child: Icon(Icons.person_rounded, size: 48, color: colorScheme.onPrimaryContainer),
                    ),
                    Positioned(
                      bottom: 0, right: 0,
                      child: Container(
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
                        child: IconButton(
                          icon: Icon(Icons.camera_alt_rounded, color: colorScheme.primary, size: 20),
                          onPressed: () {},
                          constraints: const BoxConstraints(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.space12),
                Text('Jean Mba', style: textTheme.titleLarge),
                const SizedBox(height: 4),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space12, vertical: 4),
                  decoration: BoxDecoration(
                    color: colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.star_rounded, size: 16, color: colorScheme.onPrimaryContainer),
                      const SizedBox(width: 4),
                      Text('4.9 • Livreur Or', style: textTheme.labelSmall?.copyWith(color: colorScheme.onPrimaryContainer)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Row(
            children: [
              Expanded(child: _statBox('150', l10n.delivery_profile_deliveries, Icons.check_circle_rounded, colorScheme.primary, colorScheme, textTheme)),
              const SizedBox(width: AppSpacing.space12),
              Expanded(child: _statBox('4.9', l10n.delivery_profile_rating, Icons.star_rounded, Colors.amber, colorScheme, textTheme)),
              const SizedBox(width: AppSpacing.space12),
              Expanded(child: _statBox('98%', l10n.delivery_profile_success_rate, Icons.thumb_up_rounded, Colors.green, colorScheme, textTheme)),
            ],
          ),
          const SizedBox(height: AppSpacing.space24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.delivery_profile_vehicle, style: textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.space12),
                  Row(
                    children: [
                      Icon(Icons.directions_bike_rounded, color: colorScheme.primary, size: 32),
                      const SizedBox(width: AppSpacing.space12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Moto Yamaha', style: textTheme.titleSmall),
                          Text('AB 1234 CD • 2022', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                        ],
                      ),
                      const Spacer(),
                      TextButton(onPressed: () {}, child: Text(l10n.delivery_profile_edit)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.delivery_profile_documents, style: textTheme.titleMedium),
                  const SizedBox(height: AppSpacing.space12),
                  _docRow(l10n.delivery_profile_id_card, l10n.delivery_profile_validated, Icons.check_circle_rounded, Colors.green, colorScheme, textTheme),
                  const Divider(),
                  _docRow(l10n.delivery_profile_license, l10n.delivery_profile_validated, Icons.check_circle_rounded, Colors.green, colorScheme, textTheme),
                  const Divider(),
                  _docRow(l10n.delivery_profile_registration, l10n.delivery_profile_pending, Icons.access_time_rounded, Colors.orange, colorScheme, textTheme),
                  const Divider(),
                  _docRow(l10n.delivery_profile_insurance, l10n.delivery_profile_validated, Icons.check_circle_rounded, Colors.green, colorScheme, textTheme),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statBox(String value, String label, IconData icon, Color color, ColorScheme colorScheme, TextTheme textTheme) {
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
          Text(value, style: textTheme.titleMedium?.copyWith(color: color, fontWeight: FontWeight.w700)),
          Text(label, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }

  Widget _docRow(String title, String status, IconData icon, Color statusColor, ColorScheme colorScheme, TextTheme textTheme) {
    return Row(
      children: [
        Expanded(child: Text(title, style: textTheme.bodyMedium)),
        Row(
          children: [
            Icon(icon, size: 16, color: statusColor),
            const SizedBox(width: 4),
            Text(status, style: textTheme.bodySmall?.copyWith(color: statusColor, fontWeight: FontWeight.w600)),
          ],
        ),
      ],
    );
  }
}

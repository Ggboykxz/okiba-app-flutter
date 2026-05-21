import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class DriverZoneScreen extends StatefulWidget {
  const DriverZoneScreen({super.key});

  @override
  State<DriverZoneScreen> createState() => _DriverZoneScreenState();
}

class _DriverZoneScreenState extends State<DriverZoneScreen> {
  final _zones = [
    _Zone('Libreville Centre', 'Rayon 5 km', true),
    _Zone('Libreville Nord', 'Rayon 8 km', false),
    _Zone('Libreville Sud', 'Rayon 6 km', false),
    _Zone('Akanda', 'Rayon 10 km', false),
  ];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.delivery_zone_title),
        actions: [
          TextButton(onPressed: () {}, child: Text(l10n.delivery_zone_save)),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Container(
            height: 220,
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppSpacing.radius16),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map_rounded, size: 48, color: colorScheme.onSurfaceVariant),
                  const SizedBox(height: AppSpacing.space8),
                  Text('Carte interactive', style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                  Text('Google Maps à intégrer', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.delivery_zone_available, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          ..._zones.map((z) => Card(
            margin: const EdgeInsets.only(bottom: AppSpacing.space8),
            child: CheckboxListTile(
              title: Text(z.name, style: textTheme.titleSmall),
              subtitle: Text(z.radius, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
              value: z.selected,
              onChanged: (_) => setState(() {}),
            ),
          )),
        ],
      ),
    );
  }
}

class _Zone {
  final String name;
  final String radius;
  final bool selected;
  const _Zone(this.name, this.radius, this.selected);
}

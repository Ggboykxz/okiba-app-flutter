import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class DriverEarningsScreen extends StatefulWidget {
  const DriverEarningsScreen({super.key});

  @override
  State<DriverEarningsScreen> createState() => _DriverEarningsScreenState();
}

class _DriverEarningsScreenState extends State<DriverEarningsScreen> {
  String _period = 'Aujourd\'hui';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.delivery_earnings_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          Container(
            padding: const EdgeInsets.all(AppSpacing.space4),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            ),
            child: Row(
              children: ['Aujourd\'hui', '7 jours', '30 jours'].map((p) {
                final selected = p == _period;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _period = p),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      decoration: BoxDecoration(
                        color: selected ? colorScheme.surface : Colors.transparent,
                        borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                      ),
                      child: Text(p, textAlign: TextAlign.center,
                        style: textTheme.labelMedium?.copyWith(
                          color: selected ? colorScheme.onSurface : colorScheme.onSurfaceVariant,
                          fontWeight: selected ? FontWeight.w600 : FontWeight.normal),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Card(
            color: colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space24),
              child: Column(
                children: [
                  Text(l10n.delivery_earnings_total, style: textTheme.titleSmall?.copyWith(color: colorScheme.onPrimary.withValues(alpha: 0.8))),
                  const SizedBox(height: AppSpacing.space8),
                  Text('8 500 FCFA', style: textTheme.headlineLarge?.copyWith(color: colorScheme.onPrimary, fontWeight: FontWeight.w700)),
                  const SizedBox(height: AppSpacing.space8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.trending_up_rounded, size: 18, color: colorScheme.onPrimary),
                      const SizedBox(width: 6),
                      Text('+12% vs hier', style: textTheme.bodySmall?.copyWith(color: colorScheme.onPrimary.withValues(alpha: 0.8))),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.delivery_earnings_evolution, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _bar('Lun', 0.4, colorScheme),
                _bar('Mar', 0.6, colorScheme),
                _bar('Mer', 0.5, colorScheme),
                _bar('Jeu', 0.8, colorScheme),
                _bar('Ven', 0.7, colorScheme),
                _bar('Sam', 0.3, colorScheme),
                _bar('Dim', 0.2, colorScheme),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.space24),
          Row(
            children: [
              Expanded(child: _statBox('5', l10n.delivery_earnings_deliveries_count, Icons.check_circle_rounded, colorScheme.primary, colorScheme, textTheme)),
              const SizedBox(width: AppSpacing.space12),
              Expanded(child: _statBox('12 km', l10n.delivery_earnings_distance, Icons.route_rounded, colorScheme.secondary, colorScheme, textTheme)),
              const SizedBox(width: AppSpacing.space12),
              Expanded(child: _statBox('4.9', l10n.delivery_earnings_rating, Icons.star_rounded, Colors.amber, colorScheme, textTheme)),
            ],
          ),
          const SizedBox(height: AppSpacing.space24),
          Text(l10n.delivery_earnings_transactions, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          _transaction('#OKB-024', l10n.delivery_deliveries, '2 000 FCFA', '12:30', true, colorScheme, textTheme),
          _transaction('#OKB-023', l10n.delivery_deliveries, '1 500 FCFA', '11:15', true, colorScheme, textTheme),
          _transaction('#OKB-022', l10n.delivery_deliveries, '2 500 FCFA', '10:00', true, colorScheme, textTheme),
          _transaction('#OKB-021', l10n.delivery_earnings_withdrawal, '-5 000 FCFA', '08:30', false, colorScheme, textTheme),
        ],
      ),
    );
  }

  Widget _bar(String day, double value, ColorScheme colorScheme) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 100 * value,
              decoration: BoxDecoration(
                color: colorScheme.primary.withValues(alpha: 0.3 + value * 0.5),
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            const SizedBox(height: 4),
            Text(day, style: const TextStyle(fontSize: 10)),
          ],
        ),
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

  Widget _transaction(String id, String label, String amount, String time, bool credit, ColorScheme colorScheme, TextTheme textTheme) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: credit ? Colors.green.withValues(alpha: 0.1) : colorScheme.error.withValues(alpha: 0.1),
          child: Icon(credit ? Icons.arrow_downward_rounded : Icons.arrow_upward_rounded,
            color: credit ? Colors.green : colorScheme.error, size: 20),
        ),
        title: Text('$id • $label', style: textTheme.titleSmall),
        subtitle: Text(time, style: textTheme.bodySmall),
        trailing: Text(amount, style: textTheme.titleSmall?.copyWith(
          color: credit ? Colors.green : colorScheme.error, fontWeight: FontWeight.w600)),
      ),
    );
  }
}

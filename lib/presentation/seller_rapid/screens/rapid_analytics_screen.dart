import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class RapidAnalyticsScreen extends StatefulWidget {
  const RapidAnalyticsScreen({super.key});

  @override
  State<RapidAnalyticsScreen> createState() => _RapidAnalyticsScreenState();
}

class _RapidAnalyticsScreenState extends State<RapidAnalyticsScreen> {
  String _selectedPeriod = '7 jours';

  final _periods = ['7 jours', '30 jours', '90 jours'];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.seller_rapid_analytics_title),
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.space16),
        children: [
          // Period selector
          Container(
            padding: const EdgeInsets.all(AppSpacing.space4),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
            ),
            child: Row(
              children: _periods.map((p) {
                final selected = p == _selectedPeriod;
                return Expanded(
                  child: GestureDetector(
                    onTap: () => setState(() => _selectedPeriod = p),
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
          // Stats
          Row(
            children: [
              Expanded(child: _statCard(l10n.seller_rapid_analytics_ads, '12', Icons.dashboard_rounded, colorScheme.primary, colorScheme, textTheme)),
              const SizedBox(width: AppSpacing.space12),
              Expanded(child: _statCard(l10n.seller_rapid_total_views, '1 245', Icons.visibility_rounded, colorScheme.secondary, colorScheme, textTheme)),
            ],
          ),
          const SizedBox(height: AppSpacing.space12),
          Row(
            children: [
              Expanded(child: _statCard(l10n.seller_rapid_analytics_contacts, '28', Icons.chat_rounded, colorScheme.tertiary, colorScheme, textTheme)),
              const SizedBox(width: AppSpacing.space12),
              Expanded(child: _statCard(l10n.seller_rapid_analytics_views_per_ad, '104', Icons.analytics_rounded, colorScheme.primary, colorScheme, textTheme)),
            ],
          ),
          const SizedBox(height: AppSpacing.space24),
          // Performance
          Text(l10n.seller_rapid_analytics_perf_title, style: textTheme.titleLarge),
          const SizedBox(height: AppSpacing.space16),
          _perfRow('iPhone 13 reconditionné', '1 245 vues', '18 contacts', colorScheme, textTheme),
          _perfRow('Lit simple', '890 vues', '6 contacts', colorScheme, textTheme),
          _perfRow('Cours particuliers', '456 vues', '4 contacts', colorScheme, textTheme),
          const SizedBox(height: AppSpacing.space24),
          // Insights
          Card(
            child: Padding(
              padding: const EdgeInsets.all(AppSpacing.space16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lightbulb_rounded, color: colorScheme.secondary, size: 20),
                      const SizedBox(width: AppSpacing.space8),
                      Text(l10n.seller_rapid_analytics_tips_title, style: textTheme.titleMedium),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.space12),
                  _tip(l10n.seller_rapid_analytics_tip_photos, colorScheme, textTheme),
                  _tip(l10n.seller_rapid_analytics_tip_reply, colorScheme, textTheme),
                  _tip(l10n.seller_rapid_analytics_tip_boost, colorScheme, textTheme),
                ],
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.space32),
        ],
      ),
    );
  }

  Widget _statCard(String label, String value, IconData icon, Color color, ColorScheme colorScheme, TextTheme textTheme) {
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

  Widget _perfRow(String name, String views, String contacts, ColorScheme colorScheme, TextTheme textTheme) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: textTheme.titleSmall),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.visibility_rounded, size: 14, color: colorScheme.onSurfaceVariant),
                      const SizedBox(width: 4),
                      Text(views, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                      const SizedBox(width: AppSpacing.space12),
                      Icon(Icons.chat_rounded, size: 14, color: colorScheme.onSurfaceVariant),
                      const SizedBox(width: 4),
                      Text(contacts, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                    ],
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: colorScheme.onSurfaceVariant),
          ],
        ),
      ),
    );
  }

  Widget _tip(String text, ColorScheme colorScheme, TextTheme textTheme) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.space4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.check_rounded, size: 16, color: colorScheme.secondary),
          const SizedBox(width: AppSpacing.space8),
          Expanded(child: Text(text, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant))),
        ],
      ),
    );
  }
}

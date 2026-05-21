import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/navigation/route_names.dart';
import 'package:go_router/go_router.dart';

class BoutiqueOrdersScreen extends StatefulWidget {
  const BoutiqueOrdersScreen({super.key});

  @override
  State<BoutiqueOrdersScreen> createState() => _BoutiqueOrdersScreenState();
}

class _BoutiqueOrdersScreenState extends State<BoutiqueOrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = ['En cours', 'Expédié', 'Livré', 'Annulé'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.boutique_orders_title),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          tabs: _tabs.map((t) => Tab(text: t)).toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabs.map((tab) {
          return ListView(
            padding: const EdgeInsets.all(AppSpacing.space16),
            children: [
              _orderCard('CMD-001', 'Awa Diallo', 'Chemise wax', '15 000 FCFA', 'En cours', colorScheme, textTheme, context),
              _orderCard('CMD-002', 'Paul Mba', 'Robe pagne', '25 000 FCFA', 'En cours', colorScheme, textTheme, context),
              _orderCard('CMD-003', 'Marie Obiang', 'Sac artisanal', '12 000 FCFA', 'En cours', colorScheme, textTheme, context),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _orderCard(
    String id, String client, String product, String total, String status,
    ColorScheme colorScheme, TextTheme textTheme, BuildContext context,
  ) {
    final statusColor = status == 'En cours' ? colorScheme.primary
        : status == 'Expédié' ? colorScheme.secondary
        : status == 'Livré' ? Colors.green
        : colorScheme.error;

    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space12),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppSpacing.radius12),
        onTap: () => context.push(RoutePaths.boutiqueOrderDetail.replaceFirst(':id', id)),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(id, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w700)),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space8, vertical: 4),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                    ),
                    child: Text(status, style: textTheme.labelSmall?.copyWith(color: statusColor, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.space8),
              Row(
                children: [
                  Icon(Icons.person_rounded, size: 16, color: colorScheme.onSurfaceVariant),
                  const SizedBox(width: 6),
                  Text(client, style: textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.shopping_bag_rounded, size: 16, color: colorScheme.onSurfaceVariant),
                  const SizedBox(width: 6),
                  Expanded(child: Text(product, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant))),
                  Text(total, style: textTheme.titleSmall?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w700)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

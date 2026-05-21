import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../widgets/order_card.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  static const _tabs = ['En cours', 'Livré', 'Annulé'];

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
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).profile_orders),
        bottom: TabBar(
          controller: _tabController,
          tabs: _tabs
              .map((t) => Tab(
                    child: Text(
                      t,
                      style: textTheme.labelLarge,
                    ),
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildList(colorScheme, textTheme, 'En cours'),
          _buildList(colorScheme, textTheme, 'Livré'),
          _buildList(colorScheme, textTheme, 'Annulé'),
        ],
      ),
    );
  }

  Widget _buildList(
    ColorScheme colorScheme,
    TextTheme textTheme,
    String status,
  ) {
    if (status == 'En cours') {
      return ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.space8),
        children: const [
          OrderCard(
            orderId: '#OKB-2024-001',
            date: '15 mai 2026',
            status: 'En cours',
            total: '77 500 FCFA',
            itemCount: 3,
            deliveryTime: 'Aujourd\'hui, 14h-16h',
          ),
          OrderCard(
            orderId: '#OKB-2024-002',
            date: '14 mai 2026',
            status: 'En cours',
            total: '15 000 FCFA',
            itemCount: 1,
            deliveryTime: 'Aujourd\'hui, 18h-20h',
          ),
        ],
      );
    }

    if (status == 'Livré') {
      return ListView(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.space8),
        children: const [
          OrderCard(
            orderId: '#OKB-2024-003',
            date: '12 mai 2026',
            status: 'Livré',
            total: '5 500 FCFA',
            itemCount: 1,
          ),
          OrderCard(
            orderId: '#OKB-2024-004',
            date: '10 mai 2026',
            status: 'Livré',
            total: '250 000 FCFA',
            itemCount: 1,
          ),
          OrderCard(
            orderId: '#OKB-2024-005',
            date: '8 mai 2026',
            status: 'Livré',
            total: '45 000 FCFA',
            itemCount: 2,
          ),
        ],
      );
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.cancel_outlined,
            size: 64,
            color: colorScheme.onSurfaceVariant.withValues(alpha: 0.4),
          ),
          const SizedBox(height: AppSpacing.space16),
          Text(
            'Aucune commande annulée',
            style: textTheme.bodyLarge?.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}

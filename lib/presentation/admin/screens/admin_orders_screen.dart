import 'package:flutter/material.dart';
import 'package:okiba/l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class AdminOrdersScreen extends StatefulWidget {
  const AdminOrdersScreen({super.key});

  @override
  State<AdminOrdersScreen> createState() => _AdminOrdersScreenState();
}

class _AdminOrdersScreenState extends State<AdminOrdersScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
    final l10n = AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.admin_orders_title),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: l10n.admin_orders_all),
            Tab(text: l10n.admin_orders_disputes),
            Tab(text: l10n.admin_orders_refunds),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _ordersList(colorScheme, textTheme),
          _disputesList(colorScheme, textTheme, l10n),
          _refundsList(colorScheme, textTheme, l10n),
        ],
      ),
    );
  }

  Widget _ordersList(ColorScheme colorScheme, TextTheme textTheme) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.space16),
      children: [
        _orderCard('#OKB-050', 'Alice M.', '15 000 FCFA', 'En cours', colorScheme, textTheme),
        _orderCard('#OKB-049', 'Paul D.', '25 000 FCFA', 'Livré', colorScheme, textTheme),
        _orderCard('#OKB-048', 'Marie K.', '8 500 FCFA', 'Litige', colorScheme, textTheme),
        _orderCard('#OKB-047', 'Jean E.', '12 000 FCFA', 'Annulé', colorScheme, textTheme),
        _orderCard('#OKB-046', 'Awa D.', '32 000 FCFA', 'En cours', colorScheme, textTheme),
      ],
    );
  }

  Widget _disputesList(ColorScheme colorScheme, TextTheme textTheme, AppLocalizations l10n) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.space16),
      children: [
        _disputeCard('#OKB-048', 'Marie K.', '8 500 FCFA', 'Produit non conforme', l10n.admin_orders_pending, colorScheme, textTheme, l10n),
        _disputeCard('#OKB-045', 'Pierre M.', '22 000 FCFA', 'Livraison non reçue', l10n.admin_orders_processing, colorScheme, textTheme, l10n),
        _disputeCard('#OKB-042', 'Sandra L.', '15 000 FCFA', 'Article endommagé', l10n.admin_orders_resolved, colorScheme, textTheme, l10n),
      ],
    );
  }

  Widget _refundsList(ColorScheme colorScheme, TextTheme textTheme, AppLocalizations l10n) {
    return ListView(
      padding: const EdgeInsets.all(AppSpacing.space16),
      children: [
        _refundCard('#OKB-045', 'Pierre M.', '22 000 FCFA', l10n.admin_orders_refunded, colorScheme, textTheme),
        _refundCard('#OKB-041', 'Linda T.', '9 000 FCFA', l10n.admin_orders_processing, colorScheme, textTheme),
      ],
    );
  }

  Widget _orderCard(String id, String client, String total, String status, ColorScheme colorScheme, TextTheme textTheme) {
    final statusColor = status == 'Livré' ? Colors.green
        : status == 'Litige' ? colorScheme.error
        : status == 'Annulé' ? Colors.grey
        : colorScheme.primary;
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(id, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                      Text(total, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(client, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
                  const SizedBox(height: 4),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                    ),
                    child: Text(status, style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _disputeCard(String id, String client, String total, String reason, String status, ColorScheme colorScheme, TextTheme textTheme, AppLocalizations l10n) {
    final statusColor = status == l10n.admin_orders_resolved ? Colors.green : status == l10n.admin_orders_processing ? colorScheme.primary : Colors.orange;
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.space12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(id, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                Text(total, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
              ],
            ),
            const SizedBox(height: 4),
            Text(client, style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
            const SizedBox(height: 4),
            Text('${l10n.admin_orders_reason} $reason', style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant)),
            const SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: statusColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                  child: Text(status, style: TextStyle(color: statusColor, fontSize: 11, fontWeight: FontWeight.w600)),
                ),
                Row(
                  children: [
                    TextButton(onPressed: () {}, child: Text(l10n.admin_orders_resolve, style: const TextStyle(fontSize: 12))),
                    TextButton(onPressed: () {}, child: Text(l10n.admin_orders_refund, style: TextStyle(fontSize: 12, color: Colors.red))),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _refundCard(String id, String client, String total, String status, ColorScheme colorScheme, TextTheme textTheme) {
    return Card(
      margin: const EdgeInsets.only(bottom: AppSpacing.space8),
      child: ListTile(
        leading: Icon(status == 'Remboursé' ? Icons.check_circle_rounded : Icons.access_time_rounded,
          color: status == 'Remboursé' ? Colors.green : Colors.orange),
        title: Text(id, style: textTheme.titleSmall),
        subtitle: Text('$client • $total', style: textTheme.bodySmall),
        trailing: Text(status, style: TextStyle(color: status == 'Remboursé' ? Colors.green : Colors.orange, fontSize: 12)),
      ),
    );
  }
}

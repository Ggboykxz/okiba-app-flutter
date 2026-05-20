import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';

class ChatOfferBubble extends StatelessWidget {
  final String productName;
  final String productImage;
  final int originalPrice;
  final int offeredPrice;
  final String status; // 'pending', 'accepted', 'refused', 'countered'
  final VoidCallback? onAccept;
  final VoidCallback? onRefuse;
  final VoidCallback? onCounter;
  final bool isSent;

  const ChatOfferBubble({
    super.key,
    required this.productName,
    this.productImage = '',
    required this.originalPrice,
    required this.offeredPrice,
    this.status = 'pending',
    this.onAccept,
    this.onRefuse,
    this.onCounter,
    this.isSent = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: isSent ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.8,
        ),
        margin: const EdgeInsets.symmetric(vertical: AppSpacing.space4),
        padding: const EdgeInsets.all(AppSpacing.space16),
        decoration: BoxDecoration(
          color: isSent ? colorScheme.primaryContainer : colorScheme.surface,
          borderRadius: BorderRadius.circular(AppSpacing.radius16),
          border: Border.all(color: colorScheme.outlineVariant),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                Container(
                  width: 48, height: 48,
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(AppSpacing.radius8),
                  ),
                  child: Icon(Icons.shopping_bag_rounded, color: colorScheme.onSurfaceVariant),
                ),
                const SizedBox(width: AppSpacing.space12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(productName, style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 2),
                      Text('Prix original: ${_formatPrice(originalPrice)}',
                        style: textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.space12),
            const Divider(),
            // Offer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Proposition', style: textTheme.labelMedium?.copyWith(color: colorScheme.onSurfaceVariant)),
                Text(_formatPrice(offeredPrice),
                  style: textTheme.titleLarge?.copyWith(color: colorScheme.primary, fontWeight: FontWeight.w700)),
              ],
            ),
            const SizedBox(height: AppSpacing.space12),
            // Actions
            if (status == 'pending' && !isSent)
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: OutlinedButton(
                        onPressed: onRefuse,
                        style: OutlinedButton.styleFrom(foregroundColor: colorScheme.error),
                        child: const Text('Refuser', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.space8),
                  Expanded(
                    child: SizedBox(
                      height: 40,
                      child: OutlinedButton(
                        onPressed: onCounter,
                        child: const Text('Contre-proposer', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.space8),
                  Expanded(
                    flex: 2,
                    child: SizedBox(
                      height: 40,
                      child: FilledButton(
                        onPressed: onAccept,
                        child: const Text('Accepter', style: TextStyle(fontSize: 12)),
                      ),
                    ),
                  ),
                ],
              ),
            if (status == 'pending' && isSent)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.space8),
                decoration: BoxDecoration(
                  color: Colors.orange.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radius8),
                ),
                child: Text('En attente de réponse', textAlign: TextAlign.center,
                  style: textTheme.labelSmall?.copyWith(color: Colors.orange, fontWeight: FontWeight.w600)),
              ),
            if (status == 'accepted')
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.space8),
                decoration: BoxDecoration(
                  color: Colors.green.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radius8),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.check_circle_rounded, size: 16, color: Colors.green),
                    const SizedBox(width: 4),
                    Text('Offre acceptée', style: textTheme.labelSmall?.copyWith(color: Colors.green, fontWeight: FontWeight.w600)),
                  ],
                ),
              ),
            if (status == 'refused')
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.space8),
                decoration: BoxDecoration(
                  color: colorScheme.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppSpacing.radius8),
                ),
                child: Text('Offre refusée', textAlign: TextAlign.center,
                  style: textTheme.labelSmall?.copyWith(color: colorScheme.error, fontWeight: FontWeight.w600)),
              ),
            if (status == 'countered')
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: AppSpacing.space8),
                decoration: BoxDecoration(
                  color: colorScheme.secondaryContainer,
                  borderRadius: BorderRadius.circular(AppSpacing.radius8),
                ),
                child: Text('Nouvelle proposition reçue', textAlign: TextAlign.center,
                  style: textTheme.labelSmall?.copyWith(color: colorScheme.onSecondaryContainer, fontWeight: FontWeight.w600)),
              ),
          ],
        ),
      ),
    );
  }

  String _formatPrice(int price) {
    final formatter = '${price.toString().replaceAllMapped(RegExp(r'(\d)(?=(\d{3})+(?!\d))'), (m) => '${m[1]} ')} FCFA';
    return formatter;
  }
}

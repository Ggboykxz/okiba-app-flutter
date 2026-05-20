import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../../core/constants/app_spacing.dart';

class RateOrderScreen extends StatefulWidget {
  final String orderId;

  const RateOrderScreen({super.key, required this.orderId});

  @override
  State<RateOrderScreen> createState() => _RateOrderScreenState();
}

class _RateOrderScreenState extends State<RateOrderScreen> {
  int _sellerRating = 0;
  int _deliveryRating = 0;
  final _commentController = TextEditingController();
  bool _submitted = false;

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

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
        title: Text(AppLocalizations.of(context)!.review_title),
      ),
      body: _submitted
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(AppSpacing.space32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle_rounded, size: 80, color: colorScheme.primary),
                    const SizedBox(height: AppSpacing.space24),
                    Text('Merci pour votre avis !', style: textTheme.headlineMedium, textAlign: TextAlign.center),
                    const SizedBox(height: AppSpacing.space12),
                    Text('Votre évaluation aide la communauté.', style: textTheme.bodyLarge?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ), textAlign: TextAlign.center),
                    const SizedBox(height: AppSpacing.space32),
                    SizedBox(
                      width: double.infinity,
                      height: AppSpacing.touchMin,
                      child: ElevatedButton(
                        onPressed: () => context.pop(),
                        child: Text(AppLocalizations.of(context)!.general_close),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(AppSpacing.space16),
              children: [
                // Seller rating
                Text(AppLocalizations.of(context)!.order_rate_seller, style: textTheme.titleMedium),
                const SizedBox(height: AppSpacing.space8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.space16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: colorScheme.primaryContainer,
                              child: const Icon(Icons.store_rounded),
                            ),
                            const SizedBox(width: AppSpacing.space12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Adélaïde Styles', style: textTheme.titleSmall),
                                Text('Vendeur vérifié', style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                )),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.space16),
                        _StarRating(
                          rating: _sellerRating,
                          onChanged: (v) => setState(() => _sellerRating = v),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.space24),
                // Delivery rating
                Text(AppLocalizations.of(context)!.order_rate_delivery, style: textTheme.titleMedium),
                const SizedBox(height: AppSpacing.space8),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(AppSpacing.space16),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: colorScheme.primaryContainer,
                              child: const Icon(Icons.delivery_dining_rounded),
                            ),
                            const SizedBox(width: AppSpacing.space12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('David M.', style: textTheme.titleSmall),
                                Text('Livreur', style: textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                )),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: AppSpacing.space16),
                        _StarRating(
                          rating: _deliveryRating,
                          onChanged: (v) => setState(() => _deliveryRating = v),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.space24),
                // Comment
                Text('${AppLocalizations.of(context)!.order_rate_comment} (optionnel)', style: textTheme.titleSmall),
                const SizedBox(height: AppSpacing.space8),
                TextField(
                  controller: _commentController,
                  maxLines: 4,
                  maxLength: 300,
                  decoration: const InputDecoration(
                    hintText: 'Partagez votre expérience...',
                    alignLabelWithHint: true,
                  ),
                ),
                const SizedBox(height: AppSpacing.space24),
                SizedBox(
                  width: double.infinity,
                  height: AppSpacing.touchMin,
                  child: ElevatedButton(
                    onPressed: (_sellerRating > 0 || _deliveryRating > 0)
                        ? () => setState(() => _submitted = true)
                        : null,
                    child: Text(AppLocalizations.of(context)!.review_submit),
                  ),
                ),
                const SizedBox(height: AppSpacing.space16),
              ],
            ),
    );
  }
}

class _StarRating extends StatelessWidget {
  final int rating;
  final ValueChanged<int> onChanged;

  const _StarRating({required this.rating, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (i) {
        final filled = i < rating;
        return IconButton(
          icon: Icon(
            filled ? Icons.star_rounded : Icons.star_border_rounded,
            size: 36,
            color: filled ? colorScheme.secondary : colorScheme.onSurfaceVariant,
          ),
          onPressed: () => onChanged(i + 1),
        );
      }),
    );
  }
}

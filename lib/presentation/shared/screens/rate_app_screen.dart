import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../core/constants/app_spacing.dart';

class RateAppScreen extends StatefulWidget {
  const RateAppScreen({super.key});

  @override
  State<RateAppScreen> createState() => _RateAppScreenState();
}

class _RateAppScreenState extends State<RateAppScreen> {
  int _rating = 0;
  bool _submitted = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(l10n.rate_title),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space32),
          child: _submitted ? _submittedView(colorScheme, textTheme, l10n) : _ratingView(colorScheme, textTheme, l10n),
        ),
      ),
    );
  }

  Widget _ratingView(ColorScheme colorScheme, TextTheme textTheme, AppLocalizations l10n) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 96, height: 96,
          decoration: BoxDecoration(
            color: colorScheme.primaryContainer,
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.favorite_rounded, size: 48, color: colorScheme.onPrimaryContainer),
        ),
        const SizedBox(height: AppSpacing.space24),
        Text(l10n.rate_question, style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: AppSpacing.space8),
        Text(l10n.rate_desc,
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant)),
        const SizedBox(height: AppSpacing.space32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (i) => GestureDetector(
            onTap: () => setState(() => _rating = i + 1),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.space4),
              child: Icon(
                i < _rating ? Icons.star_rounded : Icons.star_border_rounded,
                size: 48,
                color: i < _rating ? Colors.amber : colorScheme.onSurfaceVariant,
              ),
            ),
          )),
        ),
        if (_rating > 0) ...[
          const SizedBox(height: AppSpacing.space8),
          Text(
            _rating <= 2 ? 'Nous sommes désolés. Dites-nous comment améliorer :'
                : _rating == 3 ? 'Merci ! Comment pouvons-nous faire mieux ?'
                : 'Super ! Merci pour votre soutien !',
            style: textTheme.bodySmall?.copyWith(color: colorScheme.onSurfaceVariant),
          ),
        ],
        const SizedBox(height: AppSpacing.space32),
        if (_rating > 0)
          SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: () => setState(() => _submitted = true),
              child: Text(_rating >= 4 ? l10n.rate_store : l10n.rate_send),
            ),
          ),
      ],
    );
  }

  Widget _submittedView(ColorScheme colorScheme, TextTheme textTheme, AppLocalizations l10n) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 96, height: 96,
          decoration: BoxDecoration(
            color: Colors.green.withValues(alpha: 0.1),
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.check_rounded, size: 48, color: Colors.green),
        ),
        const SizedBox(height: AppSpacing.space24),
        Text(l10n.rate_thank_you, style: textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(height: AppSpacing.space8),
        Text('Votre avis a bien été enregistré.',
          style: textTheme.bodyLarge?.copyWith(color: colorScheme.onSurfaceVariant)),
        const SizedBox(height: AppSpacing.space32),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.rate_close),
          ),
        ),
      ],
    );
  }
}

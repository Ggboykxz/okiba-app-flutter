import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:okiba/l10n/generated/app_localizations.dart';
import '../../../../core/constants/app_spacing.dart';
import '../../../../core/navigation/route_names.dart';

class PaymentProcessingScreen extends StatefulWidget {
  const PaymentProcessingScreen({super.key});

  @override
  State<PaymentProcessingScreen> createState() => _PaymentProcessingScreenState();
}

class _PaymentProcessingScreenState extends State<PaymentProcessingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        context.go(RoutePaths.orders);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(AppSpacing.space32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (_, child) {
                    return Transform.rotate(
                      angle: _animation.value * 6.2832,
                      child: child,
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: colorScheme.primaryContainer,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.monetization_on_rounded,
                      size: 56,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.space40),
                Text(
                  AppLocalizations.of(context)!.checkout_processing_title,
                  style: textTheme.headlineMedium,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.space16),
                Text(
                  AppLocalizations.of(context)!.checkout_processing_desc,
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: AppSpacing.space40),
                Container(
                  padding: const EdgeInsets.all(AppSpacing.space16),
                  decoration: BoxDecoration(
                    color: colorScheme.surfaceContainerHighest,
                    borderRadius: BorderRadius.circular(AppSpacing.radius16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.phone_android_rounded, color: const Color(0xFFFF6B00)),
                      const SizedBox(width: AppSpacing.space12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(AppLocalizations.of(context)!.checkout_orange_money, style: textTheme.titleSmall),
                          Text('107 500 FCFA', style: textTheme.titleMedium?.copyWith(
                            color: colorScheme.primary,
                            fontWeight: FontWeight.w700,
                          )),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.space40),
                SizedBox(
                  width: double.infinity,
                  height: AppSpacing.touchMin,
                  child: OutlinedButton(
                    onPressed: () => context.go(RoutePaths.checkout),
                    child: Text(AppLocalizations.of(context)!.general_cancel),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

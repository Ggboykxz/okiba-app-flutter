import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';
import '../../../core/widgets/skeleton_widget.dart';

class LoadingScreen extends StatelessWidget {
  final String? message;

  const LoadingScreen({super.key, this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // AppBar skeleton
              const Skeleton(width: double.infinity, height: 40, radius: 8),
              const SizedBox(height: AppSpacing.space24),
              // Category chips skeleton
              SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (_, _) => const SizedBox(width: 8),
                  itemBuilder: (_, i) => Skeleton(
                    width: i == 0 ? 100 : 80,
                    height: 40,
                    radius: AppSpacing.radiusFull,
                  ),
                ),
              ),
              const SizedBox(height: AppSpacing.space20),
              // Product cards skeleton
              Expanded(
                child: ListView.separated(
                  itemCount: 4,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (_, _) => Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Row(
                        children: [
                          const Skeleton(width: 100, height: 100, radius: 12),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Skeleton(width: double.infinity, height: 16),
                                const SizedBox(height: 8),
                                const Skeleton(width: 120, height: 14),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Skeleton(width: 80, height: 20),
                                    Skeleton(width: 60, height: 16),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (message != null) ...[
                const SizedBox(height: AppSpacing.space16),
                Center(
                  child: Text(
                    message!,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class LoadingPage extends StatelessWidget {
  final int skeletonCount;

  const LoadingPage({super.key, this.skeletonCount = 4});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.space16),
          child: Column(
            children: [
              const Skeleton(width: double.infinity, height: 40, radius: 8),
              const SizedBox(height: AppSpacing.space24),
              Expanded(
                child: ListView.separated(
                  itemCount: skeletonCount,
                  separatorBuilder: (_, _) => const SizedBox(height: 12),
                  itemBuilder: (_, i) => Card(
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Skeleton(width: double.infinity, height: 160, radius: 0),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Skeleton(width: 200, height: 16),
                              const SizedBox(height: 8),
                              const Skeleton(width: 140, height: 14),
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: const [
                                  Skeleton(width: 100, height: 22),
                                  Skeleton(width: 80, height: 18),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

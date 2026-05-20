import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  final double width;
  final double height;
  final double radius;

  const Skeleton({
    super.key,
    required this.width,
    required this.height,
    this.radius = 12,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: _ShimmerEffect(
          baseColor: colorScheme.surfaceContainerHighest,
          highlightColor: colorScheme.surface,
        ),
      ),
    );
  }
}

class _ShimmerEffect extends StatefulWidget {
  final Color baseColor;
  final Color highlightColor;

  const _ShimmerEffect({
    required this.baseColor,
    required this.highlightColor,
  });

  @override
  State<_ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<_ShimmerEffect>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return ShaderMask(
          shaderCallback: (bounds) {
            return LinearGradient(
              colors: [
                widget.baseColor,
                widget.highlightColor,
                widget.baseColor,
              ],
              stops: const [0.0, 0.5, 1.0],
              begin: const Alignment(-1.0, -0.3),
              end: const Alignment(1.0, 0.3),
              transform: _SlidingGradientTransform(
                percent: _controller.value,
              ),
            ).createShader(bounds);
          },
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: widget.baseColor,
          ),
        );
      },
    );
  }
}

class _SlidingGradientTransform extends GradientTransform {
  final double percent;
  const _SlidingGradientTransform({required this.percent});

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(
      bounds.width * 2 * (percent - 0.5),
      0.0,
      0.0,
    );
  }
}

class SkeletonProductCard extends StatelessWidget {
  const SkeletonProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Skeleton(width: double.infinity, height: 150, radius: 12),
            const SizedBox(height: 12),
            const Skeleton(width: 150, height: 14),
            const SizedBox(height: 8),
            const Skeleton(width: 100, height: 12),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Skeleton(width: 80, height: 14),
                Skeleton(width: 60, height: 14),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SkeletonList extends StatelessWidget {
  final int itemCount;
  const SkeletonList({super.key, this.itemCount = 4});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) => const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: SkeletonProductCard(),
      ),
    );
  }
}

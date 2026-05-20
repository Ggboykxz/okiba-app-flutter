import 'package:flutter/material.dart';
import '../../../core/constants/app_spacing.dart';

class ProductImageGallery extends StatefulWidget {
  final List<String> imageUrls;

  const ProductImageGallery({super.key, required this.imageUrls});

  @override
  State<ProductImageGallery> createState() => _ProductImageGalleryState();
}

class _ProductImageGalleryState extends State<ProductImageGallery> {
  final _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final images = widget.imageUrls;

    return Column(
      children: [
        SizedBox(
          height: 320,
          child: PageView.builder(
            controller: _pageController,
            itemCount: images.isNotEmpty ? images.length : 1,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemBuilder: (_, i) {
              return Container(
                color: colorScheme.surfaceContainerHighest,
                child: images.isNotEmpty
                    ? Image.network(images[i], fit: BoxFit.cover)
                    : Center(
                        child: Icon(
                          Icons.image_rounded,
                          size: 80,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
              );
            },
          ),
        ),
        if (images.length > 1)
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: AppSpacing.space12,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(images.length, (i) {
                return AnimatedContainer(
                  duration: AppSpacing.durationFast,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == i ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == i
                        ? colorScheme.primary
                        : colorScheme.surfaceContainerHighest,
                    borderRadius:
                        BorderRadius.circular(AppSpacing.radiusFull),
                  ),
                );
              }),
            ),
          ),
      ],
    );
  }
}

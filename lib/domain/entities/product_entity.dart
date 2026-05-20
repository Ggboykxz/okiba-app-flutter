class ProductEntity {
  final String id;
  final String sellerId;
  final String title;
  final int price;
  final int? oldPrice;
  final List<String> images;
  final String category;
  final double rating;
  final int reviewCount;

  const ProductEntity({
    required this.id,
    required this.sellerId,
    required this.title,
    required this.price,
    this.oldPrice,
    required this.images,
    required this.category,
    this.rating = 0,
    this.reviewCount = 0,
  });
}

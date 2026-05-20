import '../../data/repositories/product_repository.dart';
import '../entities/product_entity.dart';

class GetProducts {
  final ProductRepository _repository;

  GetProducts(this._repository);

  Stream<List<ProductEntity>> call({
    String? category,
    String? zone,
    int? maxPrice,
  }) {
    return _repository
        .getProducts(category: category, zone: zone, maxPrice: maxPrice)
        .map((models) => models
            .map((m) => ProductEntity(
                  id: m.id,
                  sellerId: m.sellerId,
                  title: m.title,
                  price: m.price,
                  oldPrice: m.oldPrice,
                  images: m.images,
                  category: m.category,
                  rating: m.rating,
                  reviewCount: m.reviewCount,
                ))
            .toList());
  }
}

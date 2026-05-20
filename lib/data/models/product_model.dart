enum ProductCondition { neuf, tresBon, bon, aRenover }

enum ProductStatus { active, sold, inactive }

class ProductVariant {
  final String? size;
  final String? color;
  final int price;
  final int stock;

  ProductVariant({
    this.size,
    this.color,
    required this.price,
    this.stock = 1,
  });

  Map<String, dynamic> toMap() => {
        'size': size,
        'color': color,
        'price': price,
        'stock': stock,
      };

  factory ProductVariant.fromMap(Map<String, dynamic> map) => ProductVariant(
        size: map['size'] as String?,
        color: map['color'] as String?,
        price: map['price'] as int,
        stock: map['stock'] as int? ?? 1,
      );
}

class ProductModel {
  final String id;
  final String sellerId;
  final String sellerName;
  final String? sellerPhotoUrl;
  final bool sellerVerified;
  final String title;
  final String? description;
  final List<String> images;
  final int price;
  final int? oldPrice;
  final String category;
  final String? subcategory;
  final ProductCondition? condition;
  final ProductStatus status;
  final List<ProductVariant> variants;
  final int stock;
  final bool isFreeDelivery;
  final double? latitude;
  final double? longitude;
  final String? zone;
  final double rating;
  final int reviewCount;
  final int views;
  final DateTime createdAt;
  final DateTime updatedAt;

  ProductModel({
    required this.id,
    required this.sellerId,
    required this.sellerName,
    this.sellerPhotoUrl,
    this.sellerVerified = false,
    required this.title,
    this.description,
    required this.images,
    required this.price,
    this.oldPrice,
    required this.category,
    this.subcategory,
    this.condition,
    this.status = ProductStatus.active,
    this.variants = const [],
    this.stock = 1,
    this.isFreeDelivery = false,
    this.latitude,
    this.longitude,
    this.zone,
    this.rating = 0,
    this.reviewCount = 0,
    this.views = 0,
    DateTime? createdAt,
    DateTime? updatedAt,
  })  : createdAt = createdAt ?? DateTime.now(),
        updatedAt = updatedAt ?? DateTime.now();

  bool get hasVariants => variants.isNotEmpty;
  bool get isOnSale => oldPrice != null && oldPrice! > price;

  int get discountPercent =>
      isOnSale ? ((oldPrice! - price) / oldPrice! * 100).round() : 0;

  Map<String, dynamic> toMap() => {
        'id': id,
        'sellerId': sellerId,
        'sellerName': sellerName,
        'sellerPhotoUrl': sellerPhotoUrl,
        'sellerVerified': sellerVerified,
        'title': title,
        'description': description,
        'images': images,
        'price': price,
        'oldPrice': oldPrice,
        'category': category,
        'subcategory': subcategory,
        'condition': condition?.name,
        'status': status.name,
        'variants': variants.map((v) => v.toMap()).toList(),
        'stock': stock,
        'isFreeDelivery': isFreeDelivery,
        'latitude': latitude,
        'longitude': longitude,
        'zone': zone,
        'rating': rating,
        'reviewCount': reviewCount,
        'views': views,
        'createdAt': createdAt.toIso8601String(),
        'updatedAt': updatedAt.toIso8601String(),
      };

  factory ProductModel.fromMap(Map<String, dynamic> map) => ProductModel(
        id: map['id'] as String,
        sellerId: map['sellerId'] as String,
        sellerName: map['sellerName'] as String,
        sellerPhotoUrl: map['sellerPhotoUrl'] as String?,
        sellerVerified: map['sellerVerified'] as bool? ?? false,
        title: map['title'] as String,
        description: map['description'] as String?,
        images: List<String>.from(map['images'] as List),
        price: map['price'] as int,
        oldPrice: map['oldPrice'] as int?,
        category: map['category'] as String,
        subcategory: map['subcategory'] as String?,
        condition: map['condition'] != null
            ? ProductCondition.values.byName(map['condition'] as String)
            : null,
        status: ProductStatus.values.byName(map['status'] as String? ?? 'active'),
        variants: (map['variants'] as List?)
                ?.map((v) => ProductVariant.fromMap(v as Map<String, dynamic>))
                .toList() ??
            [],
        stock: map['stock'] as int? ?? 1,
        isFreeDelivery: map['isFreeDelivery'] as bool? ?? false,
        latitude: (map['latitude'] as num?)?.toDouble(),
        longitude: (map['longitude'] as num?)?.toDouble(),
        zone: map['zone'] as String?,
        rating: (map['rating'] as num?)?.toDouble() ?? 0,
        reviewCount: map['reviewCount'] as int? ?? 0,
        views: map['views'] as int? ?? 0,
        createdAt: DateTime.parse(map['createdAt'] as String),
        updatedAt: DateTime.parse(map['updatedAt'] as String),
      );
}

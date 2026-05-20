enum UserRole { client, sellerWhatsapp, sellerBoutique, sellerRapide, livreur }

enum UserStatus { active, suspended, banned }

class UserModel {
  final String id;
  final String phone;
  final String? email;
  final String? fullName;
  final String? photoUrl;
  final UserRole role;
  final UserStatus status;
  final bool isVerified;
  final String? language;
  final String? zone;
  final double rating;
  final int reviewCount;
  final int salesCount;
  final DateTime createdAt;
  final DateTime? lastSeen;

  UserModel({
    required this.id,
    required this.phone,
    this.email,
    this.fullName,
    this.photoUrl,
    required this.role,
    this.status = UserStatus.active,
    this.isVerified = false,
    this.language = 'fr',
    this.zone,
    this.rating = 0,
    this.reviewCount = 0,
    this.salesCount = 0,
    DateTime? createdAt,
    this.lastSeen,
  }) : createdAt = createdAt ?? DateTime.now();

  Map<String, dynamic> toMap() => {
        'id': id,
        'phone': phone,
        'email': email,
        'fullName': fullName,
        'photoUrl': photoUrl,
        'role': role.name,
        'status': status.name,
        'isVerified': isVerified,
        'language': language,
        'zone': zone,
        'rating': rating,
        'reviewCount': reviewCount,
        'salesCount': salesCount,
        'createdAt': createdAt.toIso8601String(),
        'lastSeen': lastSeen?.toIso8601String(),
      };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
        id: map['id'] as String,
        phone: map['phone'] as String,
        email: map['email'] as String?,
        fullName: map['fullName'] as String?,
        photoUrl: map['photoUrl'] as String?,
        role: UserRole.values.byName(map['role'] as String),
        status: UserStatus.values.byName(map['status'] as String? ?? 'active'),
        isVerified: map['isVerified'] as bool? ?? false,
        language: map['language'] as String? ?? 'fr',
        zone: map['zone'] as String?,
        rating: (map['rating'] as num?)?.toDouble() ?? 0,
        reviewCount: map['reviewCount'] as int? ?? 0,
        salesCount: map['salesCount'] as int? ?? 0,
        createdAt: DateTime.parse(map['createdAt'] as String),
        lastSeen: map['lastSeen'] != null ? DateTime.parse(map['lastSeen'] as String) : null,
      );
}

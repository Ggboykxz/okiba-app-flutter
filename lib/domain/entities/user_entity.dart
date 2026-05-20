class UserEntity {
  final String id;
  final String phone;
  final String? fullName;
  final String? photoUrl;
  final String role;
  final bool isVerified;

  const UserEntity({
    required this.id,
    required this.phone,
    this.fullName,
    this.photoUrl,
    required this.role,
    this.isVerified = false,
  });
}

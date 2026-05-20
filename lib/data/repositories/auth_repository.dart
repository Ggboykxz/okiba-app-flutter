import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import '../datasources/local_datasource.dart';

class AuthRepository {
  final FirebaseAuth _auth;
  final LocalDataSource _local;

  AuthRepository({
    FirebaseAuth? auth,
    LocalDataSource? local,
  })  : _auth = auth ?? FirebaseAuth.instance,
        _local = local ?? LocalDataSource();

  User? get currentUser => _auth.currentUser;
  bool get isLoggedIn => _auth.currentUser != null;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<void> sendOtp(String phone) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phone,
      verificationCompleted: (_) {},
      verificationFailed: (_) {},
      codeSent: (_, a) {},
      codeAutoRetrievalTimeout: (_) {},
    );
  }

  Future<UserCredential> verifyOtp({
    required String verificationId,
    required String code,
  }) async {
    final credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: code,
    );
    return await _auth.signInWithCredential(credential);
  }

  Future<void> registerUser(UserModel user) async {
    await _local.cacheUser(user);
  }

  Future<void> updateProfile(UserModel user) async {
    await _local.cacheUser(user);
  }

  Future<UserModel?> getCachedUser() async {
    return _local.getCachedUser();
  }

  Future<void> logout() async {
    await _auth.signOut();
    await _local.clearUser();
  }
}

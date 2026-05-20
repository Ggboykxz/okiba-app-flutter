import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class RemoteDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  // Auth
  Future<UserCredential> signInWithPhone(String phone, String code) {
    // Handled via Firebase OTP
    throw UnimplementedError('Use Firebase Auth phone OTP flow');
  }

  Future<void> signOut() => _auth.signOut();

  User? get currentUser => _auth.currentUser;

  // Firestore collections
  CollectionReference get users => _firestore.collection('users');
  CollectionReference get products => _firestore.collection('products');
  CollectionReference get orders => _firestore.collection('orders');
  CollectionReference get deliveries => _firestore.collection('deliveries');
  CollectionReference get payments => _firestore.collection('payments');
  CollectionReference get conversations => _firestore.collection('conversations');
  CollectionReference get messages => _firestore.collection('messages');
  CollectionReference get notifications => _firestore.collection('notifications');
  CollectionReference get reviews => _firestore.collection('reviews');

  // Storage
  Reference get productImages => _storage.ref().child('products');
  Reference get userAvatars => _storage.ref().child('avatars');
  Reference get deliveryProofs => _storage.ref().child('delivery_proofs');

  Future<String> uploadImage({
    required Reference reference,
    required String fileName,
    required Uint8List bytes,
  }) async {
    final ref = reference.child(fileName);
    await ref.putData(bytes);
    return await ref.getDownloadURL();
  }

  // Timestamp
  Timestamp get now => Timestamp.now();
}

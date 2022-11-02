import 'package:animetv/features/auth/domain/entity/loginEntity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:injectable/injectable.dart";

@lazySingleton
class AuthRepository {
  final FirebaseFirestore firestore;
  final FirebaseAuth auth;

  AuthRepository(this.firestore, this.auth);

  Future<dynamic> signIn(LoginEntity loginEntity) async {
    try {
      await auth.signInWithEmailAndPassword(
          email: loginEntity.email!, password: loginEntity.password!);
    } catch (e) {
      rethrow;
    }
  }
  Future<dynamic> signUp(LoginEntity loginEntity) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: loginEntity.email!, password: loginEntity.password!);
    } catch (e) {
      rethrow;
    }
  }
}

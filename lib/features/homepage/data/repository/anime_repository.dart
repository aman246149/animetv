import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AnimeRepository {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  AnimeRepository(this.auth, this.firestore);

  Future<dynamic> getAnime() async {
    try {
      return await firestore
          .collection("anime")
          .orderBy('time', descending: true)
          .get();
    } catch (e) {
      rethrow;
    }
  }
}

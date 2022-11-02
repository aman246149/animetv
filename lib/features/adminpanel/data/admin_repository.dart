import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AdminRepository {
  final FirebaseFirestore firestore;

  AdminRepository(this.firestore);

  Future<dynamic> setAnimeData(Map<String, dynamic> data) async {
    try {
      return await firestore.collection("anime").add(data);
    } catch (e) {
      rethrow;
    }
  }
}

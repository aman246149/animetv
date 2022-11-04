import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AdminRepository {
  final FirebaseFirestore firestore;
  final FirebaseStorage storage;
  final FirebaseAuth auth;

  AdminRepository(this.firestore, this.storage, this.auth);

  Future<dynamic> setAnimeData(Map<String,dynamic> data,File imageFile) async {
    try {
      //upload to storage

if(imageFile.path.isNotEmpty){
  
      var snapshot = await storage
          .ref()
          .child('${FirebaseAuth.instance.currentUser!.uid}/imageName')
          .putFile(imageFile);

      String downloadUrl = await snapshot.ref.getDownloadURL();

      if (downloadUrl.isNotEmpty) {
        data["imageUrl"] = downloadUrl;
      }
    
}

      return await firestore.collection("anime").add(data);
    } catch (e) {
      rethrow;
    }
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseDb {

  @lazySingleton // or @singleton 
  FirebaseFirestore get firebasefiresore => FirebaseFirestore.instance; 
}


@module
abstract class FirebaseAuthIns {

  @lazySingleton // or @singleton 
  FirebaseAuth get auth => FirebaseAuth.instance; 
}
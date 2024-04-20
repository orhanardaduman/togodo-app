import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

enum FirebaseCollections {
  userSettings,
  auth,
  notification,
  version;

  CollectionReference get referance =>
      FirebaseFirestore.instance.collection(name);
}

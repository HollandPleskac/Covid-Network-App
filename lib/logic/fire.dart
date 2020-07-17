import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final Firestore _firestore = Firestore.instance;

class Fire {
  void pressDisarm({
    List deviceids,
    List longcoords,
    List latcoords,
    String email,
  }) {
    _firestore.collection('Logs').document().setData({
      'encounters': deviceids,
      'location': {
        'longitude': longcoords,
        'latitude': latcoords,
      },
      'email': email,
    });
  }
}

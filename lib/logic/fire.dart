import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final Firestore _firestore = Firestore.instance;

class Fire {
  void pressDisarm({
    List deviceids,
    List coords,
    String email,
  }) {
    _firestore.collection('Logs').document().setData({
      'encounters': deviceids,
      'location': {
        'coords': coords,
      },
      'email': email,
    });
  }
}

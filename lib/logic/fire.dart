import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final Firestore _firestore = Firestore.instance;

class Fire {
  void pressDisarm() {
    _firestore.collection('Logs').document().setData({
      'encounters': '',
      'high alert encounters': '',
      'location': [],
      'email': 'email',
      'groups': 0,
    });
  }
}

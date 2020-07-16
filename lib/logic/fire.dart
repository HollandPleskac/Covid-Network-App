import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;

class Fire {
  void pressDisarm() {
    _firestore.collection('Logs').document().setData({
      'encounters': '',
      'high alert encounters': '',
      'location': [],
      'email':'email',
      'groups':0,
    });
  }
}

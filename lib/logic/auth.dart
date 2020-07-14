import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = Firestore.instance;
final _firebaseAuth = FirebaseAuth.instance;

class Auth {
  Future<List> login({String email, String password}) async {
    try {
      AuthResult authResult = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);

      FirebaseUser user = authResult.user;

      return ['success', email];
    } catch (error) {
      return ['failure', 'error'];
      // switch (error.code) {
      //   case "ERROR_INVALID_EMAIL":
      //     return ['failure', 'Email is badly formatted'];
      //   case "ERROR_WRONG_PASSWORD":
      //     return ['failure', 'Password is incorrect'];
      //   case "ERROR_USER_NOT_FOUND":
      //     return ['failure', 'No user exists for this email address'];
      //   case "ERROR_USER_DISABLED":
      //     return ['failure', 'Account has been disabled'];
      //   case "ERROR_TOO_MANY_REQUESTS":
      //     return [
      //       'failure',
      //       'Too many requests to sign in please wait to sign in'
      //     ];
      //   case "ERROR_OPERATION_NOT_ALLOWED":
      //     return [
      //       'failure',
      //       'Account not enabled - contact {Covid Network Email}'
      //     ];
      //   default:
      //     return ['failure', 'An unknown error occurred'];
      // }
    }
    // return ['success', email];
  }

  Future<List> signUp({
    String email,
    String password,
  }) async {
    try {
      AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;

      return ['success', email];
    } catch (error) {
      return ['failure', 'error'];
      // switch (error.code) {
      //   case "ERROR_WEAk_PASSWORD":
      //     return ['failure', 'Password is not strong enough'];
      //   case "ERROR_INVALID_EMAIL":
      //     return ['failure', 'Email address formatted incorrectly'];
      //   case "ERROR_EMAIL_ALREADY_IN_USE ":
      //     return ['failure', 'Email already in use'];
      //   default:
      //     return ['failure', 'An unknown error occurred'];
      // }
    }
    // return ['success', email];
  }

  void setUpAccount({String email, String password}) {
    _firestore.collection('Users').document(email).setData({
      'email': email,
    });
    _firestore.collection('Users').document(email).collection('logs');
  }
}

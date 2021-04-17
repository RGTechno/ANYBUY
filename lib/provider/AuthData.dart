import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthData with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool _isAuth = false;

  bool get isAuth {
    return _isAuth;
  }

  void createUser({
    @required String email,
    @required String pass,
    @required String firstname,
    @required String lastname,
  }) async {
    print("create user running");
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      await firestore
          .collection("users")
          .doc("${userCredential.user.uid}")
          .set({
        "id": "${userCredential.user.uid}",
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "initials": "${firstname[0].toUpperCase()}${lastname[0].toUpperCase()}",
      });

      print(
        "User Created ${userCredential.user.email}, ${userCredential.user.uid}",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void createMerchant({
    @required String email,
    @required String pass,
    @required String firstname,
    @required String lastname,
  }) async {
    print("create user running");
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: pass,
      );

      await firestore
          .collection("merchant")
          .doc("${userCredential.user.uid}")
          .set({
        "id": "${userCredential.user.uid}",
        "firstname": firstname,
        "lastname": lastname,
        "email": email,
        "isMerchant": true,
        "initials": "${firstname[0].toUpperCase()}${lastname[0].toUpperCase()}",
      });

      print(
        "User Created ${userCredential.user.email}, ${userCredential.user.uid}",
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String email, String pass) async {
    print("login running");

    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );
      print(userCredential.user.email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void signOut(BuildContext ctx) async {
    await auth.signOut();
    Navigator.of(ctx).pop();
  }
}

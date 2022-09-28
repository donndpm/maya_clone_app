import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthRepository {
  final _firebaseAuth = FirebaseAuth.instance;

  Future<User?> createUser(String email, String password) async {
    try {
      final user = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return user.user;
    } on FirebaseAuthException catch (err) {
      throw Exception(err.code);
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (err) {
      throw Exception(err.code);
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> updateDisplayName(
      User? user, String firstName, String lastName) async {
    try {
      await user?.updateDisplayName('$firstName $lastName');
    } catch (err) {
      throw Exception(err);
    }
  }

  Future<void> signOutUser() async {
    try {
      await _firebaseAuth.signOut();
    } on FirebaseAuthException catch (err) {
      throw Exception(err);
    } catch (err) {
      throw Exception(err);
    }
  }
}

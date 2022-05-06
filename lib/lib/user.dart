import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String uid;
  final String firstname;
  final String email;
  final String secondname;
  

  User({
    this.uid,
    this.firstname,
    this.email,
    this.secondname
  });

  factory User.fromDocument(DocumentSnapshot doc) {
    return User(
      uid: doc['uid'],
      email: doc['email'],
      firstname: doc['firstname'],
      secondname: doc['secondname'],
      
    );
  }
}
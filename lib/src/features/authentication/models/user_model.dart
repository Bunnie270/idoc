import 'package:cloud_firestore/cloud_firestore.dart';
class UserModel {
  final String? id;
  final String fName;
  final String lName;
  final String eMail;
  final int age;
  final String? aDdress;
  final String? oCcupation;

  const UserModel({
    this.id,
    required this.fName,
    required this.lName,
    required this.eMail,
    required this.age,
    required this.aDdress,
    required this.oCcupation,

});

  toJson() {
    return {
      "FirstName": fName,
      "LastName": lName,
      "Email": eMail,
      "age": age,
      "Address": aDdress,
      "Occupation": oCcupation
    };
  }

   factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document){
    final data = document.data()!;
    return UserModel(
      id: document.id,
        fName: data["first name"],
        lName: data["last name"],
        eMail: data["email"],
        age: data["age"],
        aDdress: data["address"],
        oCcupation: data["occupation"]
       );

  }
}
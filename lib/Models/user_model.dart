class UserModel {
  String? fName;
  String? lName;
  String? eMail;
  int? age;
  String? aDdress;
  String? oCcupation;

  UserModel();

  UserModel.fromJson(Map<String,dynamic> json) {
    fName = json['first name'];
    lName = json['last name'];
    eMail = json['email'];
    age = json['age'];
    aDdress = json['address'];
    oCcupation = json['occupation'];
  }

  set value(UserModel value) {}
}
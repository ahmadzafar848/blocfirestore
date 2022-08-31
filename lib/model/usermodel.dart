class UserModel {
  String? uid;
  String? firstName;
  String? secondName;
  String? email;
  String? password;

  UserModel(
      {this.uid, this.firstName, this.secondName, this.email, this.password});

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'firstName': firstName,
      'secondName': secondName,
      'email': email,
    };
  }

  UserModel.fromMap(Map<String, dynamic> map)
      : uid = map['uid'],
        firstName = map['firstName'],
        secondName = map['secondName'],
        email = map['email'];
}

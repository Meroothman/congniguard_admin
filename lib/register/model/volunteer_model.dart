class UserModel {
  String uId;
  String fullName;
  String email;
  String password;
  String phone;
  String age;
  String birthDay;

  UserModel(
      {required this.uId,
      required this.fullName,
      required this.email,
      required this.password,
      required this.phone,
      required this.age,
      required this.birthDay});

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'fullName': fullName,
      'email': email,
      'password': password,
      'phone': phone,
      'age': age,
      'birthDay': birthDay,
    };
  }

  factory UserModel.fromjson(Map<String, dynamic> json) {
    return UserModel(
        uId: json['uId'],
        fullName: json['fullName'],
        email: json['email'],
        password: json['password'],
        phone: json['phone'],
        age: json['age'],
        birthDay: json['birthDay']);
  }
}

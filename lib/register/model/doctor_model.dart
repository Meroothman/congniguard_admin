class DoctorModel {
  String bio;
  String fullName;
  String email;
  String password;
  String phone;
  List groupsId = [];
  List patientsId = [];
  String uId;
  String image;

  DoctorModel({
    required this.uId,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
    required this.bio,
    required this.groupsId,
    required this.patientsId,
    required this.image,
  });

  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'fullName': fullName,
      'email': email,
      'password': password,
      'phone': phone,
      'age': bio,
      'groupsId': groupsId,
      'patientsId': patientsId,
      'image': image
    };
  }

  factory DoctorModel.fromjson(Map<String, dynamic> json) {
    return DoctorModel(
        uId: json['uId'],
        fullName: json['fullName'],
        email: json['email'],
        password: json['password'],
        phone: json['phone'],
        bio: json['bio'],
        groupsId: json['groupsId'],
        patientsId: json['patientsId'],
        image: json['image']);
  }
}

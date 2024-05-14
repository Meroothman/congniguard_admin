class VolunteerModel {
  String bio;
  String fullName;
  String email;
  String password;
  String phone;

  String uId;
  String image;

  VolunteerModel({
    required this.uId,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
    required this.bio,
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
      'image': image
    };
  }

  factory VolunteerModel.fromjson(Map<String, dynamic> json) {
    return VolunteerModel(
        uId: json['uId'],
        fullName: json['fullName'],
        email: json['email'],
        password: json['password'],
        phone: json['phone'],
        bio: json['bio'],
        image: json['image']);
  }
}

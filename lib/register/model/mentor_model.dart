class MentorModel {
  String bio;
  String fullName;
  String email;
  String password;
  String phone;
  List groupsId = [];

  String uId;
  String image;

  MentorModel({
    required this.uId,
    required this.fullName,
    required this.email,
    required this.password,
    required this.phone,
    required this.bio,
    required this.groupsId,
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
      'image': image
    };
  }

  factory MentorModel.fromjson(Map<String, dynamic> json) {
    return MentorModel(
        uId: json['uId'],
        fullName: json['fullName'],
        email: json['email'],
        password: json['password'],
        phone: json['phone'],
        bio: json['bio'],
        groupsId: json['groupsId'],
        image: json['image']);
  }
}

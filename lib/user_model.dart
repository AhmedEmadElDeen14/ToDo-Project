class UserModel {
  String email;
  String id;
  String userName;
  String phone;

  UserModel({
    required this.email,
    required this.id,
    required this.phone,
    required this.userName,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          email: json['email'],
          phone: json['phone'],
          userName: json['userName'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "phone": phone,
      "userName": userName,
    };
  }
}

class User {
  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? email;
  String? password;

  User({this.firstName, this.lastName, this.phoneNumber, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json["firstName"],
      lastName: json["lastName"],
      phoneNumber: json["phoneNumber"],
      email: json["email"],
      password: json["password"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "phoneNumber": phoneNumber,
      "email": email,
      "password": password,
    };
  }
}

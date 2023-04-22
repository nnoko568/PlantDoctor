class Users {
  String? firstName;
  String? lastName;
  String? email;

  Users({
    this.firstName,
    this.lastName,
    this.email,
  });

  factory Users.fromMap(user) {
    return Users(
      firstName: user['First Name'],
      lastName: user['Last Name'],
      email: user['Email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Fist Name': firstName,
      'Last Name': lastName,
      'Phone Number': email,
    };
  }
}

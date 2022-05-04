class User {
  User({
    required this.sub,
    required this.emailVerified,
    required this.givenName,
    required this.familyName,
    required this.email,
  });

  final String sub;
  final String emailVerified;
  final String givenName;
  final String familyName;
  final String email;

  factory User.fromJson(Map<String, dynamic> json) => User(
    sub: json["sub"],
    emailVerified: json["email_verified"],
    givenName: json["given_name"],
    familyName: json["family_name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "sub": sub,
    "email_verified": emailVerified,
    "given_name": givenName,
    "family_name": familyName,
    "email": email,
  };
}

class Tokens {
  Tokens({
    required this.idToken,
    required this.refreshToken,
    required this.accessToken,
    required this.expiresIn,
    required this.tokenType,
  });

  final String idToken;
  final String refreshToken;
  final String accessToken;
  final int expiresIn;
  final String tokenType;

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
    idToken: json["id_token"],
    refreshToken: json["refresh_token"],
    accessToken: json["access_token"],
    expiresIn: json["expires_in"],
    tokenType: json["token_type"],
  );

  Map<String, dynamic> toJson() => {
    "id_token": idToken,
    "refresh_token": refreshToken,
    "access_token": accessToken,
    "expires_in": expiresIn,
    "token_type": tokenType,
  };
}

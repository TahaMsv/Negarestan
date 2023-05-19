class User {
  User({
    required this.id,
    required this.gender,
    required this.username,
    required this.firstname,
    required this.lastname,
    this.password,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.bio,
    required this.skills,
    required this.institutions,
    required this.followers,
    required this.birthDay,
    required this.createdAt,
    this.token,
  });

  int id;
  String? token;
  String username;
  String firstname;
  String lastname;
  String? password;
  String email;
  String phoneNumber;
  String country;
  String city;
  String bio;
  DateTime birthDay;
  String createdAt;
  String gender;
  List<String> skills;
  List<String> institutions;
  List<int> followers;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        token: json["token"],
        username: json["username"],
        firstname: json["first_name"],
        lastname: json["last_name"],
        // password: json["password"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        country: json["country"],
        city: json["city"],
        bio: json["bio"],
        skills: json["skills"].cast<String>(),
        institutions: json["institutions"].cast<String>(),
        birthDay: DateTime.parse(json["birthday"]),
        gender: json["gender"],
        followers: [].cast<int>(),
        createdAt: json["created_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "first_name": firstname,
        "last_name": lastname,
        "password": password,
        "email": email,
        "phone_number": phoneNumber,
        "country": country,
        "city": city,
        "bio": bio,
        "skills": skills,
        "institutions": institutions,
        "birthday": birthDay,
        "gender": gender,
      };
}

enum Gender { male, female }

extension FlavorExtension on Gender {
  String get name {
    switch (this) {
      case Gender.male:
        return "M";
      case Gender.female:
        return "F";
      default:
        return "M";
    }
  }
}

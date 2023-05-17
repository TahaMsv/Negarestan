class User {
  User({
    required this.id,
    required this.gender,
    required this.username,
    required this.firstname,
    required this.lastname,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.country,
    required this.city,
    required this.bio,
    required this.skills,
    required this.institutions,
    required this.birthDay,
  });

  int id;
  String username;
  String firstname;
  String lastname;
  String password;
  String email;
  String phoneNumber;
  String country;
  String city;
  String bio;
  List<String> skills;
  List<String> institutions;
  DateTime birthDay;
  String gender;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        firstname: json["first_name"],
        lastname: json["last_name"],
        password: json["password"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        country: json["country"],
        city: json["city"],
        bio: json["bio"],
        skills: json["skills"],
        institutions: json["institutions"],
        birthDay: DateTime.parse(json["birthday"]),
        gender: json["gender"],
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

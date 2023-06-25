class User {
  User({
    this.id,
    this.gender,
    this.username,
    this.firstname,
    this.lastname,
    this.password,
    this.email,
    this.phoneNumber,
    this.country,
    this.city,
    this.bio,
    this.skills,
    this.institutions,
    this.followers,
    this.followings,
    this.birthDay,
    this.createdAt,
    this.token,
  });

  int? id;
  String? token;
  String? username;
  String? firstname;
  String? lastname;
  String? password;
  String? email;
  String? phoneNumber;
  String? country;
  String? city;
  String? bio;
  DateTime? birthDay;
  String? createdAt;
  String? gender;
  List<String>? skills;
  List<String>? institutions;
  List<User>? followers;
  List<User>? followings;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        token: json["token"],
        username: json["username"],
        firstname: json["first_name"],
        lastname: json["last_name"],
        password: json["password"],
        email: json["email"],
        phoneNumber: json["phone_number"],
        country: json["country"],
        city: json["city"],
        bio: json["bio"],
        skills: json["skills"]?.cast<String>(),
        institutions: json["institutions"]?.cast<String>(),
        birthDay: json["birthday"] == null ? null : DateTime.parse(json["birthday"]),
        gender: json["gender"],
        followers: json["followers"] == null ? [] : List<User>.from(json["followers"].map((x) => User.fromJson(x))),
        followings: json["following"] == null ? [] : List<User>.from(json["following"].map((x) => User.fromJson(x))),
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
        "followers": followers,
        "following": followings,
      };

  bool operator ==(u) => u is User && u.id == id;
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

class Project {
  Project({
    required this.id,
    required this.user,
    required this.title,
    required this.description,
    this.awards,
    required this.labels,
    required this.institutions,
    required this.tools,
    required this.likes,
    required this.comments,
  });

  int id;
  int user;
  String title;
  String description;
  String? awards;
  List<String> labels;
  List<String> institutions;
  List<String> tools;
  List<String> likes;
  List<Comment> comments;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        user: json["user"],
        title: json["title"],
        description: json["description"],
        awards: json["awards"],
        labels: json["labels"].cast<String>(),
        likes: json["likes"].cast<String>(),
        tools: json["tools"].cast<String>(),
        institutions: json["institutions"]?.cast<String>(),
        comments: List<Comment>.from(json["comments"].map((c) => Comment.fromJson(c))),
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "username": username,
  //       "first_name": firstname,
  //       "last_name": lastname,
  //       "password": password,
  //       "email": email,
  //       "phone_number": phoneNumber,
  //       "country": country,
  //       "city": city,
  //       "bio": bio,
  //       "skills": skills,
  //       "institutions": institutions,
  //       "birthday": birthDay,
  //       "gender": gender,
  //       "followers": followers,
  //       "following": followings,
  //     };

  bool operator ==(p) => p is Project && p.id == id;
}

class Comment {
  Comment({
    required this.id,
    required this.user,
    required this.project,
    required this.content,
  });

  int id;
  int user;
  int project;
  String content;

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json["id"],
        user: json["user"],
        content: json["content"],
        project: json["project"],
      );

  bool operator ==(c) => c is Comment && c.id == id;
}

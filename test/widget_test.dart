class User {
  final int userId;
  final int id;
  final String title;
  final String body;

  User(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  (int, int, String, String) userAndTitle(Map<String, dynamic> json) {
    return (
      json['userId'] as int,
      json['id'] as int,
      json['title'] as String,
      json['body'] as String
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'id': id,
        'title': title,
        'body': body,
      };
}

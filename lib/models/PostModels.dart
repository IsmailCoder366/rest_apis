/// Post Model

class PostModels {
  final num userId;
  final num id;
  final String title;
  final String body;

  PostModels({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  // Factory constructor to create a PostModels instance from JSON
  factory PostModels.fromJson(Map<String, dynamic> json) {
    return PostModels(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  // Creates a new instance by copying the current one, with optional new values
  PostModels copyWith({
    num? userId,
    num? id,
    String? title,
    String? body,
  }) {
    return PostModels(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  // Convert the instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}

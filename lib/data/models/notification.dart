class NotificationModel {
  String id;
  String title;
  String body;
  bool isRead;
  DateTime readAt;
  DateTime createdAt;

  NotificationModel({
    required this.id,
    required this.title,
    required this.body,
    required this.isRead,
    required this.readAt,
    required this.createdAt,
  });

  NotificationModel copyWith({
    String? id,
    String? title,
    String? body,
    bool? isRead,
    DateTime? readAt,
    DateTime? createdAt,
  }) =>
      NotificationModel(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        isRead: isRead ?? this.isRead,
        readAt: readAt ?? this.readAt,
        createdAt: createdAt ?? this.createdAt,
      );

  factory NotificationModel.fromJson(Map<String, dynamic> json) => NotificationModel(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    isRead: json["isRead"],
    readAt: DateTime.parse(json["readAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "isRead": isRead,
    "readAt": readAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
  };
}
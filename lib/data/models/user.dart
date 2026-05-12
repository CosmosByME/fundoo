class User {
  String? id;
  String? phoneNumber;
  String? displayName;
  String? fullname;
  int? age;
  String? bio;
  int? status;
  bool? hasPassword;
  String? profilePictureId;
  DateTime lastLoginAt;
  DateTime createdAt;
  DateTime updatedAt;

  User({
    this.id,
    this.phoneNumber,
    this.displayName,
    this.fullname,
    this.age,
    this.bio,
    this.status,
    this.hasPassword,
    this.profilePictureId,
    required this.lastLoginAt,
    required this.createdAt,
    required this.updatedAt,
  });

  User copyWith({
    String? id,
    String? phoneNumber,
    String? displayName,
    String? fullname,
    int? age,
    String? bio,
    int? status,
    bool? hasPassword,
    String? profilePictureId,
    DateTime? lastLoginAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      User(
        id: id ,
        phoneNumber: phoneNumber ,
        displayName: displayName ,
        fullname: fullname ,
        age: age ,
        bio: bio ,
        status: status ,
        hasPassword: hasPassword ,
        profilePictureId: profilePictureId ,
        lastLoginAt: lastLoginAt ?? this.lastLoginAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    phoneNumber: json["phoneNumber"],
    displayName: json["displayName"],
    fullname: json["fullname"],
    age: json["age"],
    bio: json["bio"],
    status: json["status"],
    hasPassword: json["hasPassword"],
    profilePictureId: json["profilePictureId"],
    lastLoginAt: DateTime.parse(json["lastLoginAt"]),
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "phoneNumber": phoneNumber,
    "displayName": displayName,
    "fullname": fullname,
    "age": age,
    "bio": bio,
    "status": status,
    "hasPassword": hasPassword,
    "profilePictureId": profilePictureId,
    "lastLoginAt": lastLoginAt.toIso8601String(),
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}
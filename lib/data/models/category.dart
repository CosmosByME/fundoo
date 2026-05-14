class Category {
  final int id;
  final String name;
  final bool isSystem;
  final bool isOther;

  Category({
    required this.id,
    required this.name,
    required this.isSystem,
    required this.isOther,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'] as int,
      name: json['name'] as String,
      isSystem: json['isSystem'] as bool,
      isOther: json['isOther'] as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'isSystem': isSystem,
      'isOther': isOther,
    };
  }
}
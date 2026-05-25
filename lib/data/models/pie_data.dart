class PieData {
  final int period;
  final String periodName;
  final DateTime from;
  final DateTime to;
  final double totalExpenses;
  final List<Category> categories;

  const PieData({
    required this.period,
    required this.periodName,
    required this.from,
    required this.to,
    required this.totalExpenses,
    required this.categories,
  });

  PieData copyWith({
    int? period,
    String? periodName,
    DateTime? from,
    DateTime? to,
    double? totalExpenses,
    List<Category>? categories,
  }) => PieData(
    period: period ?? this.period,
    periodName: periodName ?? this.periodName,
    from: from ?? this.from,
    to: to ?? this.to,
    totalExpenses: totalExpenses ?? this.totalExpenses,
    categories: categories ?? this.categories,
  );

  bool existsButEmpty() => totalExpenses == 0 || categories.isEmpty || categories.every((c) => c.amount == 0);

  factory PieData.fromJson(Map<String, dynamic> json) => PieData(
    period: json["period"],
    periodName: json["periodName"],
    from: DateTime.parse(json["from"]),
    to: DateTime.parse(json["to"]),
    totalExpenses: json["totalExpenses"].toDouble(),
    categories: List<Category>.from(
      json["categories"].map((x) => Category.fromJson(x)),
    ),
  );

  Map<String, dynamic> toJson() => {
    "period": period,
    "periodName": periodName,
    "from": from.toIso8601String(),
    "to": to.toIso8601String(),
    "totalExpenses": totalExpenses,
    "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
  };
}

class Category {
  final String categoryName;
  final bool isSystem;
  final double amount;
  final double percentage;

  const Category({
    required this.categoryName,
    required this.isSystem,
    required this.amount,
    required this.percentage,
  });

  Category copyWith({
    String? categoryName,
    bool? isSystem,
    double? amount,
    double? percentage,
  }) => Category(
    categoryName: categoryName ?? this.categoryName,
    isSystem: isSystem ?? this.isSystem,
    amount: amount ?? this.amount,
    percentage: percentage ?? this.percentage,
  );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    categoryName: json["categoryName"],
    isSystem: json["isSystem"],
    amount: json["amount"].toDouble(),
    percentage: json["percentage"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "categoryName": categoryName,
    "isSystem": isSystem,
    "amount": amount,
    "percentage": percentage,
  };
}

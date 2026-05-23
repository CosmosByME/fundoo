class Transaction {
    final String id;
    final String walletId;
    final String goalId;
    final int transactionType;
    final double amount;
    final double balanceAfter;
    final String description;
    final int? categoryId;
    final String? categoryName;
    final int? manualCategoryId;
    final String? manualCategoryName;
    final DateTime occurredAt;
    final DateTime createdAt;

    Transaction({
        required this.id,
        required this.walletId,
        required this.goalId,
        required this.transactionType,
        required this.amount,
        required this.balanceAfter,
        required this.description,
        this.categoryId,
        this.categoryName,
        this.manualCategoryId,
        this.manualCategoryName,
        required this.occurredAt,
        required this.createdAt,
    });

    Transaction copyWith({
        String? id,
        String? walletId,
        String? goalId,
        int? transactionType,
        double? amount,
        double? balanceAfter,
        String? description,
        int? categoryId,
        String? categoryName,
        int? manualCategoryId,
        String? manualCategoryName,
        DateTime? occurredAt,
        DateTime? createdAt,
    }) => 
        Transaction(
            id: id ?? this.id,
            walletId: walletId ?? this.walletId,
            goalId: goalId ?? this.goalId,
            transactionType: transactionType ?? this.transactionType,
            amount: amount ?? this.amount,
            balanceAfter: balanceAfter ?? this.balanceAfter,
            description: description ?? this.description,
            categoryId: categoryId ?? this.categoryId,
            categoryName: categoryName ?? this.categoryName,
            manualCategoryId: manualCategoryId ?? this.manualCategoryId,
            manualCategoryName: manualCategoryName ?? this.manualCategoryName,
            occurredAt: occurredAt ?? this.occurredAt,
            createdAt: createdAt ?? this.createdAt,
        );

    factory Transaction.fromJson(Map<String, dynamic> json) => Transaction(
        id: json["id"],
        walletId: json["walletId"],
        goalId: json["goalId"],
        transactionType: json["transactionType"],
        amount: json["amount"],
        balanceAfter: json["balanceAfter"],
        description: json["description"],
        categoryId: json["categoryId"],
        categoryName: json["categoryName"],
        manualCategoryId: json["manualCategoryId"],
        manualCategoryName: json["manualCategoryName"],
        occurredAt: DateTime.parse(json["occurredAt"]),
        createdAt: DateTime.parse(json["createdAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "walletId": walletId,
        "goalId": goalId,
        "transactionType": transactionType,
        "amount": amount,
        "balanceAfter": balanceAfter,
        "description": description,
        "categoryId": categoryId,
        "categoryName": categoryName,
        "manualCategoryId": manualCategoryId,
        "manualCategoryName": manualCategoryName,
        "occurredAt": occurredAt.toIso8601String(),
        "createdAt": createdAt.toIso8601String(),
    };
}

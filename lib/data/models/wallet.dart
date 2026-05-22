class Wallet {
    String walletId;
    num? balance;
    int? currency;
    num? totalIncome;
    num? totalExpenses;
    int? activeGoalsCount;
    DateTime? lastUpdated;

    Wallet({
        this.walletId = "",
        this.balance,
        this.currency,
        this.totalIncome,
        this.totalExpenses,
        this.activeGoalsCount,
        this.lastUpdated,
    });

    Wallet copyWith({
        String? walletId,
        double? balance,
        int? currency,
        double? totalIncome,
        double? totalExpenses,
        int? activeGoalsCount,
        DateTime? lastUpdated,
    }) => 
        Wallet(
            walletId: walletId ?? this.walletId,
            balance: balance ?? this.balance,
            currency: currency ?? this.currency,
            totalIncome: totalIncome ?? this.totalIncome,
            totalExpenses: totalExpenses ?? this.totalExpenses,
            activeGoalsCount: activeGoalsCount ?? this.activeGoalsCount,
            lastUpdated: lastUpdated ?? this.lastUpdated,
        );


    factory Wallet.fromJson(Map<String, dynamic> json) => Wallet(
        walletId: json["walletId"] ?? "",
        balance: json["balance"],
        currency: json["currency"],
        totalIncome: json["totalIncome"],
        totalExpenses: json["totalExpenses"],
        activeGoalsCount: json["activeGoalsCount"],
        lastUpdated: json["lastUpdated"] != null ? DateTime.parse(json["lastUpdated"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "walletId": walletId,
        "balance": balance,
        "currency": currency,
        "totalIncome": totalIncome,
        "totalExpenses": totalExpenses,
        "activeGoalsCount": activeGoalsCount,
        "lastUpdated": lastUpdated?.toIso8601String(),
    };
}

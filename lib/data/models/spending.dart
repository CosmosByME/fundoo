enum SpendingType { spending, income, investment }

class SpendingOrIncome {
  final String name;
  final double amount;
  final SpendingType type;
  final String date;

  
  const SpendingOrIncome({
    required this.name,
    required this.amount,
    required this.type,
    required this.date,
  });
}

class Goal {
  String? id;
  String? name;
  String? description;
  int? goalType;
  double? targetAmount;
  double? currentSavedAmount;
  double? progressPercent;
  double? monthlyTarget;
  int? currency;
  String? targetDate;
  int? plannedMonths;
  int? status;
  bool? isCompleted;
  String? completedAt;
  String? createdAt;
  String? updatedAt;

  Goal({
    this.id,
    this.name,
    this.description,
    this.goalType,
    this.targetAmount,
    this.currentSavedAmount,
    this.progressPercent,
    this.monthlyTarget,
    this.currency,
    this.targetDate,
    this.plannedMonths,
    this.status,
    this.isCompleted,
    this.completedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Goal.fromJson(Map<String, dynamic> json) {
    return Goal(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      goalType: json['goalType'] as int?,
      targetAmount: json['targetAmount'] as double?,
      currentSavedAmount: json['currentSavedAmount'] as double?,
      progressPercent: json['progressPercent'] as double?,
      monthlyTarget: json['monthlyTarget'] as double?,
      currency: json['currency'] as int?,
      targetDate: json['targetDate'] as String?,
      plannedMonths: json['plannedMonths'] as int?,
      status: json['status'] as int?,
      isCompleted: json['isCompleted'] as bool?,
      completedAt: json['completedAt'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'goalType': goalType,
      'targetAmount': targetAmount,
      'currentSavedAmount': currentSavedAmount,
      'progressPercent': progressPercent,
      'monthlyTarget': monthlyTarget,
      'currency': currency,
      'targetDate': targetDate,
      'plannedMonths': plannedMonths,
      'status': status,
      'isCompleted': isCompleted,
      'completedAt': completedAt,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  Goal copyWith({
    String? id,
    String? name,
    String? description,
    int? goalType,
    double? targetAmount,
    double? currentSavedAmount,
    double? progressPercent,
    double? monthlyTarget,
    int? currency,
    String? targetDate,
    int? plannedMonths,
    int? status,
    bool? isCompleted,
    String? completedAt,
    String? createdAt,
    String? updatedAt,
  }) {
    return Goal(
      id: id ,
      name: name ,
      description: description ,
      goalType: goalType ,
      targetAmount: targetAmount ,
      currentSavedAmount: currentSavedAmount ,
      progressPercent: progressPercent ,
      monthlyTarget: monthlyTarget ,
      currency: currency ,
      targetDate: targetDate ,
      plannedMonths: plannedMonths ,
      status: status ,
      isCompleted: isCompleted,
      completedAt: completedAt,
      createdAt: createdAt ,
      updatedAt: updatedAt
    );
  }
}

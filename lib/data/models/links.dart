class Links {
  final String telegram;
  final String email;

  Links({required this.telegram, required this.email});

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      telegram: json['telegramBotUrl'] as String,
      email: json['webPageUrl'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'telegramBotUrl': telegram, 'webPageUrl': email};
  }
}

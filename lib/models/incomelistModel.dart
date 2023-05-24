class Income {
  final String date;
  final String? description;
  final double amount;
  final String category;
  final String? image;

  Income({
    required this.date,
    this.description,
    required this.amount,
    required this.category,
    this.image,
  });

  factory Income.fromJson(Map<String, dynamic> json) {
    return Income(
      date: json['date'],
      description: json['description'],
      amount: double.parse(json['amount']),
      category: json['category'],
      image: json['image'],
    );
  }
}

class IncomeSummary {
  final String category;
  final double totalAmount;

  IncomeSummary({
    required this.category,
    required this.totalAmount,
  });

  factory IncomeSummary.fromJson(Map<String, dynamic> json) {
    return IncomeSummary(
      category: json['category'],
      totalAmount: json['total_amount'],
    );
  }
}



class IncomeCategory {
  final String category;
  final double totalAmount;

  IncomeCategory({
    required this.category,
    required this.totalAmount,
  });

  factory IncomeCategory.fromJson(Map<String, dynamic> json) {
    return IncomeCategory(
      category: json['category'],
      totalAmount: json['total_amount'].toDouble(),
    );
  }
}

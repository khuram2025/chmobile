class HomeAPI {
  final double totalIncome;
  final double totalExpense;
  final double netIncome;
  final String timeFilter;
  final List<Summary> summary;
  final List<Summary> expenseSummary;
  final List<Property> maleAnimals;
  final List<Property> femaleAnimals;
  final List<Property> animals;

  HomeAPI({
    required this.totalIncome,
    required this.totalExpense,
    required this.netIncome,
    required this.timeFilter,
    required this.summary,
    required this.expenseSummary,
    required this.maleAnimals,
    required this.femaleAnimals,
    required this.animals,
  });

  factory HomeAPI.fromJson(Map<String, dynamic> json) {
    return HomeAPI(
      totalIncome: json['total_income'],
      totalExpense: json['total_expense'],
      netIncome: json['net_income'],
      timeFilter: json['time_filter'],
      summary: (json['summary'] as List).map((i) => Summary.fromJson(i)).toList(),
      expenseSummary: (json['expense_summary'] as List).map((i) => Summary.fromJson(i)).toList(),
      maleAnimals: (json['male_animals'] as List).map((i) => Property.fromJson(i)).toList(),
      femaleAnimals: (json['female_animals'] as List).map((i) => Property.fromJson(i)).toList(),
      animals: (json['animals'] as List).map((i) => Property.fromJson(i)).toList(),
    );
  }
}

class Summary {
  final String category;
  final double totalAmount;

  Summary({
    required this.category,
    required this.totalAmount,
  });

  factory Summary.fromJson(Map<String, dynamic> json) {
    return Summary(
      category: json['category'],
      totalAmount: json['total_amount'],
    );
  }
}


class Property {
  final int id;
  final String tag;
  final String imageUrl;
  final String dob;
  final double purchaseCost;
  final String status;
  final String sex;
  final String animalType;

  Property({
    required this.id,
    required this.tag,
    required this.imageUrl,
    required this.dob,
    required this.purchaseCost,
    required this.status,
    required this.sex,
    required this.animalType,
  });

  factory Property.fromJson(Map<String, dynamic> json) {
    return Property(
      id: json['id'],
      tag: json['tag'],
      imageUrl: json['image'],
      dob: json['dob'],
      purchaseCost: json['purchase_cost'],
      status: json['status'],
      sex: json['sex'],
      animalType: json['animal_type'],
    );
  }
}

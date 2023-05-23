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

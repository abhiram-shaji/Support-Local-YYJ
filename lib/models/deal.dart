class Deal {
  final int id;
  final int businessId;
  final String discountText;
  final DateTime expiry;
  final String? image;

  Deal({
    required this.id,
    required this.businessId,
    required this.discountText,
    required this.expiry,
    this.image,
  });

  factory Deal.fromJson(Map<String, dynamic> json) {
    return Deal(
      id: json['id'] as int,
      businessId: json['businessId'] as int,
      discountText: json['discountText'] as String,
      expiry: DateTime.parse(json['expiry'] as String),
      image: json['image'] as String?,
    );
  }
}

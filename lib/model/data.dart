class Data {
  final int index;
  final String payName;
  final int quanity;
  final String expectPrice;
  final String expectPayment;
  final String budget;
  final String status;

  const Data({
    required this.index,
    required this.payName,
    required this.quanity,
    required this.expectPrice,
    required this.expectPayment,
    required this.budget,
    required this.status,
  });

  Data copy({
      int? index,
      String? payName,
      int? quanity,
      String? expectPrice,
      String? expectPayment,
      String? budget,
      String? status,
  }) =>
      Data(
        index: index ?? this.index,
        payName: payName ?? this.payName,
        quanity: quanity ?? this.quanity,
        expectPrice: expectPrice ?? this.expectPrice,
        expectPayment: expectPayment ?? this.expectPayment,
        budget: budget ?? this.budget,
        status: status ?? this.status,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Data &&
          runtimeType == other.runtimeType &&
          index == other.index &&
          payName == other.payName &&
          quanity == other.quanity &&
          expectPrice == other.expectPrice &&
          expectPayment == other.expectPayment &&
          budget == other.budget &&
          status == other.status;

  @override
  int get hashCode => index.hashCode ^ payName.hashCode ^ quanity.hashCode ^ expectPrice.hashCode ^ budget.hashCode ^ status.hashCode;
}

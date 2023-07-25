// ignore_for_file: public_member_api_docs, sort_constructors_first
class SkuOpenStock {
  SkuOpenStock({
    required this.period,
    required this.product,
    required this.quantity,
  });
  final String period;
  final String product;
  final int quantity;

  @override
  String toString() =>
      'SkuOpenStock(period: $period, product: $product, quantity: $quantity)';
}

class WunderkindProduct {
  final String productId;
  final String sku;
  final double price;
  final int quantity;

  WunderkindProduct({
    required this.productId,
    required this.sku,
    required this.price,
    required this.quantity,
  });

  factory WunderkindProduct.fromJson(Map<String, dynamic> map) {
    return WunderkindProduct(
      productId: map['productId'],
      sku: map['sku'],
      price: map['price'],
      quantity: map['quantity'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'sku': sku,
      'price': price,
      'quantity': quantity,
    };
  }
}

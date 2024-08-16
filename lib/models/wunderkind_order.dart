import 'package:wunderkind/models/wunderkind_customer.dart';
import 'package:wunderkind/models/wunderkind_invoice.dart';
import 'package:wunderkind/models/wunderkind_product.dart';

class WunderkindOrder {
  final String orderId;
  final WunderkindInvoice invoice;
  final String paymentMethod;
  final List<WunderkindProduct> products;
  final WunderkindCustomer customer;
  final List<String>? coupons;
  final String? goal;

  const WunderkindOrder({
    required this.orderId,
    required this.invoice,
    required this.paymentMethod,
    required this.products,
    required this.customer,
    this.coupons,
    this.goal,
  });

  factory WunderkindOrder.fromJson(Map<String, dynamic> map) {
    return WunderkindOrder(
      orderId: map['orderId'],
      invoice: WunderkindInvoice.fromJson(map['invoice']),
      paymentMethod: map['paymentMethod'],
      products: List<WunderkindProduct>.from(
        (map['products'] as List<Map<String, dynamic>>)
            .map((product) => WunderkindProduct.fromJson(product))
            .toList(),
      ),
      customer: WunderkindCustomer.fromJson(map['customer']),
      coupons: map['coupons'] as List<String>? ?? [],
      goal: map['goal'] ?? "purchase",
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'invoice': invoice.toMap(),
      'paymentMethod': paymentMethod,
      'products': List<Map<String, dynamic>>.from(
          products.map((product) => product.toMap()).toList()),
      'customer': customer.toMap(),
      'coupons': coupons ?? [],
      'goal': goal ?? "purchase",
    };
  }
}

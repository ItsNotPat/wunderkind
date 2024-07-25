import 'package:wunderkind/models/wunderkind_customer.dart';
import 'package:wunderkind/models/wunderkind_invoice.dart';

class WunderkindOrder {
  final String orderId;
  final WunderkindInvoice invoice;
  final String? paymentMethod;
  final WunderkindCustomer customer;
  final List<String>? coupons;
  final String? goal;

  const WunderkindOrder({
    required this.orderId,
    required this.invoice,
    this.paymentMethod,
    required this.customer,
    this.coupons,
    this.goal,
  });

  factory WunderkindOrder.fromJson(Map<String, dynamic> map) {
    return WunderkindOrder(
      orderId: map['productId'],
      invoice: WunderkindInvoice.fromJson(map['invoice']),
      paymentMethod: map['paymentMethod'],
      customer: WunderkindCustomer.fromJson(map['customer']),
      coupons: map['coupons'],
      goal: map['goal'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'orderId': orderId,
      'invoice': invoice.toMap(),
      'paymentMethod': paymentMethod,
      'customer': customer.toMap(),
      'coupons': coupons,
      'goal': goal,
    };
  }
}

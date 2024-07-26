import 'package:wunderkind/models/currency.dart';

class WunderkindInvoice {
  double amount;
  double tax;
  double shipping;
  double? totalDiscount;
  Currency currency;

  WunderkindInvoice({
    required this.amount,
    required this.tax,
    required this.shipping,
    this.totalDiscount,
    required this.currency,
  });

  factory WunderkindInvoice.fromJson(Map<String, dynamic> map) {
    return WunderkindInvoice(
      amount: map['amount'],
      tax: map['tax'],
      shipping: map['shipping'],
      totalDiscount: map['totalDiscount'],
      currency:
          CurrencyExtentions.fromCurrencyString(map['currency'].toString()) ??
              Currency.gbp,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'tax': tax,
      'shipping': shipping,
      'totalDiscount': totalDiscount,
      'currency': currency.toCurrencyString(),
    };
  }
}

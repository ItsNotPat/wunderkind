import 'package:flutter/material.dart';
import 'package:wunderkind/models/currency.dart';
import 'package:wunderkind/models/log_level.dart';
import 'package:wunderkind/models/screen_type.dart';
import 'package:wunderkind/models/wunderkind_category.dart';
import 'package:wunderkind/models/wunderkind_customer.dart';
import 'package:wunderkind/models/wunderkind_invoice.dart';
import 'package:wunderkind/models/wunderkind_order.dart';
import 'package:wunderkind/models/wunderkind_product.dart';
import 'package:wunderkind/wunderkind.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Wunderkind.initialize(webId: "web_id");
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Wunderkind Example'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Wunderkind.trackScreenView(
                    url: 'url',
                    screen: ScreenType.home,
                  );
                },
                child: const Text("Track Screen View"),
              ),
              ElevatedButton(
                onPressed: () {
                  Wunderkind.trackEmptyCart();
                },
                child: const Text("Track Empty Cart"),
              ),
              ElevatedButton(
                onPressed: () {
                  Wunderkind.trackViewItem(
                    itemId: 'item_id',
                    groupId: 'group_Id',
                  );
                },
                child: const Text("Track View Item"),
              ),
              ElevatedButton(
                onPressed: () {
                  Wunderkind.trackSelectSku(
                    groupId: 'group_id',
                    feedId: 'feed_id',
                  );
                },
                child: const Text("Track Select SKU"),
              ),
              ElevatedButton(
                onPressed: () {
                  Wunderkind.trackAddToCart(itemId: "item_id");
                },
                child: const Text("Track Add to Cart"),
              ),
              ElevatedButton(
                onPressed: () {
                  const WunderkindCategory category = WunderkindCategory(
                    categoryName: "category_name",
                    url: "url",
                    itemIds: ["item_id1", "item_id2", "item_id3"],
                  );
                  Wunderkind.trackViewCategory(category: category);
                },
                child: const Text("Track View Category"),
              ),
              ElevatedButton(
                onPressed: () {
                  const WunderkindCategory category = WunderkindCategory(
                    categoryName: "category_name",
                    url: "url",
                    itemIds: ["item_id1", "item_id2", "item_id3"],
                  );
                  Wunderkind.trackViewSearch(searchCategory: category);
                },
                child: const Text("Track View Search"),
              ),
              ElevatedButton(
                onPressed: () {
                  const WunderkindCustomer customer = WunderkindCustomer(
                    phone: 'phone',
                    email: 'test@test.com',
                  );
                  Wunderkind.trackLoggedIn(customer);
                },
                child: const Text("Track Logged In"),
              ),
              ElevatedButton(
                onPressed: () {
                  Wunderkind.trackLoggedOut();
                },
                child: const Text("Track Logged Out"),
              ),
              ElevatedButton(
                onPressed: () {
                  WunderkindOrder order = WunderkindOrder(
                    orderId: "order001",
                    paymentMethod: 'COD',
                    invoice: WunderkindInvoice(
                      amount: 300,
                      tax: 12.0,
                      shipping: 10,
                      currency: Currency.gbp,
                    ),
                    products: [
                      WunderkindProduct(
                        productId: "product_id",
                        sku: "sku",
                        price: 100,
                        quantity: 1,
                      ),
                      WunderkindProduct(
                        productId: "product_id",
                        sku: "sku",
                        price: 100,
                        quantity: 1,
                      ),
                      WunderkindProduct(
                        productId: "product_id",
                        sku: "sku",
                        price: 100,
                        quantity: 1,
                      ),
                    ],
                    customer: const WunderkindCustomer(
                      email: "test@test.com",
                      phone: "phone",
                    ),
                  );
                  Wunderkind.trackPurchase(order);
                },
                child: const Text("Track Purchase"),
              ),
              ElevatedButton(
                onPressed: () {
                  Wunderkind.trackTextOptIn(phone: 'phone');
                },
                child: const Text("Track Opt Int"),
              ),
              ElevatedButton(
                onPressed: () {
                  Wunderkind.setLogLevel(LogLevel.info);
                },
                child: const Text("Track Log level"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

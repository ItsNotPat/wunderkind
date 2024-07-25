import 'package:flutter/material.dart';
import 'package:wunderkind/models/screen_type.dart';
import 'package:wunderkind/models/wunderkind_category.dart';
import 'package:wunderkind/models/wunderkind_customer.dart';
import 'package:wunderkind/wunderkind.dart';
import 'package:wunderkind_example/service/wunderkind_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Wunderkind.initialize(webId: "your_web_id");
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
          title: const Text('Plugin example app'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                WunderkindService.trackScreenView(
                  'web_url',
                  ScreenType.home,
                );
              },
              child: const Text("Track Screen View"),
            ),
            ElevatedButton(
              onPressed: () {
                WunderkindService.trackEmptyCart();
              },
              child: const Text("Track Empty Cart"),
            ),
            ElevatedButton(
              onPressed: () {
                WunderkindService.trackViewItem("item_id", "group_id");
              },
              child: const Text("Track View Item"),
            ),
            ElevatedButton(
              onPressed: () {
                WunderkindService.trackSelectSku("feed_id", "group_id");
              },
              child: const Text("Track Select SKU"),
            ),
            ElevatedButton(
              onPressed: () {
                WunderkindService.addToCart("item_id");
              },
              child: const Text("Track Add to Cart"),
            ),
            ElevatedButton(
              onPressed: () {
                const WunderkindCategory category = WunderkindCategory(
                  categoryName: "Jackets",
                  url: "web_url",
                  itemIds: ["item_id1", "item_id2", "item_id3"],
                );
                WunderkindService.trackViewCategory(category);
              },
              child: const Text("Track View Category"),
            ),
            ElevatedButton(
              onPressed: () {
                const WunderkindCategory category = WunderkindCategory(
                  categoryName: "Jackets",
                  url: "web_url",
                  itemIds: ["item_id1", "item_id2", "item_id3"],
                );
                WunderkindService.trackViewSearch(category);
              },
              child: const Text("Track View Search"),
            ),
            ElevatedButton(
              onPressed: () {
                const WunderkindCustomer customer = WunderkindCustomer(
                  phone: 'phone',
                  email: 'email',
                );
                WunderkindService.trackLoggedIn(customer);
              },
              child: const Text("Track Logged In"),
            ),
            ElevatedButton(
              onPressed: () {
                WunderkindService.trackLoggedOut();
              },
              child: const Text("Track Logged Out"),
            ),
            ElevatedButton(
              onPressed: () {
                WunderkindService.trackTextOptIn('phone');
              },
              child: const Text("Track Opt Int"),
            ),
          ],
        ),
      ),
    );
  }
}

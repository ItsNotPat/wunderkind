# Wunderkind Plugin

This Flutter plugin provides a bridge to the Wunderkind SDK, enabling developers to leverage Wunderkind's powerful features in their Flutter applications. Easily identify anonymous website visitors, trigger personalized onsite experiences, and capture valuable customer data to enhance your marketing efforts.

## Getting Started

- Navigate to `build.gradle` in application's module (by default it's in `app` folder) and add these lines:

```
repositories {
        maven {
            url "https://us-central1-maven.pkg.dev/bx-production-coreapi/wunderkind-sdk-android"
        }
    }
```

- Then add dependencies in the same app's `build.gradle` file

```
implementation "co.wunderkind.sdk:wunderkindsdk:1.3.4"
```
## Usage/Examples

Here are some examples on how to use the plugin.

Initialize SDK with your WEBSITE_ID (If you don't know your WEBSITE_ID , please contact wunderkind support team), and set a corresponding environment configuration isDebugMode (details below). The initialization is mandatory. Failure to do so will result in the SDK being unable to track events properly. In most cases, this should be done in `main.dart`

```dart
Wunderkind.initialize(webId: "your_web_id");
```

**Screen view event**
- This event should be triggered when a user navigates to a new screen, within the app.
```dart
Wunderkind.trackScreenView('url', ScreenType);
```

**Empty cart event**
- This event should be triggered when a user empties a cart.
```dart
Wunderkind.trackEmptyCart();
```

**View item event**
- This event should be triggered when a user views an item.
```dart
Wunderkind.trackViewItem(itemId: 'item_id', groupId: 'group_id');
```

**Select SKU event**
- This event is triggered when a user selects specific product attributes (e.g. color, size, etc...) and contains SKU details that were selected.
```dart
Wunderkind.trackSelectSku(groupId: 'group_id', feedId: 'feed_id');
```

**Add to cart event**
- This event is triggered when a user adds an item to their cart.
```dart
Wunderkind.trackAddToCart(itemId: "item_id");
```

**View category event**
- This event is triggered when a user views the category screen.
```dart
const WunderkindCategory category = WunderkindCategory(
  categoryName: "category_name",
  url: "url",
  itemIds: ["item_id1", "item_id2", "item_id3"],
);


Wunderkind.trackViewCategory(category: category);
```

**View search event**
- This event is triggered when a user views a search results screen.
```dart
const WunderkindCategory category = WunderkindCategory(
    categoryName: "category_name",
    url: "url",
    itemIds: ["item_id1", "item_id2", "item_id3"],
);

Wunderkind.trackViewSearch(searchCategory: category);
```

**Logged in event**
- This event is triggered when a user explicitly successfully signed in to their app. This event is also triggered when a user signed up to their app.
```dart
const WunderkindCustomer customer = WunderkindCustomer(phone: 'phone', email: 'email');
Wunderkind.trackLoggedIn(customer);
```

**Logged out event**
- This event is called when a user logs out of the application.
```dart
Wunderkind.trackLoggedOut();
```

**Text Opt In Event**
- This event is triggered when a user opts in to text messaging.
```dart
Wunderkind.trackTextOptIn(phone: 'phone');
```

**Purchase event**
- This event is triggered when a user purchases an item and completes their order.
```dart
const WunderkindOrder order = WunderkindOrder(
    orderId: "orderId",
    invoice: WunderkindInvoice(),
    paymentMethod: "paymentMethod",
    customer: WunderkindCustomer(),
    coupons: ["coupon1","coupon2"],
    goal: "goal"
);

Wunderkind.trackPurchase(order);
```

**Logging**
- This event is called when a user logs out of the application.
```dart
Wunderkind.setLogLevel(LogLevel);
```




enum ScreenType {
  search,
  home,
  product,
  category,
  cart,
  article,
  gallery,
  checkout,
}

extension ScreenTypeExtension on ScreenType {
  String toScreenTypeString() {
    return name;
  }

  static ScreenType? fromCurrencyString(String currencyString) {
    try {
      return ScreenType.values.firstWhere((currency) =>
          currency.name.toLowerCase() == currencyString.toLowerCase());
    } catch (e) {
      return null;
    }
  }
}

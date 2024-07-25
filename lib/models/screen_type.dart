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
    return name.toUpperCase();
  }

  static ScreenType? fromCurrencyString(String currencyString) {
    try {
      return ScreenType.values.firstWhere((currency) =>
          currency.name.toUpperCase() == currencyString.toUpperCase());
    } catch (e) {
      return null;
    }
  }
}

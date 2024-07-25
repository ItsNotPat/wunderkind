enum Currency {
  USD,
  KRW,
  AED,
  LTL,
  ARS,
  MAD,
  AUD,
  MXN,
  BGN,
  MYR,
  BOB,
  NOK,
  BRL,
  NZD,
  CAD,
  PEN,
  CHF,
  PHP,
  CLP,
  PKR,
  CNY,
  PLN,
  COP,
  RON,
  CZK,
  RSD,
  DKK,
  RUB,
  EGP,
  SAR,
  EUR,
  SEK,
  GBP,
  SGD,
  HKD,
  THB,
  HRK,
  TRY,
  HUF,
  TWD,
  IDR,
  UAH,
  ILS,
  VEF,
  INR,
  VND,
  JPY,
  ZAR,
}

extension CurrencyExtentions on Currency {
  String toCurrencyString() {
    return name.toUpperCase();
  }

  static Currency? fromCurrencyString(String currencyString) {
    try {
      return Currency.values.firstWhere((currency) =>
          currency.name.toUpperCase() == currencyString.toUpperCase());
    } catch (e) {
      return null;
    }
  }
}

enum Currency {
  usd,
  krw,
  aed,
  ltl,
  ars,
  mad,
  aud,
  mxn,
  bgn,
  myr,
  bob,
  nol,
  brl,
  nzd,
  cad,
  pen,
  chf,
  php,
  clp,
  pkr,
  cny,
  pln,
  cop,
  ron,
  czk,
  rsd,
  dkk,
  rub,
  egp,
  sar,
  eur,
  sek,
  gbp,
  sgd,
  hkd,
  thb,
  hrk,
  turkishLira,
  huf,
  twd,
  idr,
  uah,
  ils,
  vef,
  inr,
  vnd,
  jpy,
  zar,
}

extension CurrencyExtentions on Currency {
  String toCurrencyString() {
    if (this == Currency.turkishLira) {
      return "TRY";
    }
    return name.toUpperCase();
  }

  static Currency? fromCurrencyString(String currencyString) {
    try {
      return Currency.values.firstWhere((currency) =>
          currency.name.toLowerCase() == currencyString.toLowerCase());
    } catch (e) {
      return null;
    }
  }
}

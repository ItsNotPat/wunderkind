enum LogLevel {
  none,
  debug,
  info,
}

extension LogLevelExtension on LogLevel {
  String toLogLevelString() {
    return name.toUpperCase();
  }

  static LogLevel? fromCurrencyString(String currencyString) {
    try {
      return LogLevel.values.firstWhere((currency) =>
          currency.name.toUpperCase() == currencyString.toUpperCase());
    } catch (e) {
      return null;
    }
  }
}

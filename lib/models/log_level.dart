enum LogLevel {
  none,
  debug,
  info,
}

extension LogLevelExtension on LogLevel {
  String toLogLevelString() {
    return name;
  }

  static LogLevel? fromCurrencyString(String currencyString) {
    try {
      return LogLevel.values.firstWhere((currency) =>
          currency.name.toLowerCase() == currencyString.toLowerCase());
    } catch (e) {
      return null;
    }
  }
}

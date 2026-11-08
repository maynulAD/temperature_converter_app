enum ConversionType {
  celsiusToFahrenheit,
  fahrenheitToCelsius,
}

extension ConversionTypeLabel on ConversionType {
  String get label {
    switch (this) {
      case ConversionType.celsiusToFahrenheit:
        return 'Celsius to Fahrenheit (°C → °F)';
      case ConversionType.fahrenheitToCelsius:
        return 'Fahrenheit to Celsius (°F → °C)';
    }
  }

  String get inputUnit {
    switch (this) {
      case ConversionType.celsiusToFahrenheit:
        return '°C';
      case ConversionType.fahrenheitToCelsius:
        return '°F';
    }
  }

  String get outputUnit {
    switch (this) {
      case ConversionType.celsiusToFahrenheit:
        return '°F';
      case ConversionType.fahrenheitToCelsius:
        return '°C';
    }
  }
}

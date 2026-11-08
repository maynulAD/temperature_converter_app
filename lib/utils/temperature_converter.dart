import 'package:temperature_converter_app/models/conversion_type.dart';

class TemperatureConverter {
  const TemperatureConverter._();

  static double convert(double value, ConversionType type) {
    switch (type) {
      case ConversionType.celsiusToFahrenheit:
        return (value * 9 / 5) + 32;
      case ConversionType.fahrenheitToCelsius:
        return (value - 32) * 5 / 9;
    }
  }
}

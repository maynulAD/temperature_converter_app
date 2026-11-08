import 'package:flutter_test/flutter_test.dart';
import 'package:temperature_converter_app/models/conversion_type.dart';
import 'package:temperature_converter_app/utils/temperature_converter.dart';

void main() {
  group('TemperatureConverter', () {
    test('converts Celsius to Fahrenheit', () {
      expect(
        TemperatureConverter.convert(
          0,
          ConversionType.celsiusToFahrenheit,
        ),
        32,
      );
    });

    test('converts Fahrenheit to Celsius', () {
      expect(
        TemperatureConverter.convert(
          72,
          ConversionType.fahrenheitToCelsius,
        ),
        closeTo(22.2222222, 0.000001),
      );
    });
  });
}

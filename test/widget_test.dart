import 'package:flutter_test/flutter_test.dart';
import 'package:temperature_converter_app/app.dart';

void main() {
  testWidgets('shows converter controls and validates empty input',
      (tester) async {
    await tester.pumpWidget(const TemperatureConverterApp());

    expect(find.text('Temperature Converter'), findsOneWidget);
    expect(find.text('Calculate'), findsOneWidget);

    await tester.tap(find.text('Calculate'));
    await tester.pump();

    expect(find.text('Please enter a temperature value.'), findsOneWidget);
  });
}

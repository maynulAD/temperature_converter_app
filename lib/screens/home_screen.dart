import 'package:flutter/material.dart';
import 'package:temperature_converter_app/models/conversion_type.dart';
import 'package:temperature_converter_app/utils/temperature_converter.dart';
import 'package:temperature_converter_app/widgets/conversion_dropdown.dart';
import 'package:temperature_converter_app/widgets/result_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _temperatureController = TextEditingController();

  ConversionType _conversionType = ConversionType.fahrenheitToCelsius;
  double? _result;

  @override
  void dispose() {
    _temperatureController.dispose();
    super.dispose();
  }

  void _calculate() {
    FocusScope.of(context).unfocus();

    if (!_formKey.currentState!.validate()) {
      setState(() => _result = null);
      return;
    }

    final input = double.parse(_temperatureController.text.trim());
    setState(() {
      _result = TemperatureConverter.convert(input, _conversionType);
    });
  }

  String? _validateTemperature(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Please enter a temperature value.';
    }

    final parsedValue = double.tryParse(value.trim());
    if (parsedValue == null || !parsedValue.isFinite) {
      return 'Please enter a valid number.';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Temperature Converter',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFFF5F7FC),
        surfaceTintColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(22, 22, 22, 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 520),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    padding: const EdgeInsets.all(22),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFFE9EDF5)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.035),
                          blurRadius: 22,
                          offset: const Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            height: 62,
                            width: 62,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEAF0FF),
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Icon(
                              Icons.device_thermostat_rounded,
                              color: Color(0xFF2457D6),
                              size: 34,
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Convert temperature',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF17213A),
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Enter a value and choose the conversion you need.',
                            style: TextStyle(
                              color: Color(0xFF7A8499),
                              height: 1.45,
                            ),
                          ),
                          const SizedBox(height: 26),
                          TextFormField(
                            controller: _temperatureController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                              signed: true,
                            ),
                            validator: _validateTemperature,
                            onChanged: (_) {
                              if (_result != null) {
                                setState(() => _result = null);
                              }
                            },
                            decoration: InputDecoration(
                              labelText: 'Temperature',
                              hintText: 'e.g. 72',
                              prefixIcon: const Icon(Icons.edit_rounded),
                              suffixText: _conversionType.inputUnit,
                            ),
                          ),
                          const SizedBox(height: 18),
                          ConversionDropdown(
                            value: _conversionType,
                            onChanged: (type) {
                              setState(() {
                                _conversionType = type;
                                _result = null;
                              });
                            },
                          ),
                          const SizedBox(height: 26),
                          SizedBox(
                            height: 54,
                            child: FilledButton.icon(
                              onPressed: _calculate,
                              icon: const Icon(Icons.calculate_rounded),
                              label: const Text(
                                'Calculate',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              style: FilledButton.styleFrom(
                                backgroundColor: const Color(0xFF2457D6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 22),
                  if (_result != null)
                    ResultCard(
                      result: _result!,
                      unit: _conversionType.outputUnit,
                    )
                  else
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 20,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF3FA),
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: const Row(
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            color: Color(0xFF6D7B96),
                          ),
                          SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Your converted temperature will appear here.',
                              style: TextStyle(
                                color: Color(0xFF68758E),
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

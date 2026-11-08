import 'package:flutter/material.dart';
import 'package:temperature_converter_app/models/conversion_type.dart';

class ConversionDropdown extends StatelessWidget {
  const ConversionDropdown({
    required this.value,
    required this.onChanged,
    super.key,
  });

  final ConversionType value;
  final ValueChanged<ConversionType> onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<ConversionType>(
      value: value,
      isExpanded: true,
      decoration: const InputDecoration(
        labelText: 'Conversion type',
        prefixIcon: Icon(Icons.swap_horiz_rounded),
      ),
      items: ConversionType.values
          .map(
            (type) => DropdownMenuItem<ConversionType>(
              value: type,
              child: Text(
                type.label,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
          .toList(),
      onChanged: (type) {
        if (type != null) onChanged(type);
      },
    );
  }
}

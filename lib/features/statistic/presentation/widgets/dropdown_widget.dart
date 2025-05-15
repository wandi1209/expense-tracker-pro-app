import 'dart:core';

import '../../../../core/configs/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  final String selectedType;
  final List<String> types;
  final ValueChanged<String> onChanged;

  const DropdownWidget({
    super.key,
    required this.selectedType,
    required this.types,
    required this.onChanged,
  });

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 120,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade700),
        borderRadius: BorderRadius.circular(10),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          dropdownColor: Colors.white,
          value: widget.selectedType,
          onChanged: (value) {
            if (value != null) {
              widget.onChanged(value);
            }
          },
          items:
              widget.types.map((type) {
                return DropdownMenuItem(
                  value: type,
                  child: Text(
                    type,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontSize: 15,
                    ),
                  ),
                );
              }).toList(),
        ),
      ),
    );
  }
}

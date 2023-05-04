import 'package:flutter/material.dart';

import 'package:silver_market/theme.dart';

class DefaultInputField extends StatelessWidget {
  const DefaultInputField({
    Key? key,
    required this.hint,
    this.prefixIcon,
    this.controller,
    this.onValueChange,
  }) : super(key: key);

  final String hint;
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final ValueChanged<String>? onValueChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onValueChange,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hint,
        hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: SilverAppColors.giratina500,
              fontWeight: FontWeight.normal,
            ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        filled: true,
        fillColor: SilverAppColors.giratina100,
      ),
    );
  }
}

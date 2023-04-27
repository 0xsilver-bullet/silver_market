import 'package:flutter/material.dart';
import 'package:silver_market/theme.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
    this.controller,
    this.onValueChange,
  }) : super(key: key);

  final TextEditingController? controller;
  final ValueChanged<String>? onValueChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onValueChange,
      decoration: InputDecoration(
        prefixIcon: const Icon(
          Icons.search,
          color: SilverAppColors.giratina500,
        ),
        hintText: 'Search',
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

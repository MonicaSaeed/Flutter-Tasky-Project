import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String hintText;
  final int maxLines;
  final String title;
  final Function(String?)? validator;
  final TextEditingController controller;

  const CustomFormField({
    super.key,
    required this.title,
    required this.hintText,
    this.maxLines = 1,
    this.validator,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(height: 8),
        TextField(
          cursorColor: const Color(0xFFFFFFFF),
          maxLines: maxLines,
          style: Theme.of(context).textTheme.displaySmall,
          decoration: InputDecoration(
            hintText: hintText,
          ),
        ),
      ],
    );
  }
}

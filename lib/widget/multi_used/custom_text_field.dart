import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final TextInputType inputType;
  final int maxLines;
  final Function(String? val)? onSaved;

  const CustomTextField({
    Key? key,
    required this.title,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
    this.onSaved,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(title),
      ),
      keyboardType: inputType,
      maxLines: maxLines,
      textAlignVertical: TextAlignVertical.top,
      onSaved: onSaved,
    );
  }
}

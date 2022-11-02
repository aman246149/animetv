import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.controller,
    required this.text,
    this.validator,
  }) : super(key: key);

  final TextEditingController controller;
  final String text;
  final FormFieldValidator? validator;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
              // filled: true
              border: InputBorder.none,
              hintText: text),
        ),
      ),
    );
  }
}

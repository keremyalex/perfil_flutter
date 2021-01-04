import 'package:flutter/material.dart';

class BuildFormText extends StatelessWidget {
  const BuildFormText({
    Key key,
    @required this.controller, this.labelText, this.hintText, this.icono,
  }) : super(key: key);

  final TextEditingController controller;
  final String labelText, hintText;
  final Icon icono;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: icono,
          floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
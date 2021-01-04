import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BuildFormNumber extends StatelessWidget {
  const BuildFormNumber({
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
      keyboardType: TextInputType.number,
      inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
      decoration: InputDecoration(
          labelText: labelText,
          hintText: hintText,
          suffixIcon: icono,
          floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
    );
  }
}
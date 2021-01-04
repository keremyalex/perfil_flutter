import 'package:flutter/material.dart';
import 'package:perfil/pages/register/components/body.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Registro',
          style: Theme.of(context).appBarTheme.textTheme.headline5,
        ),
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: Body(),
    );
  }
}

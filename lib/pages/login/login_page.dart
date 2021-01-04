import 'package:flutter/material.dart';
import 'package:perfil/pages/login/components/body.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Bienvenido',
            style: Theme.of(context).appBarTheme.textTheme.headline5,
          ),
        ),
        body: Body());
  }
}

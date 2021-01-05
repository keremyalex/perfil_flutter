import 'package:flutter/material.dart';
import 'package:perfil/components/default_button.dart';
import 'package:perfil/components/mostrar_alerta.dart';
import 'package:perfil/pages/register/components/build_form_email.dart';
import 'package:perfil/pages/register/components/build_form_password.dart';
import 'package:perfil/services/auth_service.dart';
import 'package:provider/provider.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final emailCtrl = new TextEditingController();
  final passwordCtrl = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BuildFormEmail(
          controller: emailCtrl,
          labelText: 'Email',
          hintText: 'Ingrese su correo',
          icono: Icon(Icons.alternate_email),
        ),
        SizedBox(
          height: 30,
        ),
        BuildFormPassword(
          controller: passwordCtrl,
          labelText: 'Contraseña',
          hintText: 'Ingrese su contraseña',
          icono: Icon(Icons.lock),
        ),
        SizedBox(
          height: 30,
        ),
        DefaultButton(
          text: 'Continue',
          press: () async {
            print(emailCtrl.text);
            print(passwordCtrl.text);
            final authService =
                Provider.of<AuthService>(context, listen: false);

            final loginOk = await authService.login(
                emailCtrl.text.trim(), passwordCtrl.text.trim());
            if (loginOk) {
              Navigator.pushNamedAndRemoveUntil(context, 'ProfilePage', (route) => false);
            } else {
              mostrarAlerta(context, 'Estado del Login', 'Error al ingresar');
            }
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:perfil/pages/login/components/labels.dart';
import 'package:perfil/pages/login/components/login_form.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 190,
                child: Lottie.asset('assets/lotties/people.json')
              ),
              SizedBox(
                height: 15,
              ),
              LoginForm(),
              SizedBox(
                height: 20,
              ),
              Labels(
                  ruta: 'RegisterPage',
                  titulo: '¿No tienes una cuenta?',
                  subTitulo: 'Registrate ahora!')
            ],
          ),
        ),
      ),
    );
  }
}

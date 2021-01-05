import 'package:flutter/material.dart';
import 'package:perfil/pages/profile/components/body.dart';
import 'package:perfil/services/auth_service.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<bool> _onBackPressed() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.0))),
            title: Text('¿Estás seguro?'),
            content: Text('Vas a cerrar sesión de la aplicación!!'),
            actions: <Widget>[
              MaterialButton(
                child: Text('NO'),
                elevation: 5,
                color: Colors.orangeAccent[700],
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              MaterialButton(
                child: Text('SI'),
                elevation: 5,
                color: Colors.orangeAccent[700],
                onPressed: () {
                  AuthService.logout();
                  Navigator.pushNamedAndRemoveUntil(
                      context, 'LoginPage', (route) => false);
                },
              ),
              SizedBox(width: 5,)
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mis Datos',
          style: Theme.of(context).appBarTheme.textTheme.headline5,
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              _onBackPressed();
            },
          )
        ],
      ),
      body: WillPopScope(onWillPop: _onBackPressed, child: Body()),
    );
  }
}

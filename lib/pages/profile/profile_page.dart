import 'package:flutter/material.dart';
import 'package:perfil/pages/profile/components/body.dart';
import 'package:perfil/services/auth_service.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis Datos', style: Theme.of(context).appBarTheme.textTheme.headline5,),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(icon: Icon(Icons.exit_to_app), 
            onPressed: (){
              AuthService.logout();
              Navigator.pushReplacementNamed(context, 'LoginPage');
            }, 
          )
        ],
      ),
      body: Body(),
    );
  }
}

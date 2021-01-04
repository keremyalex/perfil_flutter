import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:perfil/routes/routes.dart';
import 'package:perfil/services/auth_service.dart';
import 'package:perfil/theme.dart';
import 'package:provider/provider.dart';

Future main() async{
  await DotEnv().load('.env');
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthService())],
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        title: 'Perfil',
        initialRoute: 'LoginPage',
        routes: routes,
      ),
    );
  }
}

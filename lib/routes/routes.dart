import 'package:flutter/material.dart';
import 'package:perfil/pages/login/login_page.dart';
import 'package:perfil/pages/profile/profile_page.dart';
import 'package:perfil/pages/register/register_page.dart';

final Map<String, WidgetBuilder> routes = {
  'LoginPage'     : (context) => LoginPage(),
  'RegisterPage'  : (context) => RegisterPage(),
  'ProfilePage'   : (context) => ProfilePage()
};
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:perfil/models/login_response.dart';
import 'package:perfil/models/usuario.dart';
import 'package:http/http.dart' as http;

class AuthService with ChangeNotifier {
  Usuario usuario;
  bool _autenticando = false;
  final _storage = new FlutterSecureStorage();

  bool get autenticando => this._autenticando;

  set autenticando(bool valor) {
    this._autenticando = valor;
    notifyListeners();
  }

  Future<bool> login(String email, String password) async {
    this.autenticando = true;

    final data = {'email': email, 'password': password};

    final resp = await http.post(DotEnv().env['API_LOGIN'], body: data);

    this.autenticando = false;

    if (resp.statusCode == 200) {
      print('Conexion Exitosa');
      print(resp.body);
      final loginResponse = loginResponseFromJson(resp.body);
      this.usuario = loginResponse.usuario;
      //Guardar el Token en el dispositivo
      await this._guardarToken(loginResponse.token);
      print('El nombre del usuario es: ' + usuario.name);
      return true;
    } else {
      print('Error en la conexion');
      return false;
    }
  }

  Future<bool> register(String name, String email, String direction,
      String telephone, String password, String image, String filename) async {
    final data = {
      'name': name,
      'direction': direction,
      'telephone': telephone,
      'email': email,
      'password': password,
      'image': image,
      'filename': filename
    };
    print(data);
    final resp = await http.post(DotEnv().env['API_REGISTER'], body: data);
    print(data['name']);
    print(data['image']);
    print(data['filename']);
    print(resp.body);
    //this.autenticando = false;
    if (resp.statusCode == 200) {
      print('Registro Exitoso, procede LOGIN');
      return await login(email, password);
    } else {
      print('Error en la conexión login despues de registro');
      return false;
    }
  }

  static Future<void> logout() async {
    final _storage = new FlutterSecureStorage();
    final token = await _storage.read(key: 'token');
    final resp = await http.get(DotEnv().env['API_LOGOUT'],
        headers: {'Authorization': 'Bearer $token'});

    if (resp.statusCode == 200) {
      print('Conexión Exitosa para eliminar delete token');
      print(resp.body);
      await _storage.delete(key: 'token');
    } else {
      print('Error en la desconexión delete token');
    }
  }

  Future _guardarToken(String token) async {
    return await _storage.write(key: 'token', value: token);
  }

  // Future logout() async {
  //   await _storage.delete(key: 'token');
  // }
}

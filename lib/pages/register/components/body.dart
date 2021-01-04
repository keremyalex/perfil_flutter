import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:perfil/components/default_button.dart';
import 'package:perfil/components/mostrar_alerta.dart';
import 'package:perfil/pages/register/components/build_form_email.dart';
import 'package:perfil/pages/register/components/build_form_number.dart';
import 'package:perfil/pages/register/components/build_form_password.dart';
import 'package:perfil/pages/register/components/build_form_text.dart';
import 'package:perfil/services/auth_service.dart';
import 'package:provider/provider.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final nameCtrl = new TextEditingController();
  final directionCtrl = new TextEditingController();
  final telephoneCtrl = new TextEditingController();
  final emailCtrl = new TextEditingController();
  final passwordCtrl = new TextEditingController();
  //Imagen
  File _image;
  final picker = ImagePicker();

  Future getImageCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            //Avatar
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(width: 30,),
                Align(
                  alignment: Alignment.center,
                  child: CircleAvatar(
                    radius: 95,
                    backgroundColor: Colors.orangeAccent[700],
                    child: ClipOval(
                      child: SizedBox(
                        width: 180.0,
                        height: 180.0,
                        child: (_image != null)
                            ? Image.file(
                                _image,
                                fit: BoxFit.fill,
                              )
                            : Image.asset(
                              'assets/images/avatar.png',
                              fit: BoxFit.fill,
                            )
                      ),
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 60.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.camera_alt,
                          size: 30.0,
                        ),
                        onPressed: () {
                          getImageCamera();
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.add_photo_alternate,
                          size: 30.0,
                        ),
                        onPressed: () {
                          getImageGallery();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            BuildFormText(
              controller: nameCtrl,
              labelText: 'Nombre',
              hintText: 'Ingrese su nombre',
              icono: Icon(Icons.person),
            ),
            SizedBox(
              height: 30,
            ),
            BuildFormText(
              controller: directionCtrl,
              labelText: 'Dirección',
              hintText: 'Escriba su dirección',
              icono: Icon(Icons.home),
            ),
            SizedBox(
              height: 30,
            ),
            BuildFormNumber(
              controller: telephoneCtrl,
              labelText: 'Teléfono',
              hintText: 'Ingrese su teléfono',
              icono: Icon(Icons.phone),
            ),
            SizedBox(
              height: 30,
            ),
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
              labelText: 'Password',
              hintText: 'Ingrese su contraseña',
              icono: Icon(Icons.lock),
            ),
            SizedBox(
              height: 20,
            ),

            DefaultButton(
              text: 'Registrar',
              press: () async {
                if (_image == null) return;
                String base64Image = base64Encode(_image.readAsBytesSync());
                String fileName = _image.path.split("/").last;

                final registroOk = await authService.register(
                    nameCtrl.text.trim(),
                    emailCtrl.text.trim(),
                    directionCtrl.text.trim(),
                    telephoneCtrl.text.trim(),
                    passwordCtrl.text.trim(),
                    base64Image,
                    fileName);
                print('Resgistro es: $registroOk');
                if (registroOk) {
                  Navigator.pushReplacementNamed(context, 'ProfilePage');
                } else {
                  mostrarAlerta(context, 'Login y Registro incorrecto',
                      'Revise sus credenciales nuevamente');
                }
              },
            ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    ));
  }
}

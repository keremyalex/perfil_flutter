import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:perfil/pages/profile/components/profile_data.dart';
import 'package:perfil/pages/profile/components/profile_image.dart';
import 'package:perfil/services/auth_service.dart';
import 'package:provider/provider.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    final usuario = authService.usuario;
    return Column(
      children: [
        ProfileImage(
          image: usuario.profilePhoto != null
              ? DotEnv().env['API_URL'] + usuario.profilePhoto
              : null,
        ),
        ProfileData(
          icon: 'assets/icons/User Icon.svg',
          text: usuario.name,
        ),
        ProfileData(
          icon: 'assets/icons/Location point.svg',
          text: usuario.direction,
        ),
        ProfileData(
          icon: 'assets/icons/Call.svg',
          text: '${usuario.telephone}',
        ),
        ProfileData(
          icon: 'assets/icons/email.svg',
          text: usuario.email,
        ),
        SizedBox(height: 40,)
      ],
    );
  }
}

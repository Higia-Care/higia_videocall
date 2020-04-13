import 'package:flutter/material.dart';

class WelcomeUserText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final styleTextWelcome =
        TextStyle(fontSize: 18, fontWeight: FontWeight.w700);
    final size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      width: size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Hola, bienvenido', style: styleTextWelcome),
          Text('Para ingresar a la terapia ingrese su ID',
              style: styleTextWelcome),
        ],
      ),
    );
  }
}

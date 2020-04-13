import 'package:flutter/material.dart';
import '../constants/constants_ui.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(
      {@required this.buttonTextLogin, @required this.functionOnPress});
  final Function functionOnPress;
  final String buttonTextLogin;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onPressed: functionOnPress,
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Text(
          buttonTextLogin,
          style: TextStyle(fontSize: 20),
        ),
      ),
      color: ksecundaryHeaderColorTheme,
      textColor: Colors.white,
    );
  }
}

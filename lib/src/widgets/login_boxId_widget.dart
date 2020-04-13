import 'package:flutter/material.dart';
import 'package:higia_videoCall/src/constants/constants_ui.dart';

class LoginBoxId extends StatelessWidget {
  const LoginBoxId({
    Key key,
    @required TextEditingController channelController,
    @required bool validateError,
  })  : _channelController = channelController,
        _validateError = validateError,
        super(key: key);

  final TextEditingController _channelController;
  final bool _validateError;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: _channelController,
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.perm_identity),
          errorText: _validateError ? 'El ID es obligatorio' : null,
          border: UnderlineInputBorder(
            borderSide: BorderSide(width: 1),
          ),
          hintText: 'Ingrese ID',
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kprimaryColorTheme)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kprimaryColorTheme)),
          disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kprimaryColorTheme)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kprimaryColorTheme)),
          focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kprimaryColorTheme)),
        ),
      ),
    );
  }
}

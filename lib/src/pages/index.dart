import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../src/constants/constants_ui.dart';
import '../../src/constants/user_aggrement.dart';
import '../../src/widgets/login_boxId_widget.dart';
import '../../src/widgets/login_button.dart';
import '../../src/widgets/welcome_user_text_widget.dart';
import '../widgets/logo_higia.dart';
import './call.dart';

class IndexPage extends StatefulWidget {
  static String route = 'IndexPage';
  @override
  State<StatefulWidget> createState() => IndexState();
}

class IndexState extends State<IndexPage> {
  /// create a channelController to retrieve text value
  final _channelController = TextEditingController();
  final String buttonTextLogin = 'Unirme a la terapia';
  bool userPrivacityButtonStatus = false;

  /// if channel textField is validated to have error
  bool _validateError = false;

  @override
  void dispose() {
    // dispose input controller
    _channelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: size.height * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            LogoHigia(),
            SizedBox(height: size.height * 0.05),
            Column(
              children: <Widget>[
                WelcomeUserText(),
                LoginBoxId(
                  channelController: _channelController,
                  validateError: _validateError,
                ),
                SizedBox(height: size.height * 0.02),
                userAgreementWidget(context),
                SizedBox(height: size.height * 0.02),
                LoginButton(
                  buttonTextLogin: buttonTextLogin,
                  functionOnPress: onJoin,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  ///This method return the user agreement like a alertDialog
  Row userAgreementWidget(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) => AlertDialog(
                title: Text(
                  'Acuerdo de usuario',
                  style: TextStyle(color: themeData.accentColor),
                ),
                content: Text(userAgrement),
                elevation: 10,
                scrollable: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      'No acepto',
                      style: TextStyle(
                        color: Colors.black54,
                      ),
                    ),
                    onPressed: () {
                      setState(() => userPrivacityButtonStatus = false);
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'Si acepto',
                      style: TextStyle(
                        color: themeData.accentColor,
                      ),
                    ),
                    onPressed: () {
                      setState(() => userPrivacityButtonStatus = true);
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              barrierDismissible: false,
            );
          },
          child: Text(
            'Antes de ingresar acepta nuestra politica de privacidad',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        ),
        Checkbox(
          onChanged: (value) {
            setState(() => userPrivacityButtonStatus = value);
          },
          value: userPrivacityButtonStatus,
          activeColor: kprimaryColorTheme,
        ),
      ],
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty && userPrivacityButtonStatus) {
      // await for camera and mic permissions before pushing video page
      if (Platform.isAndroid || Platform.isIOS) {
        await _handleCameraAndMic();
        // push video page with given channel name
      }
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CallPage(
            channelName: _channelController.text,
          ),
        ),
      );
    }
  }

  Future<void> _handleCameraAndMic() async {
    Permission statusCamera = Permission.camera;
    Permission statusMicrophone = Permission.microphone;
    if (await statusCamera.isUndetermined ||
        await statusMicrophone.isUndetermined) {
      await [statusCamera, statusMicrophone].request();
    }
  }
}

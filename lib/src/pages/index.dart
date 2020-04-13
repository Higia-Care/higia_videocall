import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:higia_videoCall/src/widgets/login_boxId_widget.dart';
import 'package:higia_videoCall/src/widgets/login_button.dart';
import 'package:higia_videoCall/src/widgets/welcome_user_text_widget.dart';
import 'package:permission_handler/permission_handler.dart';
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          LogoHigia(),
          SizedBox(height: size.height * 0.05),
          SingleChildScrollView(
            child: Column(
              children: <Widget>[
                WelcomeUserText(),
                LoginBoxId(
                  channelController: _channelController,
                  validateError: _validateError,
                ),
                SizedBox(height: size.height * 0.05),
                LoginButton(
                  buttonTextLogin: buttonTextLogin,
                  functionOnPress: onJoin,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> onJoin() async {
    // update input validation
    setState(() {
      _channelController.text.isEmpty
          ? _validateError = true
          : _validateError = false;
    });
    if (_channelController.text.isNotEmpty) {
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

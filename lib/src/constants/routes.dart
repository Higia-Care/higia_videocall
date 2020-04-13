import 'package:flutter/material.dart';
import 'package:higia_videoCall/src/pages/call.dart';
import 'package:higia_videoCall/src/pages/index.dart';

Map<String, Widget Function(BuildContext)> routes = {
  IndexPage.route: (BuildContext context) => IndexPage(),
  CallPage.route: (BuildContext context) => CallPage()
};

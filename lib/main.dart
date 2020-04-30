import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './src/constants/routes.dart';
import './src/pages/index.dart';
import 'src/constants/constants_ui.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //TODO: Add google analytics
    return MaterialApp(
      title: 'Higia call',
      debugShowCheckedModeBanner: false,
      initialRoute: IndexPage.route,
      theme: themeData,
      routes: routes,
    );
  }
}

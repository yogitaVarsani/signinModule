
import 'package:flutter/material.dart';

import 'main_screen/LoginPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Abel'),
      initialRoute: LoginPage.id,
      routes: {
        //RegisterPage.id: (context) => RegisterPage(),
        LoginPage.id: (context) => LoginPage(),
        //ForgotPassword.id: (context) => ForgotPassword(),
        //Done.id: (context) => Done(),
      },
    );
  }
}



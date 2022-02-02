import 'package:authmodule/main_screen/ForgotPassPage.dart';
import 'package:authmodule/main_screen/RegisterPage.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart' show ModalProgressHUD;

bool _wrongEmail = false;
bool _wrongPassword = false;

class LoginPage extends StatefulWidget {
  static String id = '/LoginPage';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email;
  late String password;
  String emailText = 'Email doesn\'t match';
  String passwordText = 'Password doesn\'t match';
  var _formKey = GlobalKey<FormState>();
  bool _showSpinner = false;

  void _submit() {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/images/background.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 60.0, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Login',
                    style: TextStyle(fontSize: 50.0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Please login',
                        style: TextStyle(fontSize: 30.0),
                      ),
                      Text(
                        'to your account',
                        style: TextStyle(fontSize: 30.0),
                      ),
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                            hintText: 'Email',
                            labelText: 'Email',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value) {
                            //Validator
                          },
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value)) {
                              return 'Enter a valid email!';
                            }
                            return null;
                          },
                        ),
                        //box styling
                        const SizedBox(height: 20.0),
                        //text input
                        TextFormField(
                          decoration:
                              const InputDecoration(labelText: 'Password',hintText:'Password' ),
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value) {},
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter a valid password!';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 15.0),
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context, MaterialPageRoute(builder: (context) => ForgotPassPage()));
                            },
                            child: const Text(
                              'Forgot Password?',
                              style:
                                  TextStyle(fontSize: 20.0, color: Colors.blue),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        MaterialButton(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          color: const Color(0xff447def),
                          minWidth: 120,
                          child: const Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 24.0,color: Colors.white
                            ),
                          ),
                          onPressed: () => _submit(),
                        )
                      ],
                    ),
                  ),
                  /*Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 1.0,
                          width: 60.0,
                          color: Colors.black87,
                        ),
                      ),
                      const Text(
                        'Or',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Container(
                          height: 1.0,
                          width: 60.0,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: MaterialButton(
                          padding: const EdgeInsets.symmetric(vertical: 5.0),
                          color: Colors.white,
                          shape: const ContinuousRectangleBorder(
                            side: BorderSide(width: 0.5, color: Colors.grey),
                          ),
                          onPressed: () {
                            // onGoogleSignIn(context);
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/google.png',
                                  fit: BoxFit.contain,
                                  width: 40.0,
                                  height: 40.0),
                              const Text(
                                'Google',
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: MaterialButton(
                          padding: EdgeInsets.symmetric(vertical: 5.0),
                          color: Colors.white,
                          shape: const ContinuousRectangleBorder(
                            side: BorderSide(width: 0.5, color: Colors.grey),
                          ),
                          onPressed: () {
                            //TODO: Implement facebook functionality
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/facebook.png',
                                  fit: BoxFit.cover, width: 40.0, height: 40.0),
                              const Text(
                                'Facebook',
                                style: TextStyle(
                                    fontSize: 25.0, color: Colors.black),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Don\'t have an account?',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context, MaterialPageRoute(builder: (context) => RegisterPage()));
                        },
                        child: const Text(
                          ' Sign Up',
                          style: TextStyle(fontSize: 25.0, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

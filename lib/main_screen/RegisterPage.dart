import 'package:authmodule/main_screen/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart' show ModalProgressHUD;

class RegisterPage extends StatefulWidget {
  static String id = '/RegisterPage';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
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
      body: ModalProgressHUD(
        inAsyncCall: _showSpinner,
        color: Colors.blueAccent,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Image.asset('assets/images/background.png'),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10.0, bottom: 60, left: 20.0, right: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    'Register',
                    style: TextStyle(fontSize: 50.0),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Please register',
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
                            hintText: 'User Name',
                            labelText: 'User Name',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          onFieldSubmitted: (value) {
                            //Validator
                          },
                          validator: (value) {
                            if (value!.isEmpty ) {
                              return 'Enter a valid username!';
                            }
                            return null;
                          },
                        ),
                        //box styling
                        const SizedBox(height: 20.0),
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
                        const SizedBox(height: 40.0),
                        MaterialButton(
                          minWidth: 150,
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          color: const Color(0xff447def),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              fontSize: 24.0,color: Colors.white
                            ),
                          ),
                          onPressed: () => _submit(),
                        )
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Already have an account?',
                        style: TextStyle(fontSize: 25.0),
                      ),
                      GestureDetector(
                        onTap: () {
                           Navigator.pushNamed(context, LoginPage.id);
                        },
                        child: const Text(
                          ' Sign In',
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

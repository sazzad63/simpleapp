import 'package:flutter/material.dart';
import 'package:simpleapp/forgotpassword.dart';
import 'package:simpleapp/createaccount.dart';
import 'package:simpleapp/dashboard.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

final _formKey = GlobalKey<FormState>();

String? validateEmail(String? email) {
  RegExp emailRegex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  final isValidateEmail = emailRegex.hasMatch(email ?? '');
  if (!isValidateEmail) {
    return 'Please type your valid email.';
  }
  return null;
}

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 80),
                  child: Image.asset(
                    "assets/images/logo.png",
                    width: 180,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Enter username'),
                      // validator: (uname)=>uname!.isEmpty? 'Please type your username':null,
                      // validator: validateEmail,
                      validator: validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            labelText: 'Enter password'),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: Validators.compose([
                          Validators.required('Enter your password'),
                          Validators.minLength(
                              4, 'Password cannot be less than 4 characters'),
                          Validators.maxLength(
                              6, 'Password cannot be greater than 6 characters')
                        ])),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextButton(
                  onPressed: () {
                    // print("forgot password");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ForgotPassword(),
                          maintainState: false),
                    );
                  },
                  child: const Text(
                    'Recovery Password?',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // _formKey.currentState!.validate();
                    if (_formKey.currentState!.validate()) {
                      //   print("Success");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Dashboard(),
                            maintainState: false),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(200, 50),
                      elevation: 5,
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      textStyle: const TextStyle(
                          // fontSize: 18,
                          fontWeight: FontWeight.bold)),
                  child: const Text(
                    "LOGIN",
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('You have no account?'),
                      Padding(
                        padding: const EdgeInsets.only(left: 1.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CreateAccount(),
                                  maintainState: false),
                            );
                          },
                          child: const Text(
                            'Create New Account',
                            style: TextStyle(color: Colors.blue, fontSize: 15),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 80,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

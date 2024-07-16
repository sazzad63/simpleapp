import 'package:flutter/material.dart';
import 'package:simpleapp/main.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

final _formKey = GlobalKey<FormState>();

final _passwordController = TextEditingController();
final _confirmPasswordController = TextEditingController();

String? validateEmail(String? email) {
  RegExp emailRegex = RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$');
  final isValidateEmail = emailRegex.hasMatch(email ?? '');
  if (!isValidateEmail) {
    return 'Please type your valid email.';
  }
  return null;
}

class CreateAccount extends StatelessWidget {
  const CreateAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MyApp(),
                      maintainState: false),
                );
              },
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
            ),
            title: const Text(
              "Create New Account",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blue,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Enter email"),
                      validator: validateEmail,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: "Enter password",
                      ),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: Validators.compose([
                        Validators.required("Enter password"),
                        Validators.minLength(4, 'Password cannot be less than 4 characters'),
                        Validators.maxLength(6, 'Password cannot be greater than 6 characters'),
                      ]),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
                    child: TextFormField(
                      controller: _confirmPasswordController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          ),
                          labelText: "Enter confirm password"),
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Confirm password can not be empty';
                        }else if(value !=_passwordController.text){
                          return 'Password & confirm password does not match';
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 1),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          //   print("Success");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const MyApp(),
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
                        "REGISTER NOW",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account? "),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MyApp(),
                                  maintainState: false),
                            );
                          },
                          child: const Text(" Login Account"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

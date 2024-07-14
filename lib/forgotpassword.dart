import 'package:flutter/material.dart';
import 'package:simpleapp/main.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

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
              "Recovery Password",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.blue,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, bottom: 10),
                  child: const Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        'Enter your email, instruction sent to your email.',
                      )),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 1),
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 30,
                      right: 30,
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          labelText: 'Enter your email'),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Container(
                  padding: const EdgeInsets.only(top: 1),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        elevation: 5,
                        backgroundColor: Colors.blueAccent,
                        foregroundColor: Colors.white,
                        textStyle: const TextStyle(
                            // fontSize: 18,
                            fontWeight: FontWeight.bold)),
                    child: const Text(
                      "SUBMIT",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:simpleapp/main.dart';

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
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Enter email"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Enter password"),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 20, right: 30),
                  child: TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        labelText: "Enter confirm password"),
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
    );
  }
}

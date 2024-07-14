import 'package:flutter/material.dart';
import 'package:simpleapp/main.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
          child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "MyApp", style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Colors.blue,
          iconTheme: const IconThemeData(color: Colors.white),
          actions: [
            // IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert),)
            PopupMenuButton(itemBuilder:(context)=>[
              const PopupMenuItem<int>(
                value: 0,
                child: Row(
                  children: [
                    Icon(Icons.settings, color: Colors.black,),
                    SizedBox(width: 5,),
                    Text("Setting"),
                  ],
                ),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: Row(
                  children: [
                    Icon(Icons.logout, color: Colors.black,),
                    SizedBox(width: 5,),
                    Text("Logout"),
                  ],
                ),
              )
            ], onSelected: (item)=>selectedItem(context, item),)
          ],
        ),

        drawer: Drawer(
          // backgroundColor: Colors.white70,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
               const DrawerHeader(
                 decoration: BoxDecoration(
                   color: Color.fromRGBO(0, 100, 100, 1.0),
                 ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 95,
                        width: 95,
                        child: CircleAvatar(
                          backgroundImage: AssetImage("assets/images/1680441987454.jpeg"),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        "Md. Sazzad Hossain", style: TextStyle(
                          fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18
                      ),)
                    ],
                  ),
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 10,),
                    Text("Home", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                        maintainState: false),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.verified_user),
                    SizedBox(width: 10,),
                    Text("My Profile", style: TextStyle(fontWeight: FontWeight.bold),),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                        maintainState: false),
                  );
                },
              ),
              const Divider(),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.supervised_user_circle),
                    SizedBox(width: 10,),
                    Text("My Team", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const Dashboard(),
                        maintainState: false),
                  );
                },
              ),
              const SizedBox(height: 200,),
              SizedBox(
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MyApp(),
                              maintainState: false),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(200, 50),
                          elevation: 5,
                          backgroundColor: Colors.blueAccent,
                          foregroundColor: Colors.white,
                          textStyle: const TextStyle(
                            fontSize: 18,
                              fontWeight: FontWeight.bold)),
                      child: const Text(
                        "Logout",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  selectedItem(BuildContext context, int item) {
    switch(item){
      case 0: Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const Dashboard(),
            maintainState: false),
      );
      break;
      case 1: Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => const MyApp(),
            maintainState: false),
      );
      break;
    }
  }
}

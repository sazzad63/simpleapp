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
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
               DrawerHeader(
                  child: Column(
                    children: [
                      SizedBox(
                        child: CircleAvatar(
                          minRadius: 50,
                          maxRadius: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Image.asset("assets/images/flutter-icon.png"),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      const Text(
                        "Sazzad Hossain", style: TextStyle(
                          fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),)
                    ],
                  ),
              ),
              Column(
                children: [
                  ListTile(
                    title: const Row(
                      children: [
                        Icon(Icons.list),
                        SizedBox(width: 10,),
                        Text("Item 1"),
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
                ],
              ),
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.category),
                    SizedBox(width: 10,),
                    Text("Item 2"),
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
              ListTile(
                title: const Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 10,),
                    Text("Logout"),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyApp(),
                        maintainState: false),
                  );
                },
              )
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

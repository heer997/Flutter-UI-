import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "App Drawer Three",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
      ),
      home: const AppDrawerThree(),
    );
  }
}

class AppDrawerThree extends StatelessWidget {
  const AppDrawerThree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: SafeArea(
          child: Column(
            children: [
              ExpansionTile(
                textColor: Colors.blue,
                iconColor: Colors.blue,
                title: const Text(
                  "Parent Category 1",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "parent category 1",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.person),
                childrenPadding: const EdgeInsets.only(left: 40.0),
                children: [
                  ListTile(
                    title: const Text("Child Category 1"),
                    subtitle: const Text("child category 1"),
                    trailing: const Text(
                      "1",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text("Child Category 2"),
                    subtitle: const Text("child category 2"),
                    trailing: const Text(
                      "2",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
              ExpansionTile(
                textColor: Colors.blue,
                iconColor: Colors.blue,
                title: const Text(
                  "Parent Category 2",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  "parent category 2",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                leading: const Icon(Icons.person),
                childrenPadding: const EdgeInsets.only(left: 40.0),
                children: [
                  ListTile(
                    title: const Text("Child Category 1"),
                    subtitle: const Text("child category 1"),
                    trailing: const Text(
                      "1",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  ListTile(
                    title: const Text("Child Category 2"),
                    subtitle: const Text("child category 2"),
                    trailing: const Text(
                      "2",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text("App Drawer"),
      ),
    );
  }
}

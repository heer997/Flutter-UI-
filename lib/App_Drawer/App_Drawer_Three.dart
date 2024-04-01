import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
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
      home: AppDrawerThree(),
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
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("Child Category 2"),
                    subtitle: const Text("child category 2"),
                    onTap: () {},
                  ),
                ],
              ),
              ExpansionTile(
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
                    onTap: () {},
                  ),
                  ListTile(
                    title: const Text("Child Category 2"),
                    subtitle: const Text("child category 2"),
                    onTap: () {},
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

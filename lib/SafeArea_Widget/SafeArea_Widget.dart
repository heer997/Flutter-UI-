import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Safe Area Widget",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
      ),
      home: const SafeAreaWidget(),
    );
  }
}

class SafeAreaWidget extends StatelessWidget {
  const SafeAreaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "SafeArea Widget",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SafeArea(
          top: false,
          bottom: true,
          right: true,
          left: true,
          child: Center(
            child: ListView(
              children: const <Widget>[
                Text(
                  "Some Text for the Flutter SafeArea Widget purpose Demo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                Divider(),
                Text(
                  "Some Text for the Flutter SafeArea Widget purpose Demo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                Divider(),
                Text(
                  "Some Text for the Flutter SafeArea Widget purpose Demo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                Divider(),
                Text(
                  "Some Text for the Flutter SafeArea Widget purpose Demo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                Divider(),
                Text(
                  "Some Text fot the Flutter SafeArea Widget purpose Demo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                Divider(),
                Text(
                  "Some Text for the Flutter SafeArea Widget purpose Demo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
                Divider(),
                Text(
                  "Some Text for the Flutter SafeArea Widget purpose Demo",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

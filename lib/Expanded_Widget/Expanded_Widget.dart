import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expanded Widget",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
      ),
      home: const ExpandedWidget(),
    );
  }
}

class ExpandedWidget extends StatelessWidget {
  const ExpandedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expanded Widget in Flutter",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              width: 50.0,
              height: 100.0,
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 50.0,
              height: 100.0,
              color: Colors.brown,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: 50.0,
              height: 100.0,
              color: Colors.yellow,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              width: 50.0,
              height: 100.0,
              color: Colors.green,
            ),
          ),
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.orange,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.green,
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: 100.0,
                  height: 100.0,
                  color: Colors.purple,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

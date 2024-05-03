import "package:flutter/material.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "RichText Widget",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
      ),
      home: const RichTextWidget(),
    );
  }
}

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "RichText Widget",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: RichText(
          text: const TextSpan(
            style: TextStyle(color: Colors.grey, fontSize: 30.0),
            children: <TextSpan>[
              TextSpan(text: "Hello "),
              TextSpan(
                text: "World! ",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    color: Colors.blue),
              ),
              TextSpan(
                text: "Welcome to ",
              ),
              TextSpan(
                text: "Flutter",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40.0,
                  color: Colors.deepOrangeAccent,
                  fontStyle: FontStyle.italic,
                  fontFamily: "FontsOne",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

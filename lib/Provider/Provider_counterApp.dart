import "package:flutter/material.dart";
import "package:flutter_practices/Provider/changeNotifierDemo.dart";
import "package:provider/provider.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return CounterApp();
      },
      child: MaterialApp(
        title: "Provider CounterApp",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.grey,
            centerTitle: true,
          ),
        ),
        home: const CounterPractice(),
      ),
    );
  }
}

class CounterPractice extends StatelessWidget {
  const CounterPractice({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterApp>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Counter App Using Provider Practice",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Counter Value",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            const SizedBox(height: 30.0),
            Text(
              "${counter.count}",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const NextPage();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                fixedSize: const Size(350.0, 50.0),
                shape: const LinearBorder(),
              ),
              child: const Text(
                "Go to Next Page",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.increment();
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add, color: Colors.white, size: 30.0),
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CounterApp>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CounterApp with Provider",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Counter Value in Next Page",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            const SizedBox(height: 40.0),
            Text(
              "${counter.count}",
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
            ),
          ],
        ),
      ),
    );
  }
}

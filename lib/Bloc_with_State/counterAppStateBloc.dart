import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_practices/Bloc_with_State/counterBloc_Class.dart";
import "package:flutter_practices/Bloc_with_State/counter_events.dart";

import "counterApp_States.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBlocState>(
      create: (context) {
        return CounterBlocState();
      },
      child: MaterialApp(
        title: "CounterApp with Bloc with State",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.grey,
            centerTitle: true,
          ),
        ),
        home: const CounterAppStateBloc(),
      ),
    );
  }
}

class CounterAppStateBloc extends StatelessWidget {
  const CounterAppStateBloc({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build Method Called...");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CounterApp Bloc with State",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBlocState>().add(IncrementEventsState());
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add, color: Colors.white, size: 30.0),
          ),
          const SizedBox(width: 20.0),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBlocState>().add(DecrementEventsState());
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.remove, color: Colors.white, size: 30.0),
          ),
        ],
      ),
      body: BlocBuilder<CounterBlocState, CounterStates>(
        builder: (context, state) {
          print("Builder...");
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  state.countvalue.toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 50.0),
                ),
                const SizedBox(height: 50.0),
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
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    final CounterBlocState counterObject =
        BlocProvider.of<CounterBlocState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Next Page",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Counter Value is : ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
            ),
            const SizedBox(height: 40.0),
            Text(
              counterObject.state.countvalue.toString(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
            ),
          ],
        ),
      ),
    );
  }
}

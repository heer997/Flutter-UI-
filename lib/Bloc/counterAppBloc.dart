import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_practices/Bloc/counterbloc.dart";
import "package:flutter_practices/Bloc/counterevents.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CounterBloc();
      },
      child: MaterialApp(
        title: "counterApp with Bloc",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.grey,
            centerTitle: true,
          ),
        ),
        home: const CounterAppBloc(),
      ),
    );
  }
}

class CounterAppBloc extends StatelessWidget {
  const CounterAppBloc({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build Method Called...");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CounterApp with Bloc",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(IncrementEvent());
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add, size: 30.0, color: Colors.white),
          ),
          const SizedBox(width: 20.0),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterBloc>().add(DecrementEvent());
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.remove, size: 30.0, color: Colors.white),
          ),
        ],
      ),
      body: BlocBuilder<CounterBloc, int>(
        builder: (context, state) {
          print("Builder...");
          return Center(
            child: Text(
              state.toString(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
            ),
          );
        },
      ),
    );
  }
}

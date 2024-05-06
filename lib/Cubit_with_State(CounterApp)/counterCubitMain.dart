import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_practices/Cubit_with_State(CounterApp)/counterCubitApp.dart";
import "package:flutter_practices/Cubit_with_State(CounterApp)/counterState.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CounterCubitClass();
      },
      child: MaterialApp(
        title: "CounterApp with Cubit with State",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.grey,
            centerTitle: true,
          ),
        ),
        home: const CounterCubitMain(),
      ),
    );
  }
}

class CounterCubitMain extends StatelessWidget {
  const CounterCubitMain({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build Method Called...");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CounterApp with Cubit with States",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterCubitClass, CounterState>(
          builder: (context, state) {
            print("Builder...");
            return Text(
              state.countvalue.toString(),
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubitClass>().increment();
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add, color: Colors.white, size: 30.0),
          ),
          const SizedBox(width: 20.0),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubitClass>().decrement();
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.remove, color: Colors.white, size: 30.0),
          ),
        ],
      ),
    );
  }
}

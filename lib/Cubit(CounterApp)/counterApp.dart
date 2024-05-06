import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_practices/Cubit(CounterApp)/counterCubit.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return CounterCubit();
      },
      child: MaterialApp(
        title: "Bloc Example",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.grey,
            centerTitle: true,
          ),
        ),
        home: const CounterPageCubit(),
      ),
    );
  }
}

class CounterPageCubit extends StatelessWidget {
  const CounterPageCubit({super.key});

  @override
  Widget build(BuildContext context) {
    print("Build Method Called...");
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "CounterPage",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) {
            print("Builder...");
            return Center(
              child: Text(
                state.toString(),
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 40.0),
              ),
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.add, size: 30.0, color: Colors.white),
          ),
          const SizedBox(width: 20.0),
          FloatingActionButton(
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
            backgroundColor: Colors.blue,
            child: const Icon(Icons.remove, size: 30.0, color: Colors.white),
          ),
        ],
      ),
    );
  }
}

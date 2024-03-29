import "package:flutter/material.dart";
import "package:syncfusion_flutter_calendar/calendar.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Segmented Button",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
      ),
      home: const HomePage4(),
    );
  }
}

class HomePage4 extends StatefulWidget {
  const HomePage4({super.key});

  @override
  State<HomePage4> createState() {
    return HomePage4State();
  }
}

class HomePage4State extends State<HomePage4> {
  final CalendarController _controller = CalendarController();
  Set<String> selected = {"day"};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Segmented Button with ButtonSegment",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              SegmentedButton(
                segments: const [
                  ButtonSegment(
                    value: "day",
                    label: Text("Day"),
                    icon: Icon(Icons.calendar_view_day),
                  ),
                  ButtonSegment(
                    value: "week",
                    label: Text("week"),
                    icon: Icon(Icons.calendar_view_month),
                  ),
                  ButtonSegment(
                    value: "month",
                    label: Text("month"),
                    icon: Icon(Icons.calendar_view_month),
                  ),
                ],
                selected: selected,
                onSelectionChanged: (Set<String> newSelected) {
                  setState(
                    () {
                      selected = newSelected;
                    },
                  );
                  if (selected.first == "day") {
                    _controller.view = CalendarView.day;
                  } else if (selected.first == "week") {
                    _controller.view = CalendarView.week;
                  } else {
                    _controller.view = CalendarView.month;
                  }
                },
              ),
              Expanded(
                child: SfCalendar(
                  controller: _controller,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

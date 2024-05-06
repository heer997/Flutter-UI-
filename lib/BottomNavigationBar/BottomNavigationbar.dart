import "package:flutter/material.dart";
import "package:flutter_practices/BottomNavigationBar/Screens/explore_screen.dart";
import "package:flutter_practices/BottomNavigationBar/Screens/home_screen.dart";
import "package:flutter_practices/BottomNavigationBar/Screens/myprofile_screen.dart";
import "package:flutter_practices/BottomNavigationBar/Screens/notifications_screen.dart";
import "package:flutter_practices/BottomNavigationBar/Screens/settings_screen.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BottomNavigationBar",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.grey,
          centerTitle: true,
        ),
      ),
      home: const BottomNavigationBarPracticeWslc(),
    );
  }
}

class BottomNavigationBarPracticeWslc extends StatefulWidget {
  const BottomNavigationBarPracticeWslc({super.key});

  @override
  State<BottomNavigationBarPracticeWslc> createState() =>
      _BottomNavigationBarPracticeWslcState();
}

class _BottomNavigationBarPracticeWslcState
    extends State<BottomNavigationBarPracticeWslc> {
  int selectedIndex = 0;

  List<Widget> navPages = [
    const HomeScreen(),
    const ExploreScreen(),
    const MyProfileScreen(),
    const NotificationsScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BottomNavigationBar",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      /// Below is the First Way for bottomNavigationBar (like WhatsApp):
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(
            selectedIcon: Icon(Icons.home, color: Colors.white),
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.explore, color: Colors.white),
            icon: Icon(Icons.explore_outlined),
            label: "Explore",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.account_circle, color: Colors.white),
            icon: Icon(Icons.account_circle_outlined),
            label: "My Profile",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.notifications, color: Colors.white),
            icon: Icon(Icons.notifications_outlined),
            label: "Notifications",
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.settings, color: Colors.white),
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
        indicatorColor: Colors.grey,
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) {
          setState(
            () {
              selectedIndex = value;
            },
          );
        },
      ),

      /// Below is the Second Way for bottomNavigationBar :
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.explore),
      //       label: "Explore",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.account_circle_outlined),
      //       label: "My Profile",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.notifications),
      //       label: "Notifications",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.settings),
      //       label: "Settings",
      //     ),
      //   ],
      //   unselectedItemColor: Colors.grey,
      //   selectedItemColor: Colors.blue,
      //   currentIndex: selectedIndex,
      //   onTap: (value) {
      //     selectedIndex = value;
      //     setState(() {});
      //   },
      // ),

      body: navPages[selectedIndex],
    );
  }
}

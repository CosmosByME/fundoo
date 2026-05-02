import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class HomePage extends StatefulWidget {
  final int currentIndex;

  final Widget child;

  const HomePage({super.key, required this.currentIndex, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: (index) {
          if (widget.currentIndex != index) {
            String page = switch (index) {
              0 => 'main-page',
              1 => 'statistics',
              2 => 'games',
              3 => 'profile',
              _ => 'main-page',
            };
            context.goNamed(page);
          }
        },
        selectedIconTheme: IconThemeData(color: Color(0xFF2563EB)),
        unselectedIconTheme: IconThemeData(color: Color(0xFF94A3B8)),
        selectedLabelStyle: TextStyle(
          color: Color(0xFF2563EB),
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        unselectedLabelStyle: TextStyle(
          color: Color(0xFF94A3B8),
          fontWeight: FontWeight.bold,
          fontSize: 10,
        ),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            label: 'Games',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
